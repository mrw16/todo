import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:todo/theme.dart';
import 'package:todo/widgets/list_todo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget iconStack() {
      return Container(
        height: 300,
        decoration: BoxDecoration(
          color: blueColor,
        ),
        child: Stack(
          children: [
            Positioned(
              top: -15,
              left: -70,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/ellipse.png'),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -70,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/ellipse.png'),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/profile.png',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: defaultMargin,
                  ),
                  Text(
                    'Welcome Back, Jamaludin!',
                    style: whiteTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Logout',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                      color: primaryColor1,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget clock() {
      return Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            width: double.infinity,
            height: 100.0,
            child: AnalogClock(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset.fromDirection(89.5, 5.0),
                    color: Colors.grey,
                    blurStyle: BlurStyle.normal,
                  ),
                ],
              ), // decoration
              width: 100.0,
              isLive: true,
              hourHandColor: blueColor,
              minuteHandColor: primaryColor3,
              showSecondHand: true,
              numberColor: blueColor,
              showNumbers: true,
              secondHandColor: primaryColor1,
              textScaleFactor: 1.5,
              showTicks: true,
              tickColor: Colors.white,
              showDigitalClock: false,
              // datetime: DateTime.utc(2022, 14, 10),
              useMilitaryTime: true,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(25),
            child: Text(
              'Good Afternoon',
              style: headerTextStyle.copyWith(
                fontSize: 12,
                fontWeight: bold,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      );
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 25,
          left: 25,
          right: 25,
        ),
        child: Text(
          'Tasks List',
          style: headerTextStyle.copyWith(
            fontWeight: bold,
            fontSize: 16,
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
                vertical: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daily Tasks',
                    style: headerTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                    ),
                  ),
                  Icon(
                    Icons.add_circle_outline_rounded,
                    color: blueColor,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 300,
              child: Scrollbar(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      ListTodo(),
                      ListTodo(),
                      ListTodo(),
                      ListTodo(),
                      ListTodo(),
                      ListTodo(),
                      ListTodo(),
                      ListTodo(),
                      ListTodo(),
                      ListTodo(),
                      ListTodo(),
                      ListTodo(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor2,
      body: ListView(
        children: [
          iconStack(),
          clock(),
          header(),
          content(),
        ],
      ),
    );
  }
}
