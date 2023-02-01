// import 'package:radial_button/widget/circle_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // useMaterial3: true,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class NavigationItem {
  final String label;
  final IconData icon;
  const NavigationItem({required this.label, required this.icon}) : super();
}

const List<NavigationItem> items = [
  NavigationItem(label: "Home", icon: Icons.home),
  NavigationItem(label: "Feed", icon: Icons.feed),
  NavigationItem(label: "Settings", icon: Icons.settings),
  NavigationItem(label: "Liked1", icon: Icons.favorite),
];

var itemsActionBar = [
  FloatingActionButton(
    backgroundColor: Colors.greenAccent,
    onPressed: () {},
    child: Icon(Icons.add),
  ),
  FloatingActionButton(
    backgroundColor: Colors.indigoAccent,
    onPressed: () {},
    child: Icon(Icons.camera),
  ),
  FloatingActionButton(
    backgroundColor: Colors.orangeAccent,
    onPressed: () {},
    child: Icon(Icons.card_giftcard),
  ),
];
final navigationBarItems = items
    .map((item) =>
        BottomNavigationBarItem(icon: Icon(item.icon), label: item.label))
    .toList();
final navigationRailDestinations = items
    .map((item) => NavigationRailDestination(
        icon: Icon(item.icon),
        label:
            Padding(padding: const EdgeInsets.all(0), child: Text(item.label))))
    .toList();

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _pages = [
    Container(
      // color: Colors.amber,
      child: Text('Home'),
      alignment: Alignment.center,
    ),
    Container(
      child: Text('Section 2'),
      alignment: Alignment.center,
    ),
    Container(
      child: Text('Section 3'),
      alignment: Alignment.center,
    ),
    Container(
      child: Text('Section 4'),
      alignment: Alignment.center,
    ),
    Container(
      child: Text('Section 5'),
      alignment: Alignment.center,
    ),
  ];
  int _index = 0;
  void _setIndex(int index) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        extendBody: true,
        // appBar: AppBar(
        //     // Here we take the value from the MyHomePage object that was created by
        //     // the App.build method, and use it to set our appbar title.

        //     // title: Text(widget.title),
        //     ),
        bottomNavigationBar: MediaQuery.of(context).size.width <= 1024
            ? BottomAppBar(
                shape: const CircularNotchedRectangle(),
                notchMargin: 5,
                clipBehavior: Clip.antiAlias,
                // color: Colors.redAccent.withAlpha(0),
                elevation: 10,
                // color: Colors.blue,
                child: Container(
                    child: BottomNavigationBar(
                  elevation: 9,
                  backgroundColor: Colors.red.shade400,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _index,
                  unselectedItemColor: Colors.white,
                  selectedItemColor: Colors.amber.shade400,
                  selectedLabelStyle: const TextStyle(color: Colors.amber),
                  onTap: _setIndex,
                  items: navigationBarItems,
                  useLegacyColorScheme: false,
                  enableFeedback: true,
                )))
            : null,
        // bottomNavigationBar: BottomAppBar(
        //   //bottom navigation bar on scaffold
        //   color: Colors.redAccent,
        //   shape: CircularNotchedRectangle(), //shape of notch
        //   notchMargin:
        //       5, //notche margin between floating button and bottom appbar
        //   child: Row(
        //     //children inside bottom appbar
        //     mainAxisSize: MainAxisSize.max,
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: <Widget>[
        //       Padding(
        //         padding: EdgeInsets.only(left: 90),
        //         child: IconButton(
        //           icon: Icon(
        //             Icons.menu,
        //             color: Colors.white,
        //           ),
        //           onPressed: () {},
        //         ),
        //       ),
        //       IconButton(
        //         icon: Icon(
        //           Icons.search,
        //           color: Colors.white,
        //         ),
        //         onPressed: () {},
        //       ),
        //       IconButton(
        //         icon: Icon(
        //           Icons.print,
        //           color: Colors.white,
        //         ),
        //         onPressed: () {},
        //       ),
        //       IconButton(
        //         icon: Icon(
        //           Icons.people,
        //           color: Colors.white,
        //         ),
        //         onPressed: () {},
        //       ),
        //     ],
        //   ),
        // ),

        // floatingActionButton: FloatingActionButton(
        //   //Floating action button on Scaffold
        //   onPressed: () {
        //     //code to execute on button press
        //   },
        //   child: Icon(Icons.send), //icon inside button
        // ),
        floatingActionButton: MediaQuery.of(context).size.width <= 1024
            ? SpeedDial(
                //Speed dial menu
                // marginBottom: 10, //margin bottom
                icon: Icons.menu, //icon on Floating action button
                activeIcon: Icons.close, //icon when menu is expanded on button
                backgroundColor:
                    Colors.amber.shade400, //background color of button
                foregroundColor:
                    Colors.white, //font color, icon color in button
                activeBackgroundColor: Colors
                    .red.shade400, //background color when menu is expanded
                activeForegroundColor: Colors.white,
                buttonSize: Size(56, 56), //button size
                visible: true,
                closeManually: false,
                curve: Curves.bounceIn,
                overlayColor: Colors.grey,
                overlayOpacity: 0,
                onOpen: () => print('OPENING DIAL'), // action when menu opens
                onClose: () => print('DIAL CLOSED'), //action when menu closes

                elevation: 1.0, //shadow elevation of button
                shape: CircleBorder(), //shape of button

                children: [
                  SpeedDialChild(
                    //speed dial child
                    child: Icon(Icons.accessibility),
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.white,
                    label: 'First Menu Child',
                    labelStyle: TextStyle(fontSize: 18.0),
                    onTap: () => print('FIRST CHILD'),
                    onLongPress: () => print('FIRST CHILD LONG PRESS'),
                  ),
                  SpeedDialChild(
                    child: Icon(Icons.brush),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    // label: 'Second Menu Child',
                    labelStyle: TextStyle(fontSize: 18.0),
                    onTap: () => print('SECOND CHILD'),
                    onLongPress: () => print('SECOND CHILD LONG PRESS'),
                  ),
                  SpeedDialChild(
                    child: Icon(Icons.keyboard_voice),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    label: 'Third Menu Child',
                    labelStyle: TextStyle(fontSize: 18.0),
                    onTap: () => print('THIRD CHILD'),
                    onLongPress: () => print('THIRD CHILD LONG PRESS'),
                  ),

                  //add more menu item childs here
                ],
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Stack(children: [
          Row(
            children: [
              if (MediaQuery.of(context).size.width > 1024)
                Container(
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(200),
                          topRight: Radius.circular(200),
                          bottomLeft: Radius.circular(200),
                          bottomRight: Radius.circular(200)),
                    ),
                    child: NavigationRail(
                        onDestinationSelected: _setIndex,
                        destinations: navigationRailDestinations,
                        labelType: NavigationRailLabelType.all,
                        backgroundColor: Colors.transparent,
                        extended: false,
                        useIndicator: true,
                        selectedIconTheme:
                            const IconThemeData(color: Colors.amber),
                        indicatorColor: Colors.white,
                        unselectedIconTheme:
                            const IconThemeData(color: Colors.white),
                        selectedLabelTextStyle: const TextStyle(
                          color: Colors.amber,
                          backgroundColor: Colors.white,
                        ),
                        unselectedLabelTextStyle:
                            const TextStyle(color: Colors.white),
                        selectedIndex: _index)),
              Expanded(child: _pages[_index]),
            ],
          ),
        ]));
  }
}
