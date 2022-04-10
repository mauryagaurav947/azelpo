import 'package:azelpo/config/router/page_route.dart';
import 'package:azelpo/config/router/router.dart';
import 'package:azelpo/constants/app_constants.dart';
import 'package:azelpo/constants/palette.dart';
import 'package:azelpo/constants/routes.dart';
import 'package:azelpo/providers/base_scaffold_provider.dart';
import 'package:azelpo/screens/account/account.dart';
import 'package:azelpo/screens/home/home.dart';
import 'package:azelpo/screens/more/more.dart';
import 'package:azelpo/screens/services/services.dart';
import 'package:azelpo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SetupFlow extends StatefulWidget {
  const SetupFlow({Key? key, this.index = 0}) : super(key: key);
  final int index;

  @override
  _SetupFlowState createState() => _SetupFlowState();
}

class _SetupFlowState extends State<SetupFlow> {
  late List<GlobalKey<NavigatorState>> _keys;

  final List<Widget> _widgets = const <Widget>[
    HomePage(),
    ServicesPage(),
    AccountPage(),
    MorePage(),
  ];

  DateTime? _currentBackPressTime;

  @override
  void initState() {
    super.initState();
    _keys =
        List.generate(_widgets.length, (index) => GlobalKey<NavigatorState>());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Consumer<SetupFlowProvider>(
        builder: (context, provider, child) => Column(
          children: [
            Expanded(
              child: Navigator(
                key: _keys[kSetupFlowProvider.currentBottomBarIndex],
                onGenerateRoute: _onGenerateRoute,
                initialRoute: Routes.home,
              ),
            ),
            _bottomNavigationBar()
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: kSetupFlowProvider.currentBottomBarIndex,
      selectedFontSize: 12.sp,
      unselectedFontSize: 12.sp,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart_outlined),
          label: "Services",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "Account",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz_outlined),
          label: "More",
        ),
      ],
      onTap: (index) {
        kSetupFlowProvider.changeIndex = index;
      },
    );
  }

  Future<bool> _onWillPop() async {
    if (kSetupFlowProvider.currentBottomBarIndex != 0) {
      kSetupFlowProvider.changeIndex = 0;
      return Future.value(false);
    }
    DateTime now = DateTime.now();
    if (_currentBackPressTime == null ||
        now.difference(_currentBackPressTime!) > const Duration(seconds: 2)) {
      _currentBackPressTime = now;
      Utils.showToast('Press again to exit');
      return Future.value(false);
    }
    Navigate.close();
    return Future.value(false);
  }

  Route? _onGenerateRoute(RouteSettings settings) {
    late Widget page;
    switch (settings.name) {
      case Routes.home:
        page = _widgets[kSetupFlowProvider.currentBottomBarIndex];
        break;
    }
    return CustomPageRoute(widget: page, settings: settings);
  }
}
