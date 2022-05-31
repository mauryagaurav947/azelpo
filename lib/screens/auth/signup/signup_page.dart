import 'package:azelpo/config/router/router.dart';
import 'package:azelpo/constants/palette.dart';
import 'package:azelpo/constants/routes.dart';
import 'package:azelpo/screens/auth/signin/login_page.dart';
import 'package:azelpo/utils/service/rest_api.dart';
import 'package:azelpo/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  late TextEditingController _firstName;
  late TextEditingController _lastName;
  late TextEditingController _email;
  late TextEditingController _phoneNumber;
  late TextEditingController _password;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _email = TextEditingController();
    _phoneNumber = TextEditingController();
    _password = TextEditingController();
  }

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
                  controller: _firstName,
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
                  controller: _lastName,
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
                  controller: _email,
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
                  controller: _phoneNumber,
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
                  controller: _password,
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
                    onPressed: () => _signUp(),
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
  Future<void> _signUp() async {
    if (!_validate()) return;

    Utils.unFocus(context);
    final payload = {
      'first_name': _firstName.text,
      'last_name': _lastName.text,
      'email': _email.text,
      'mobile': _phoneNumber.text,
      'password': _password.text,
    };
    final response = await Services.signUp(payload);
    Utils.showToast(response.message);
    if (response.statusCode == 200) {
     // Navigate.pushNamed(Routes.login);
    }
  }

  bool _validate() {
    if (_firstName.text.isEmpty ||
        _lastName.text.isEmpty ||
        _email.text.isEmpty ||
        _phoneNumber.text.isEmpty ||
        _password.text.isEmpty) {
      Utils.showToast('Fields with (*) sign are required');
      return false;
    }

    if (!Validator.validateTextWithSpace(_firstName.text)) {
      Utils.showToast('Name must not contain any special character');
      //_fullNameFN.requestFocus();
      return false;
    }

    if (!Validator.validateTextWithSpace(_lastName.text)) {
      Utils.showToast('Name must not contain any special character');
      //_fullNameFN.requestFocus();
      return false;
    }

    if (!Validator.validateEmail(_email.text)) {
      Utils.showToast('Invalid E-mail');
      //_emailFN.requestFocus();
      return false;
    }

    if (!Validator.validateMobile(_phoneNumber.text)) {
      Utils.showToast('Invalid mobile');
      //_mobileFN.requestFocus();
      return false;
    }

    if (_password.text.isEmpty) {
      Utils.showToast('Please enter password');
      //_passwordFN.requestFocus();
      return false;
    }

    if (!Validator.validatePassword(_password.text)) {
      Utils.showToast('Password must be in between 8 - 15 char');
      //_passwordFN.requestFocus();
      return false;
    }
    return true;
  }
}
