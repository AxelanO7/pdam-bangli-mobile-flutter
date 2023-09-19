// import 'package:btw_eduapp_global/src/apis/auth/get_detail_bank_account_api.dart';
// import 'package:btw_eduapp_global/src/apis/auth/login_guest_api.dart';
// import 'package:btw_eduapp_global/src/apis/auth/register_api.dart';
import 'package:pdam_bangli/src/core/base_import.dart';

class AuthUtils {
  static final String _skLogin = 'is_login';
  static final String _skMobileToken = 'token';
  static final String _skUserId = 'user-id';
  static final String _skFCMToken = 'fcm_token';

  static Future<ResultApi> doLogin(
      String userIdentifier, String password) async {
    var result = await LoginOfficerApi()
        .request(username: userIdentifier, password: password);
    if (result.status) {
      var data = result.data as LoginOfficerResponse;
      await AuthUtils.setMobileToken(data.token);
      await setLoggedIn(true);
    }
    return result;
  }

  // static Future<ResultApi> doRegister(
  //     String name,
  //     String email,
  //     String username,
  //     String password,
  //     String phone,
  //     bool isUpdateGuest) async {
  //   var result = await RegisterApi().request(
  //       customerName: name,
  //       email: email,
  //       username: username,
  //       password: password);
  //   if (result.status) {
  //     if (!isUpdateGuest) {
  //       var data = result.data as AuthDefault;
  //       await AuthUtils.setMobileToken(data.token);
  //       await setLoggedIn(true);
  //     }
  //     await setGuest(false);
  //   }
  //   return result;
  // }

  static Future<bool> isLoggedIn() async {
    return (await SettingsUtils.getString(_skMobileToken)) != "";
  }

  static setLoggedIn(bool status) async {
    return await SettingsUtils.setBool(_skLogin, status);
  }

  static Future<String> getAppToken() async {
    return await SettingsUtils.getString(_skMobileToken);
  }

  static Future<bool> setMobileToken(String token) async {
    setLoggedIn(true);
    await SettingsUtils.set(_skMobileToken, token);
    return true;
  }

  static Future<bool> removeSession() async {
    // final prefs = await SharedPreferences.getInstance();
    // prefs.remove(_skMobileToken);
    // prefs.remove(_skLogin);
    // prefs.remove(_skUserName);
    // prefs.remove(_skUserImage);
    // prefs.remove(_skUserId);
    // // prefs.remove(_skFCMToken);
    // prefs.remove(_skUserEmail);
    // prefs.remove(_skUserPhone);
    await SettingsUtils.remove(_skMobileToken);
    await SettingsUtils.remove(_skLogin);
    await SettingsUtils.remove(_skUserId);

    await SettingsUtils.remove("user_role");
    await SettingsUtils.remove("number_bank_account");

    return true;
  }

  static Future<Null> setFCMToken(String? token) async {
    await SettingsUtils.set(_skFCMToken, token ?? '');
  }

  static Future<String> getFCMToken() async {
    return await SettingsUtils.getString(_skFCMToken);
  }

  static Future<void> setUserId(double id) async {
    await SettingsUtils.setDouble(_skUserId, id);
  }

  static Future<double> getUserId() async {
    return await SettingsUtils.getDouble(_skUserId);
  }
}
