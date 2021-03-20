import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import './core/nav/bloc/sidebar_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './widgets/FirstScreen.dart';
import './widgets/CustomDrawer.dart';
void main() {
  runApp(MyApp());
}

// the main is structured with pages that have the root navigation
// clearly visible
// and those pages and go to the named routes
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BlocProvider(
          create: (_) => NavbarCubit(),
          child: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // FSBStatus drawerStatus = FSBStatus.FSB_OPEN;
  PageController _pageController = PageController(initialPage: 0);
  var selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<NavbarCubit, int>(
          builder: (context, state) {
            return FoldableSidebarBuilder(
              drawerBackgroundColor: Colors.deepOrange,
              drawer: CustomDrawer(
                key: UniqueKey(),
                closeDrawer: () {
                  setState(() {
                    context.read<NavbarCubit>().closeDrawer();
                  });
                },
              ),
              screenContents: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: <Widget>[
                  Center(
                    child: Container(child: FirstScreen() //first screen,
                        ),
                  ),
                  Center(
                    child: Container(child: FirstScreen() //second screen
                        ),
                  ),
                  Center(
                    child: Container(child: FirstScreen() //third screen,
                        ),
                  ),

                  //You have to define all screens here
                ],
              ),
              status: FSBStatus.values[state],
            );
          },
        ),
        floatingActionButton: BlocBuilder<NavbarCubit, int>(
          builder: (context, state) {
            return FloatingActionButton(
                backgroundColor: Colors.deepOrange,
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    FSBStatus.values[state] == FSBStatus.FSB_OPEN
                        ? context.read<NavbarCubit>().closeDrawer()
                        : context.read<NavbarCubit>().openDrawer();
                  });
                });
          },
        ),
      ),
    );
  }
}
