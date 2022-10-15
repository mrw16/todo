import 'package:flutter/material.dart';
import 'package:todo/theme.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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

    Widget header() {
      return Container(
        child: Column(
          children: [
            Text(
              'Welcome Onboard!',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.',
              style: secondaryTextStyle.copyWith(
                fontSize: 12,
                fontWeight: bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          left: 45,
          right: 45,
          bottom: defaultMargin,
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
            hintText: 'Enter your name',
            hintStyle: secondaryTextStyle.copyWith(
              fontSize: 12,
              fontWeight: bold,
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

    Widget buttonSignUp() {
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
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          child: Text(
            'Sign Up',
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
              'Already have Account ? ',
              style: secondaryTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sign-in');
              },
              child: Text(
                'Sign In!',
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
          header(),
          nameInput(),
          emailInput(),
          passwordInput(),
          buttonSignUp(),
          footer(),
        ],
      ),
    );
  }
}
