import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import '../common/creditModel.dart';

class CreditsDialog extends StatefulWidget {
  @override
  _CreditsDialogState createState() => _CreditsDialogState();
}

class _CreditsDialogState extends State<CreditsDialog> {
  int currentPage = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: currentPage, keepPage: true, viewportFraction: 0.5);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: <Widget>[
        Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            color: Colors.lightBlueAccent,
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              height: 130,
              margin: EdgeInsets.only(
                top: 35,
              ),
              child: PageView.builder(
                controller: _pageController,
                physics: ClampingScrollPhysics(),
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  return itemBuilder(index);
                },
                pageSnapping: true,
                itemCount: creditList.length,
              ),
            ),
            Expanded(child: _detailBuilder(currentPage))
          ],
        ),
      ],
    ));
  }

  Widget itemBuilder(index) {
    return AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = (index == 0) ? 1 : 0.5;
          if (_pageController.position.haveDimensions) {
            value = _pageController.page - index;
            value = (1 - (value.abs() * 0.5)).clamp(0.00, 1.0);
          }
          return Center(
            child: InkWell(
              onTap: () {
                print(index);
                _pageController.animateToPage(index,
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOutQuart);
              },
              child: Container(
                // margin: EdgeInsets.all(10),
                // height: 100,
                // width: 100,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Color.fromRGBO(200, 220, 255, 1),
                      spreadRadius: 3,
                    ),
                  ],
                  border: Border.all(color: Colors.white, width: 3.0),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                  // image: DecorationImage(
                  //     image: AssetImage(creditList[index].image),
                  //     fit: BoxFit.cover),
                ),
                child: CircleAvatar(
                    backgroundImage: AssetImage(creditList[index].image),
                    radius: Curves.easeInOutQuart.transform(value) *
                        50 //(index == currentPage) ? 50 : 25),
                    ),
              ),
            ),
          );
        });
  }

  Widget _detailBuilder(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = (index == 0) ? 1 : 0.5;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.5)).clamp(0.00, 1.0);
        }
            double opval = (value *value*value*value);
        return Opacity(
          opacity:
              Curves.easeInOutQuart.transform(opval), //(value*2).clamp(0.0, 1.0) ,
          child: Container(
            child: ClipRect(
              clipBehavior: Clip.hardEdge,
              
              child: Transform.translate(
                offset: Offset(0, 200 + (200 * -value)), //(Curves.easeInOutQuart.transform(value)))),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5,
                                spreadRadius: 0,
                                color: Color.fromRGBO(10, 60, 100, 0.2))
                          ],
                          color:
                              Colors.white, //Color.fromRGBO(10, 60, 100, 0.1)
                        ),
                        child: Text(
                          creditList[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color.fromRGBO(10, 60, 100, 1)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        // color: Colors.white, //Color.fromRGBO(10, 60, 100, 0.1)
                        child: Text(
                          creditList[index].role,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(10, 60, 100, 1)),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        // color: Colors.white, //Color.fromRGBO(10, 60, 100, 0.1)
                        child: Text(
                          creditList[index].desc,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(50, 90, 150, 0.7)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }
}
