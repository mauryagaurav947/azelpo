import 'package:azelpo/config/router/router.dart';
import 'package:azelpo/constants/palette.dart';
import 'package:azelpo/screens/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "View",
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
            onTap: () => Navigate.close(),
            child: const Icon(Icons.keyboard_arrow_left_rounded)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 250.h,
                        width: 1.sw,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                            image: AssetImage("assets/images/deal-6.jpg"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const Gap(20),
                      Text(
                        "Daytime Place",
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Palette.primaryColor,
                            size: 17.sp,
                          ),
                          Icon(
                            Icons.star,
                            color: Palette.primaryColor,
                            size: 17.sp,
                          ),
                          Icon(
                            Icons.star,
                            color: Palette.primaryColor,
                            size: 17.sp,
                          ),
                          Icon(
                            Icons.star,
                            color: Palette.primaryColor,
                            size: 17.sp,
                          ),
                          Icon(
                            Icons.star_border_outlined,
                            color: Palette.primaryColor,
                            size: 17.sp,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            decoration: BoxDecoration(
                                color: Palette.primaryColor,
                                borderRadius: BorderRadius.circular(3)),
                            child: Text(
                              "4.7",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "\$200.00",
                            style: TextStyle(
                              color: Palette.blackColor.shade400,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 15.sp,
                            ),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "\$78.00",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Palette.greenColor,
                                    fontSize: 17.sp),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
                  color: Colors.white,
                  child: Text(
                    "Asperiores cum debities deserunt diignissimos dolorum harum, incidunt nobis porro quasi quibusdam quidem sapiente voluptas,\nvoluptatem \n \ndeserunt diignissimos dolorum harum, incidunt nobis porro quasi quibusdam quidem sapiente voluptas,voluptatem",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 15.sp,
                        color: Palette.blackColor.shade700),
                  ),
                ),
                SizedBox(height: 15.h),
              ],
            ),
          ),
          Container(
              width: 1.sw,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                    color: Palette.primaryColor,
                    borderRadius: BorderRadius.circular(5)),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Book Now",
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: Colors.white),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
