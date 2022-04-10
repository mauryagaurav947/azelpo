import 'package:azelpo/constants/palette.dart';
import 'package:azelpo/screens/widgets/gap.dart';
import 'package:azelpo/screens/widgets/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
          ],
        ),
      ),
    );
  }

  /// Appbar
  Widget _buildAppBar() {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(3),
      borderSide: BorderSide.none,
      gapPadding: 0,
    );
    return Container(
      color: Palette.primaryColor,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "902 W. Pinekoll Drive Winter Garden, FL 394331",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const Gap(7),
          SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Find Services",
                filled: true,
                fillColor: Colors.white,
                enabledBorder: border,
                focusedBorder: border,
                border: border,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                hintStyle: TextStyle(
                  height: 1.4,
                  fontSize: 13.sp,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  size: 20.sp,
                ),
              ),
              style: const TextStyle(
                height: 1.4,
              ),
              cursorHeight: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
