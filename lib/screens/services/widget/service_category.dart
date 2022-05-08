import 'package:azelpo/config/router/router.dart';
import 'package:azelpo/constants/palette.dart';
import 'package:azelpo/constants/routes.dart';
import 'package:azelpo/screens/services/widget/product_detail_page.dart';
import 'package:azelpo/screens/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceCategoryPage extends StatefulWidget {
  const ServiceCategoryPage({Key? key}) : super(key: key);

  @override
  State<ServiceCategoryPage> createState() => _ServiceCategoryPageState();
}

class _ServiceCategoryPageState extends State<ServiceCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Service Category",
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
            onTap: () => Navigate.pushNamed(Routes.home),
            child: const Icon(Icons.keyboard_arrow_left_rounded)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Text(
              "Home Maintenance",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          _category(),
        ],
      ),
    );
  }

//Service Category
  Widget _category() {
    final data = [
      {
        "title": "Daytime Place",
        "image": "assets/images/service_category/deal-8.jpg",
        "price": "\$78.00"
      },
      {
        "title": "Scissors N'Razors",
        "image": "assets/images/service_category/deal-2.jpg",
        "price": "\$78.00"
      },
      {
        "title": "Beyond Borders",
        "image": "assets/images/service_category/deal-6.jpg",
        "price": "\$78.00"
      },
      {
        "title": "Royalty Travel Systems",
        "image": "assets/images/service_category/deal-7.jpg",
        "price": "\$78.00"
      },
      {
        "title": "Lonesome Dove",
        "image": "assets/images/service_category/deal-4.jpg",
        "price": "\$78.00"
      },
      {
        "title": "Health Club",
        "image": "assets/images/service_category/deal-3.jpg",
        "price": "\$78.00"
      },
      {
        "title": "Home",
        "image": "assets/images/service_category/deal-5.jpg",
        "price": "\$78.00"
      },
      {
        "title": "Home",
        "image": "assets/images/service_category/deal-9.jpg",
        "price": "\$78.00"
      },
      {
        "title": "Home",
        "image": "assets/images/service_category/deal-1.jpg",
        "price": "\$78.00"
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 0,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigate.pushNamed(Routes.productDetail),
              child: Column(
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
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$200.00",
                        style: TextStyle(
                          color: Palette.blackColor.shade400,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 10.sp,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        data[index]["price"]!,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Palette.greenColor),
                      ),
                    ],
                  ),
                  const Gap(10)
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
