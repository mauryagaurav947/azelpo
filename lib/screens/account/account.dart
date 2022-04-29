import 'package:azelpo/constants/palette.dart';
import 'package:azelpo/screens/widgets/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: "Account",
      ),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Column(
          children: [
            Container(
              height: 230.h,
              width: 1.sw,
              color: Palette.backGroundColor,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                    height: 150.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/user.png"),
                        )),
                  ),
                  Text(
                    "User Name",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h,),
            Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Column(
                      children: [
                        ListTile(
                          leading: SvgPicture.asset("assets/images/id-card-sharp.svg",height: 30.h,width: 30.w, color: Palette.blackColor.shade700),
                          title: Text("Profile", style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Palette.blackColor.shade700,),),
                          trailing: Icon(Icons.keyboard_arrow_right_outlined),
                        ),
                        Divider(
                          color: Palette.blackColor.shade400,
                        ),
                        ListTile(
                          leading: SvgPicture.asset("assets/images/key.svg",height: 30.h,width: 30.w, color: Palette.blackColor.shade700),
                          title: Text("Change Password", style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Palette.blackColor.shade700,),),
                          trailing: Icon(Icons.keyboard_arrow_right_outlined),
                        ),
                        Divider(
                          color: Palette.blackColor.shade400,
                        ),
                        ListTile(
                          leading:SvgPicture.asset("assets/images/people.svg",height: 30.h,width: 30.w, color: Palette.blackColor.shade700),
                          title: Text("Become Partner", style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Palette.blackColor.shade700,)),
                          trailing: Icon(Icons.keyboard_arrow_right_outlined),
                        ),
                        Divider(
                          color: Palette.blackColor.shade400,
                        ),
                        ListTile(
                          leading:SvgPicture.asset("assets/images/log-out.svg",height: 30.h,width: 30.w, color: Palette.blackColor.shade700),
                          title: Text("Logout", style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Palette.blackColor.shade700,)),
                          trailing: Icon(Icons.keyboard_arrow_right_outlined),
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
