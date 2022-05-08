import 'package:azelpo/constants/palette.dart';
import 'package:azelpo/screens/auth/signup/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 20.w, top: 60.h, right: 20.w),
            height: 1.sh,
            width: 1.sw,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/login-bg.jpg"),
                    fit: BoxFit.fill)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Login ",
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Please sign in to continue",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Palette.blackColor.shade700,
                      fontWeight: FontWeight.w100),
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Palette.borderColor.withOpacity(0.9))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Palette.borderColor.withOpacity(0.9))),
                      hintText: "Your Email",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Palette.blackColor.shade200)),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Palette.borderColor.withOpacity(0.9))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Palette.borderColor.withOpacity(0.9))),
                      hintText: "Password",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Palette.blackColor.shade200)),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Palette.blackColor.shade700,
                        fontWeight: FontWeight.w100),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: 1.sw,
                  height: 50.h,
                  color: Palette.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Log In",
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "New Member? ",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Palette.blackColor.shade700,
                            fontWeight: FontWeight.w100)),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const SignUpPage()));
                          },
                        text: " Register Now",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Palette.primaryColor,
                            fontWeight: FontWeight.w600))
                  ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
