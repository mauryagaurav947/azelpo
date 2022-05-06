import 'package:azelpo/constants/palette.dart';
import 'package:azelpo/screens/auth/signup/signup_page.dart';
import 'package:azelpo/screens/widgets/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: "More",
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
        children: [
          ListTile(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpPage()));
            },
            leading: SvgPicture.asset(
              "assets/images/bag-handle.svg",
              height: 30.h,
              width: 30.w,
              color: Palette.blackColor.shade700,
            ),
            title: Text("Register",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Palette.blackColor.shade700,
                    )),
            trailing: const Icon(Icons.keyboard_arrow_right_outlined),
          ),
          Divider(
            color: Palette.blackColor.shade400,
          ),
          ListTile(
            leading: Icon(
              Icons.error,
              size: 25.sp,
              color: Palette.blackColor.shade700,
            ),
            title: Text("About",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Palette.blackColor.shade700,
                    )),
            trailing: const Icon(Icons.keyboard_arrow_right_outlined),
          ),
          Divider(
            color: Palette.blackColor.shade400,
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/images/folder-open-outline.svg",
              height: 30.h,
              width: 30.w,
              color: Palette.blackColor.shade700,
            ),
            title: Text("Blog",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Palette.blackColor.shade700,
                    )),
            trailing: const Icon(Icons.keyboard_arrow_right_outlined),
          ),
          Divider(
            color: Palette.blackColor.shade400,
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/images/notifications-outline.svg",
              height: 30.h,
              width: 30.w,
              color: Palette.blackColor.shade700,
            ),
            title: Text("Notification",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Palette.blackColor.shade700,
                    )),
            trailing: const Icon(Icons.keyboard_arrow_right_outlined),
          ),
          Divider(
            color: Palette.blackColor.shade400,
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/images/globe.svg",
              height: 30.h,
              width: 30.w,
              color: Palette.blackColor.shade700,
            ),
            title: Text("Language",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Palette.blackColor.shade700,
                    )),
            trailing: const Icon(Icons.keyboard_arrow_right_outlined),
          ),
          Divider(
            color: Palette.blackColor.shade400,
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/images/mail-open.svg",
              height: 30.h,
              width: 30.w,
              color: Palette.blackColor.shade700,
            ),
            title: Text("Contact",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Palette.blackColor.shade700,
                    )),
            trailing: const Icon(Icons.keyboard_arrow_right_outlined),
          ),
        ],
      ),
    );
  }
}
