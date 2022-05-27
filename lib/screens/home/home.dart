import 'package:azelpo/constants/palette.dart';
import 'package:azelpo/models/service_category_model.dart';
import 'package:azelpo/models/service_provider_model.dart';
import 'package:azelpo/screens/widgets/gap.dart';
import 'package:azelpo/utils/service/rest_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.category}) : super(key: key);
   final category;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List<ServiceProviderModel> _serviceProvider = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getServiceSubCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: ListView(
                children: [
                  _slider(),
                  _category(),
                  _featuredServiceProviders(),
                  _spotlight(),
                  _latestServiceProviders(),
                ],
              ),
            ),
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

  /// Slider
  Widget _slider() {
    final images = [
      "assets/images/slider-1.jpg",
      "assets/images/slider-2.jpg",
      "assets/images/slider-3.jpg",
    ];
    return Container(
      height: 170.h,
      width: 1.sw,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: AssetImage(images[index]),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        itemCount: images.length,
      ),
    );
  }

  /// Category
  Widget _category() {
    final data = [
      {"title": "Home", "image": "assets/images/category/1.png"},
      {"title": "Home", "image": "assets/images/category/2.png"},
      {"title": "Home", "image": "assets/images/category/3.png"},
      {"title": "Home", "image": "assets/images/category/4.png"},
      {"title": "Home", "image": "assets/images/category/5.png"},
      {"title": "Home", "image": "assets/images/category/6.png"},
    ];
    return Container(
      height: 95.h,
      width: 1.sw,
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        separatorBuilder: (_, __) => SizedBox(width: 20.w),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    data[index]["image"]!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(10),
              Text(data[index]["title"]!),
            ],
          );
        },
        itemCount: data.length,
      ),
    );
  }

  /// Featured Service Provider
  Widget _featuredServiceProviders() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured Service Providers",
                  style: Theme.of(context).textTheme.headline4,
                ),
                TextButton(
                  child: Text(
                    "View All",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Palette.blackColor.shade700,
                        ),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          SizedBox(
            height: 150.h,
            width: 1.sw,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, __) => SizedBox(
                width: 10.w,
              ),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          "assets/images/img-04.jpg",
                          width: 0.45.sw,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Gap(5),
                    Text(
                ("${_serviceProvider[index].firstName} ${_serviceProvider[index].lastName}"),
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    const Gap(4),
                    Text(
                      "Featured",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Palette.greenColor,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1.3,
                          ),
                    ),
                    const Gap(5),
                  ],
                );
              },
              itemCount: _serviceProvider.length,
            ),
          )
        ],
      ),
    );
  }

  /// Spotlight
  Widget _spotlight() {
    final data = [
      {
        "title": "Salon at home for women",
        "subtitle": "Trained beauticians at your doorstep",
        "image": "assets/images/block_slide_1.jpg",
      },
      {
        "title": "Message for women",
        "subtitle": "Experienced male & female therapist",
        "image": "assets/images/block_slide_2.jpg",
      },
      {
        "title": "Home shifting",
        "subtitle": "Get best movers movers in town",
        "image": "assets/images/block_slide_3.jpg",
      },
    ];
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              "Experiences In The Spotlight",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          const Gap(5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              "Unwind and relax in the comfort of your home",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Palette.blackColor.shade500,
                  ),
            ),
          ),
          const Gap(10),
          SizedBox(
            height: 200.h,
            width: 1.sw,
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage(data[index]["image"]!),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                        colors: [
                          Palette.blackColor.shade500,
                          Palette.blackColor.shade900,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          data[index]["title"]!,
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        const Gap(6),
                        Text(
                          data[index]["subtitle"]!,
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    color: Colors.cyan,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        const Gap(20),
                      ],
                    ),
                  ),
                );
              },
              itemCount: data.length,
            ),
          ),
        ],
      ),
      color: Colors.white,
    );
  }

  /// Latest service providers
  Widget _latestServiceProviders() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Text(
              "Latest Service Providers",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 5.h,
            ),
            itemCount: _serviceProvider.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        "assets/images/img-04.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Gap(5),
                  Text(
              ("${_serviceProvider[index].firstName} ${_serviceProvider[index].lastName}"),
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  const Gap(4),
                  Text(
                    "Verified",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Palette.greenColor,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1.3,
                        ),
                  ),
                  const Gap(5),
                ],
              );
            },
          ),
          Container(
            width: 1.sw,
            height: 40.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            margin: EdgeInsets.symmetric(vertical: 10.h),
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "See all offers",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Palette.greenColor,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _getServiceSubCategory() async {
    final response = await Services.getServiceProvider();
    if (response.statusCode == 200) {
      _serviceProvider = response.data!;
      setState(() {});
    }
  }

}
