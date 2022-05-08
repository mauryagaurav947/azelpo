import 'package:azelpo/constants/palette.dart';
import 'package:azelpo/screens/auth/signin/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                  "Create Account",
                  style: Theme.of(context).textTheme.headline2,
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
                      hintText: "First Name",
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
                      hintText: "Last Name",
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
                      hintText: "Email",
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
                      hintText: "Phone Number",
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
                Container(
                  width: 1.sw,
                  height: 50.h,
                  color: Palette.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Register",
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
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Already have an account? ",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Palette.blackColor.shade700,
                          fontWeight: FontWeight.w100)),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const LoginPage()));
                        },
                      text: " Login Here",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Palette.primaryColor,
                          fontWeight: FontWeight.w600))
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
