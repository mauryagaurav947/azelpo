import 'package:azelpo/config/router/router.dart';
import 'package:azelpo/constants/api_path.dart';
import 'package:azelpo/constants/palette.dart';
import 'package:azelpo/constants/routes.dart';
import 'package:azelpo/models/service_category_model.dart';
import 'package:azelpo/models/service_subcategory_model.dart';
import 'package:azelpo/screens/widgets/gap.dart';
import 'package:azelpo/utils/service/rest_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceCategoryPage extends StatefulWidget {
  const ServiceCategoryPage({Key? key}) : super(key: key);

  @override
  State<ServiceCategoryPage> createState() => _ServiceCategoryPageState();
}

class _ServiceCategoryPageState extends State<ServiceCategoryPage> {

  late List<ServiceSubCategoryModel> _serviceSubCategory = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getServiceSubCategory();
  }

  @override
  Widget build(BuildContext context) {
    print(_serviceSubCategory);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Service Category",
          style: Theme
              .of(context)
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
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
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
          itemCount: _serviceSubCategory.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigate.pushNamed(Routes.productDetail),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        Urls.imagePath("${_serviceSubCategory[index].cover}"),
                        fit: BoxFit.cover,
                        width: 160.w,
                      ),
                    ),
                  ),
                  const Gap(15),
                  Text(
                    ("${_serviceSubCategory[index].name}"),
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline5!
                        .copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$${_serviceSubCategory[index].slug}",
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
                        ("${_serviceSubCategory[index].name}"),
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline5!
                            .copyWith(
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


  //Api Response
  void _getServiceSubCategory() async {
    final response = await Services.serviceSubCategory();
    if (response.statusCode == 200) {
      _serviceSubCategory = response.data!;
      setState(() {});
    }
  }

}