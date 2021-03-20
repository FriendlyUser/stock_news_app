import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import './core/nav/bloc/sidebar_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_news_app/utils/simple_bloc_observer.dart';
import 'package:stock_news_app/modules/nav/bloc/nav_bloc.dart';
import 'package:stock_news_app/widgets/CustomDrawer.dart' show CustomDrawer;
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
          create: (_) => NavBloc(),
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
        body: BlocBuilder<NavBloc, NavBlocState>(
          buildWhen: (previousState, state) {
            print(previousState);
            print(state);
            return state.isDrawerOpen != previousState.isDrawerOpen;
          },
          builder: (context, state) {
            return FoldableSidebarBuilder(
              drawerBackgroundColor: Colors.deepOrange,
              drawer: CustomDrawer(
                key: UniqueKey(),
                closeDrawer: () {
                  setState(() {
                    NavBloc navbloc = BlocProvider.of<NavBloc>(context);
                    // context.read<NavbarCubit>().closeDrawer();
                    navbloc.add(NavDrawerClose(0, state.currentPage));
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
              status: FSBStatus.values[state.isDrawerOpen],
            );
          },
        ),
        floatingActionButton: BlocBuilder<NavBloc, NavBlocState>(
          builder: (context, state) {
            return FloatingActionButton(
                backgroundColor: Colors.deepOrange,
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    NavBloc navBloc = BlocProvider.of<NavBloc>(context);
                    print(state.isDrawerOpen);
                    print(FSBStatus.values[state.isDrawerOpen]);
                    if (FSBStatus.values[state.isDrawerOpen] == FSBStatus.FSB_OPEN) 
                    {
                      print("CLOSING");
                      navBloc.add(NavDrawerClose(1, state.currentPage));
                    } else {
                      print("OPENING");
                      navBloc.add(NavDrawerOpen(0, state.currentPage));
                    } 
                  });
                });
          },
        ),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withAlpha(200),
      child: Center(
        child: Text(
          "Click on FAB to Open Drawer",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}