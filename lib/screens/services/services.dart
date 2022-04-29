import 'package:azelpo/config/router/router.dart';
import 'package:azelpo/constants/app_constants.dart';
import 'package:azelpo/constants/palette.dart';
import 'package:azelpo/screens/services/widget/service_category.dart';
import 'package:azelpo/screens/widgets/gap.dart';
import 'package:flutter/cupertino.dart';
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildAppBar(),
           Expanded(
             child: ListView(
               children: [
                 Padding(
                   padding: EdgeInsets.only(left: 10.w,right: 10.w,top: 20.h,bottom: 20.h),
                   child: Text(
                     "Top doorstep services",
                     style: Theme.of(context).textTheme.headline4,
                   ),
                 ),
                 Padding(
                   padding: EdgeInsets.only(left: 10.w,right: 10.w,bottom: 20.h),
                   child: Text(
                     "Any daily services is just one click away from your doorstep",
                     style: Theme.of(context).textTheme.headline5!.copyWith(
                       fontWeight: FontWeight.normal,
                       color: Palette.blackColor.shade500,
                     ),
                   ),
                 ),
                 _category()
               ],
             ),
           )
          ],
        ),
      ),
    );
  }

  ///GridView Item List
  Widget _category() {
    final data = [
      {"title": "Cleaning and Help", "image": "assets/images/category/1.png"},
      {"title": "Delivery Services", "image": "assets/images/category/2.png"},
      {"title": "Event Management", "image": "assets/images/category/3.png"},
      {"title": "Therapists and Trainers", "image": "assets/images/category/4.png"},
      {"title": "Home", "image": "assets/images/category/5.png"},
      {"title": "Home", "image": "assets/images/category/6.png"},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ServiceCategoryPage()));
          },
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        data[index]["image"]!,
                        fit: BoxFit.cover,
                        width: 160.w,
                      ),
                    ),
                  ),
                  const Gap(15),
                  Text(
                    data[index]["title"]!,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Gap(20)
                ],
              );
            },
          ),
        ),
      ],
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
