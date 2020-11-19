import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_project/ui/screens/discover.dart';
import 'package:cinema_project/ui/screens/downloads.dart';
import 'package:cinema_project/ui/screens/home.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class App extends StatefulWidget {
  @override
  _App createState() => _App();
}

class _App extends State<App> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int currentTab;

  Widget home;
  Widget discover;
  Widget downloads;

  @override
  void initState() {
    home = Home(drawerFunction: openTheDrawer);
    discover = Discover();
    downloads = Downloads();
    currentTab = 0;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Theme
          .of(context)
          .scaffoldBackgroundColor,
      statusBarColor: Theme
          .of(context)
          .scaffoldBackgroundColor,
    ));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: _buildDrawer(context),
        body: IndexedStack(
          index: currentTab,
          children: _pages(),
        ),
        bottomNavigationBar: _buildNavigationBar(),
      ),
    );
  }

  List<Widget> _pages() {
    return <Widget>[
      stackedPage(0, home),
      stackedPage(1, discover),
      stackedPage(2, downloads),
    ];
  }

  Offstage stackedPage(int index, child) {
    return Offstage(
        offstage: currentTab != index,
        child: TickerMode(enabled: currentTab == index, child: child));
  }

  _buildNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentTab,
      // showUnselectedLabels: false,
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      unselectedItemColor:
      Theme
          .of(context)
          .textTheme
          .headline1
          .color
          .withOpacity(0.42),
      selectedItemColor: Theme
          .of(context)
          .accentColor
          .withOpacity(0.81),
      selectedLabelStyle:
      TextStyle(fontWeight: FontWeight.w700, fontSize: 12.5, height: 2),
      unselectedLabelStyle:
      TextStyle(fontWeight: FontWeight.w700, fontSize: 11.5),
      elevation: 35.0,
      onTap: (int index) {
        //This is for test
        setState(() {
          currentTab = index;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(FeatherIcons.home), label: tr('firstPageTitle')),
        BottomNavigationBarItem(
            icon: Icon(FeatherIcons.search), label: tr('secondPageTitle')),
        BottomNavigationBarItem(
            icon: Icon(FeatherIcons.download), label: tr('thirdPageTitle')),
      ],
    );
  }

  ///Components
  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      elevation: 5,
      child: Container(
        color: Theme
            .of(context)
            .scaffoldBackgroundColor,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 60,
                        ),
                        SizedBox(height: 10),
                        Text(tr('appName'),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                                'https://images.unsplash.com/photo-1582648871034-149d26d4aad5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'))),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(FeatherIcons.settings, size: 20),
                        SizedBox(width: 10),
                        Text('translate',
                            style: TextStyle(fontSize: 17, height: 2.2))
                            .tr(),
                      ],
                    ),
                    onTap: () {
                      EasyLocalization
                          .of(context)
                          .locale == Locale('ar', 'IQ') ? EasyLocalization
                          .of(context)
                          .locale = Locale('en', 'US') : EasyLocalization
                          .of(context)
                          .locale = Locale('ar', 'IQ');
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(FeatherIcons.share2, size: 20),
                        SizedBox(width: 10),
                        Text('connect',
                            style: TextStyle(fontSize: 17, height: 2.2))
                            .tr(),
                      ],
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(FeatherIcons.paperclip, size: 20),
                        SizedBox(width: 10),
                        Text('terms',
                            style: TextStyle(fontSize: 17, height: 2.2))
                            .tr(),
                      ],
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(FeatherIcons.info, size: 20),
                        SizedBox(width: 10),
                        Text('about',
                            style: TextStyle(fontSize: 17, height: 2.2))
                            .tr(),
                      ],
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.all(50),
                child: Text(tr('version', args: ['1.0.0']),
                    style: TextStyle(fontSize: 17, color: Colors.grey)))
          ],
        ),
      ),
    );
  }

  openTheDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }
}
