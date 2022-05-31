// import 'dart:convert';
// import 'package:azelpo/constants/app_constants.dart';
// import 'package:azelpo/models/user_model.dart';
// import 'package:flutter/material.dart';
//
// class UserProvider extends ChangeNotifier {
//   /// instance of [UserModel]
//   UserModel? _user;
//
//   /// getters of [UserModel]
//   int? get id => _user?.id;
//
//   String? get name => _user?.firstName;
//
//   String? get email => _user?.email;
//
//   String get mobile => _user?.mobile;
//
//   UserModel get user => _user;
//
//   String get authToken => kSharedPreferences.getString(PrefConst.userToken);
//
//   bool get isAuthenticated => (authToken != null && authToken.isNotEmpty);
//
//   String get customerType {
//     if (_user?.roles != null && _user.roles.isNotEmpty) {
//       return _user.roles.first.role;
//     } else {
//       return null;
//     }
//   }
//
//   /// valueNotifier while logging out user
//   final _loggingOut = ValueNotifier(false);
//
//   /// getter of [_loggingOut]
//   ValueNotifier<bool> get loggingOut => _loggingOut;
//
//   /// method to sync latest data of user
//   // Future<bool> sync() async {
//   //   final response = await Services.profile();
//   //   if (response.statusCode == 200) {
//   //     _user = response.data;
//   //     await kSharedPreferences.setString(
//   //         PrefConst.userdata, jsonEncode(response.data.toJson()));
//   //     notifyListeners();
//   //     return true;
//   //   }
//   //
//   //   /// If the [response.statusCode] is `401`
//   //   /// it means that the token has been expired
//   //   ///
//   //   /// Check if the token was expired or not
//   //   /// if the token is expired then logging out
//   //   /// the users session
//   //   if (response.statusCode == 401) {
//   //     await logout();
//   //     return false;
//   //   }
//   //
//   //   return false;
//   // }
//
//   /// method to set userdata manually
//   // Future<void> setUserData(UserModel user) async {
//   //   if (user != null) {
//   //     _user = user;
//   //     await kSharedPreferences.setString(
//   //         PrefConst.userdata, jsonEncode(user.toJson()));
//   //     notifyListeners();
//   //   }
//   // }
//
//   /// method to initialize userdata from shared pref
//   // void init() {
//   //   final data = kSharedPreferences.getString(PrefConst.userdata);
//   //   if (data != null && data.isNotEmpty) {
//   //     _user = UserModel.fromJson(jsonDecode(data));
//   //   }
//   // }
//
//   /// method to clear token and logout current user
//   // Future<void> logout() async {
//   //   /// set [_loggingOut] property to true
//   //   _loggingOut.value = true;
//   //
//   //   /// storing the userdata temporarily
//   //   /// coz if user was unable to logging out using API
//   //   /// will set the values back to shared pref
//   //   final userdata = kSharedPreferences.getString(PrefConst.userdata);
//   //   final userToken = kSharedPreferences.getString(PrefConst.userToken);
//   //
//   //   final userdataStatus = await kSharedPreferences.remove(PrefConst.userdata);
//   //   final response = await Services.logout();
//   //   Utils.showToast(response.message);
//   //   if (userdataStatus && response.statusCode == 200) {
//   //     if (response.statusCode == 200) {
//   //       /// storing the userdata temporarily
//   //       final removedToken =
//   //       await kSharedPreferences.remove(PrefConst.userToken);
//   //
//   //       /// if was unable to remove token
//   //       /// then set the userdata back to shared pref
//   //       if (removedToken) {
//   //         _user = null;
//   //         kWishlistCountProvider.clear();
//   //         kCartCountProvider.clear();
//   //         kNotificationCountProvider.clear();
//   //         notifyListeners();
//   //       } else {
//   //         await kSharedPreferences.setString(PrefConst.userdata, userdata);
//   //       }
//   //     } else {
//   //       await kSharedPreferences.setString(PrefConst.userdata, userdata);
//   //       await kSharedPreferences.setString(PrefConst.userToken, userToken);
//   //     }
//   //   }
//   //   _loggingOut.value = false;
//   // }
// }
