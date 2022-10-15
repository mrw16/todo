import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:todo/theme.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

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
          'Welcome Back!',
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
              'assets/forgot.png',
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
          bottom: defaultMargin,
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

    Widget passwordInput() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          left: 45,
          right: 45,
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
          obscureText: true,
          decoration: InputDecoration.collapsed(
            hintText: 'Enter your password',
            hintStyle: secondaryTextStyle.copyWith(
              fontSize: 12,
              fontWeight: bold,
            ),
          ),
        ),
      );
    }

    Widget forgotPassword() {
      return Container(
        margin: EdgeInsets.only(
          top: 11,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/forgot-pw');
          },
          child: Text(
            'Forgot your password?',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    Widget buttonSignIn() {
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
            'Sign In',
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
            Text(
              'Don\'t have an account? ',
              style: secondaryTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sign-up');
              },
              child: Text(
                'Sign Up!',
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
          passwordInput(),
          forgotPassword(),
          buttonSignIn(),
          footer(),
        ],
      ),
    );
  }
}
