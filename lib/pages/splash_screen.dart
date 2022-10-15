import 'package:flutter/material.dart';
import 'package:todo/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget iconStack() {
      return Container(
        height: 200,
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
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 94),
        child: Image.asset(
          'assets/splash-todo.png',
        ),
      );
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Text(
          'Get things done with Todo',
          style: blackTextStyle.copyWith(
            fontWeight: bold,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget description() {
      return Container(
        margin: EdgeInsets.only(left: 76, right: 76, top: defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tortor tristique enim ornare malesuada. Sapien sed turpis nullam nascetur at et. Vulputate urna interdum egestas id molestie cum.',
                textAlign: TextAlign.center,
                style: secondaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: bold,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buttonStarted() {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: blueColor,
          borderRadius: BorderRadius.circular(100),
        ),
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: defaultMargin * 2,
          bottom: defaultMargin,
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/sign-up');
          },
          child: Text(
            'Get Started',
            style: whiteTextStyle.copyWith(
              fontSize: 24,
              fontWeight: bold,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor2,
      body: ListView(
        children: [
          iconStack(),
          content(),
          header(),
          description(),
          buttonStarted(),
        ],
      ),
    );
  }
}
