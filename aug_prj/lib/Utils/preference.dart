import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static final Preference instance = Preference._();

  late SharedPreferences _preferences;

  Preference._() {
    _initPreference();
  }

  /// Initializes the preference
  Future<void> _initPreference() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// Saves given email in the shared preferences
  /// [email] email that need to be saved in the shared preferences
  Future<bool> setEmail(String email) async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences.setString(
        PreferenceKey.PASSWORD,
        email,
      );
  }

  /// Retrieves email from the shared preferences
  String? getEmail() => _preferences.getString(PreferenceKey.PASSWORD);

  /// Saves given username in the shared preferences
  /// [username] - username that need to be saved in the shared preferences
  Future<bool> setusername(String username) => _preferences.setString(
        PreferenceKey.USERNAME,
        username,
      );

  /// Retrieves [username] from the shared preferences
  String? getUsername() => _preferences.getString(PreferenceKey.USERNAME);
}

class PreferenceKey {
  static const PASSWORD = 'PASSWORD';
  static const USERNAME = 'USERNAME';
}
