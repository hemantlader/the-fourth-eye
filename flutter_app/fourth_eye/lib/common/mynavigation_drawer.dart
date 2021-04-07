import "package:flutter/material.dart";
import 'navigation_model.dart';
import "navigationTile.dart";
import "dart:ui";
import '../screens/homepage.dart';
import '../screens/dashboard.dart';
import '../screens/people.dart';
import '../screens/notifications.dart';
import '../screens/live_feed.dart';
import '../screens/profile.dart';
import '../screens/automate_home.dart';
import '../screens/credits.dart';

Widget pageChild = Dashboard();

class MyNavigationDrawer extends StatefulWidget {
  @override
  _MyNavigationDrawerState createState() {
    return _MyNavigationDrawerState();
  }
}

class _MyNavigationDrawerState extends State<MyNavigationDrawer>
    with TickerProviderStateMixin {
  int currentSelected = 0;
  final maxWidth = 250.0;
  final minWidth = 50.0;
  final blurAmt = 2.0;
  final gradOpacity = 0.75;
  bool isCollapsed = true;

  AnimationController _animationController;
  Animation<double> widthAnimation;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
    widthAnimation =
        Tween<double>(begin: minWidth, end: maxWidth).animate(curvedAnimation);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, widget) => getWidget(context, widget));
  }

  void updatePage(child) {
    pageChild = child;
    mainContext.update();
  }

  Widget getWidget(context, widget) {
    return Material(
      elevation: 10,
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(8)),
      child: Container(
          width: widthAnimation.value,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                //// IMage Layer
                child: Image(
                  image: AssetImage("assets/boxes.jpg"),
                  fit: BoxFit.cover,
                  color: Color.fromARGB(200, 100, 100, 255),
                  colorBlendMode: BlendMode.multiply,
                ),
              ),
              BackdropFilter(
                // Blur Backdrop
                filter: ImageFilter.blur(sigmaX: blurAmt, sigmaY: blurAmt),
                child: Container(
                  color: Colors.transparent,
                  child: Center(child: Container()),
                ),
              ),
              Opacity(
                // GRADIENT LAYER
                opacity: gradOpacity,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                        Color.fromARGB(220, 0, 0, 0),
                        Color.fromARGB(255, 3, 11, 22),
                        Color.fromARGB(150, 12, 35, 69)
                      ],
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter)),
                ),
              ),
              Container(
                width: widthAnimation.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // SizedBox(
                    //   height: 30,
                    //   width: 20,
                    // ),
                    // CircleAvatar(
                    //   child: Image(image: AssetImage("assets/spin.png")),
                    //   radius: 20,
                    // ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                          width: 5,
                        ),
                        CircleAvatar(
                          child: Image(image: AssetImage("assets/spin.png")),
                          radius: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        (widthAnimation.value >= 200)
                            ? Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      updatePage(Profile());
                                    });
                                  },
                                  child: Container(
                                    child: Text(
                                      "Hemant Lader ",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 170, 230, 255),
                                          fontSize: 18),
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.white30,
                      height: 0,
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, counter) {
                          return Divider(height: 1.0, color: Colors.white12);
                        },
                        itemBuilder: (context, counter) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                currentSelected = counter;
                                // pageChild = Text(NavigationList[counter].title,
                                //     style: TextStyle(color: Colors.white));
                                mainContext.update();
                                switch (currentSelected) {
                                  case 0:
                                    updatePage(Dashboard());
                                    break;
                                  case 1:
                                    updatePage(LiveFeed());
                                    break;
                                  case 2:
                                    updatePage(Notifications());
                                    break;
                                  case 3:
                                    updatePage(AutomateHome());
                                    break;
                                  case 4:
                                    updatePage(People());
                                    break;
                                  default:
                                    updatePage(Dashboard());
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: (currentSelected == counter)
                                    ? Color.fromARGB(20, 116, 197, 245)
                                    : null,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: EdgeInsets.all(5),
                              child: NavigationTile(
                                title: NavigationList[counter].title,
                                icon: NavigationList[counter].icon,
                                animationController: _animationController,
                                isSelected: (counter == currentSelected),
                              ),
                            ),
                          );
                        },
                        itemCount: NavigationList.length,
                      ),
                    ),
                    (widthAnimation.value >= 190)
                        ? InkWell(
                            onTap: () {
                              print("The fourth eye info");
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Container(
                                      height: 400,
                                      width: 300,
                                      child: CreditsDialog(),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: Colors.white24)),
                                child: Text(
                                  "Credits",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                        : Container(),

                    SizedBox(
                      height: 5,
                    ),

                    (widthAnimation.value >= 190)
                        ? Container(
                            padding: EdgeInsets.all(6),
                            color: Colors.transparent.withOpacity(0.2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  "The Fourth Eye v.1.0\nGEC BSP",
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: 10,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      /// SIDE BAR BOTTOM ROW
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              isCollapsed = !isCollapsed;
                              !isCollapsed
                                  ? _animationController.forward()
                                  : _animationController.reverse();
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.lightBlue,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: AnimatedIcon(
                                icon: AnimatedIcons.menu_close,
                                progress: _animationController,
                                color: Color.fromARGB(200, 12, 35, 69),
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        (widthAnimation.value >= 70) ? Spacer() : Container(),
                        (widthAnimation.value >= 180)
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    print("Logout");
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(150, 160, 50, 50)),
                                  margin: EdgeInsets.only(right: 10),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 10),
                                    child: Text(
                                      "LOGOUT",
                                      style: TextStyle(
                                        color: Colors
                                            .white70, //fromARGB(200, 12, 35, 69),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
