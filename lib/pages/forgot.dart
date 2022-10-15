import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:todo/theme.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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

    Widget title() {
      return Container(
        margin: EdgeInsets.only(bottom: defaultMargin),
        child: Text(
          'Forgot your password!',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 80),
        child: DottedBorder(
          dashPattern: [10, 6],
          color: Color(0xffadadad),
          strokeWidth: 1,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Image.asset(
              'assets/forgot-pw.png',
            ),
          ),
        ),
      );
    }

    Widget emailInput() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          left: 45,
          right: 45,
          top: defaultMargin,
        ),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(52),
        ),
        child: TextFormField(
          style: blackTextStyle.copyWith(
            fontSize: 12,
            fontWeight: bold,
          ),
          textCapitalization: TextCapitalization.none,
          decoration: InputDecoration.collapsed(
            hintText: 'Enter your e-mail',
            hintStyle: secondaryTextStyle.copyWith(
              fontSize: 12,
              fontWeight: bold,
            ),
          ),
        ),
      );
    }

    Widget buttonForgot() {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: blueColor,
          borderRadius: BorderRadius.circular(100),
        ),
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: defaultMargin,
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          child: Text(
            'Reset Password',
            style: whiteTextStyle.copyWith(
              fontSize: 24,
              fontWeight: bold,
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
          bottom: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sign-in');
              },
              child: Text(
                'Sign In',
                style: primaryTextStyle.copyWith(fontSize: 16),
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
          title(),
          content(),
          emailInput(),
          buttonForgot(),
          footer(),
        ],
      ),
    );
  }
}
