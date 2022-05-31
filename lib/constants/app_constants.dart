import 'package:azelpo/providers/base_scaffold_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Application name
const String kAppName = 'Azelpo';

// Text fields mandatory char
const String kMandatoryChar = "*";

late SharedPreferences kSharedPreferences;

// Regular font
const String kFontFamily = 'NunitoSans';

late SetupFlowProvider kSetupFlowProvider;

/// Shared preferences keys
class PrefConst {
  PrefConst._();

  /// [userdata] where the userdata will be stored
  static const String userdata = 'userdata';

  /// shared pref key to store user token to authenticate user
  static const String userToken = 'user_token';

}
