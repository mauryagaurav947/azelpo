import 'package:azelpo/providers/base_scaffold_provider.dart';

// Application name
const String kAppName = 'Azelpo';

// Text fields mandatory char
const String kMandatoryChar = "*";

// Regular font
const String kFontFamily = 'NunitoSans';

late SetupFlowProvider kSetupFlowProvider;

/// Shared preferences keys
class PrefConst {
  PrefConst._();

  /// [userdata] where the userdata will be stored
  static const String userdata = 'userdata';
}
