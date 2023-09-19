import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:pdam_bangli/src/core/base_import.dart' hide Response;

import '../models/index.dart';

export 'package:http/http.dart';

class BaseApi {
  ResultApi responseData = ResultApi()..status = false;
  String url = '';
  String msx = '';
  var requestPayload;
  String accessToken = '';
  var requestHeaders = {'Content-Type': 'application/json', 'Accept': 'application/json'};

  printError(dynamic e) {
    LogUtils.systemLog("api-exception", e.toString());
    //   if (e != null && e.toString().toLowerCase().contains('api.')) {
    //     responseData.message =
    //         'Terjadi masalah, silahkan cek jaringan anda dan coba lagi (${responseData.statusCode})';
    //   } else {
    //     responseData.message = e.toString();
    //   }
    //   // if (!FeatureConfig.isDesktop) {
    //   //   FirebaseCrashlytics.instance
    //   //       .setCustomKey('api_error', '$runtimeType : ${e.toString()}');
    //   // }
    //   // if (FeatureConfig.isOnKitchen) {
    //   //   print('Error Parsing API $runtimeType :$url');
    //   //   print('Error : $e');
    //   // }
    //   // DataService.getDebugMode().then((value) {
    //   //   if (value) {
    //   //     AlertHelper.showAlertError(e.toString(),
    //   //         title: 'Error Parsing API', alertType: AlertType.dialog);
    //   //   }
    //   // });
  }

  checkResponse(Response response) async {
    if (CoreConfig.getDebuggableConfig("is_debug_mode") && CoreConfig.getDebuggableConfig("log_api_response")) {
      print('Api Response ${response.statusCode} : $url');
      print(response.body);
    }
    if (response.statusCode != 200) {
      if (response.statusCode >= 500) {
        //   TinySnackBar.material(
        //     'Wah server lagi penuh nih, sabar yaa', type: TinySnackBarType.error,
        //     duration: Duration(seconds: 2),
        //     mobileSnackBarPosition: MobileSnackBarPosition.top,
        //     // Position of snackbar on mobile devices
        //     desktopSnackBarPosition: DesktopSnackBarPosition
        //         .topRight, // Position of snackbar on desktop devices
        //   ).show(Get.context!);
        // } else {
        //   if (CoreConfig.getDebuggableConfig("is_debug_mode")) {
        //     TinySnackBar.material(
        //       '(${response.statusCode}) ${response.body} ',
        //       type: TinySnackBarType.error,
        //       duration: Duration(seconds: 2),
        //       mobileSnackBarPosition: MobileSnackBarPosition.top,
        //       // Position of snackbar on mobile devices
        //       desktopSnackBarPosition: DesktopSnackBarPosition
        //           .topRight, // Position of snackbar on desktop devices
        //     ).show(Get.context!);

        // Get.snackbar(
        //   'Error ${response.statusCode}', '${response.body}',
        //     snackStyle: SnackStyle.FLOATING,);
        // }
      }
    }

    String? message;
    if (response.statusCode >= 400 && response.statusCode < 500) {
      Map<String, dynamic> responseBody = json.decode(response.body);
      responseData.errorsMessage = null;
      try {
        if (responseBody.containsKey('data')) {
          if (responseBody["data"].containsKey('errors')) {
            if (responseBody["data"]["errors"] is Map<String, dynamic>) {
              var err = responseBody["data"]["errors"] as Map<String, dynamic>;
              Map<String, List<dynamic>> errMsg = {};
              if (err.length > 0) {
                err.forEach((key, value) {
                  errMsg[key] = [];
                  if (err[key] is List<dynamic>) {
                    List<dynamic> msgs = err[key];
                    if (msgs.length > 0) {
                      errMsg[key]?.add(msgs.first?.toString() ?? '');
                    }
                  }
                });
                responseData.errorsMessage = errMsg;
              }
            }
          }
        }
      } catch (ex) {}

      if (responseData.errorsMessage == null) {
        responseData.errorsMessage = <String, List<String>>{
          "general": ['Terjadi masalah, silahkan cek jaringan kamu dan coba lagi (${responseData.statusCode})']
        };
        // responseData
        //   ..message =
        //       'Terjadi masalah, silahkan cek jaringan kamu dan coba lagi (${responseData.statusCode})';
      } else {
        // responseData..message = message ?? '';
      }
    }
    if (response.statusCode == 401 || (response.statusCode == 402)) {
      if (!(Get.isDialogOpen ?? false)) {
        // bool isLogged = await AuthUtils.isLoggedIn();
        // if (Get.find<ConstantsService>().isLoggedOut || !isLogged) {
        //   return;
        // }
        // Get.find<ConstantsService>()..isLoggedOut = true;
        // TinySnackBar.material(
        //   'Sesi kamu telah berakhir. Silahkan login kembali',
        //   type: TinySnackBarType.warning,
        //   duration: Duration(seconds: 8),
        //   mobileSnackBarPosition: MobileSnackBarPosition.top,
        //   // Position of snackbar on mobile devices
        //   desktopSnackBarPosition: DesktopSnackBarPosition
        //       .topRight, // Position of snackbar on desktop devices
        // ).show(Get.context!);
        // await AuthUtils.removeSession();
        // // MiscHelper.doLogout();
        // await Get.offAllNamed(AppRoutes.introductionWelcomePage);
        // Get.find<ConstantsService>()..isLoggedOut = false;
      }
    } else if (response.statusCode >= 500) {
      // TinySnackBar.material(
      //   'Wah server lagi penuh nih, sabar yaa', type: TinySnackBarType.error,
      //   duration: Duration(seconds: 2),
      //   mobileSnackBarPosition: MobileSnackBarPosition.top,
      //   // Position of snackbar on mobile devices
      //   desktopSnackBarPosition: DesktopSnackBarPosition
      //       .topRight, // Position of snackbar on desktop devices
      // ).show(Get.context!);
      return;
      // if (showFailMessage) {
      //   AlertHelper.showAlertErrorStatus('no-connection',
      //       errorMessage:
      //           'Terjadi kesalahan, cek koneksimu dan coba ulangi beberapa saat lagi (${returnErrorCode(resultApi.statusCode)}). ${kReleaseMode ? '' : runtimeType}');
      // }
    }
  }

  checkStatus200(Response response) {
    bool doNext = false;
    if (response.statusCode == 200 || response.statusCode == 201) {
      doNext = true;
    } else if (response.statusCode == 422) {
      var responseBody = json.decode(response.body);
      var data = ErrorLaravelResponse.fromJson(responseBody);
      responseData.errors = data.data.errors;
    }
    return doNext;
  }

  checkStatus200B(Response response) {
    bool doNext = false;
    if (response.statusCode == 200 || response.statusCode == 201) {
      doNext = true;
    } else if (response.statusCode == 422) {
      var responseBody = json.decode(response.body);
      var data = ErrorLaravelGenericResponse.fromJson(responseBody);
      responseData.data = data.data;
    }
    return doNext;
  }

  checkStatus200X(StreamedResponse response) async {
    bool doNext = false;
    if (response.statusCode == 200 || response.statusCode == 201) {
      msx = await response.stream.bytesToString();
      Map<String, dynamic> responseBody = json.decode(msx);
      String message = responseBody.containsKey('message') ? responseBody['message'] : '';
      List<dynamic> messages = responseBody.containsKey('messages') ? responseBody['messages'] : [""];
      responseData.message = messages.first != null ? messages.first.toString() : message;
      doNext = true;
    }
    return doNext;
  }

  generateHeader({bool withToken = true, String? token}) async {
    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // headers['AppVersion'] = packageInfo.version +
    //     '.' +
    //     packageInfo.buildNumber +
    //     (FeatureConfig.isMacOS
    //         ? '_MACOS'
    //         : !FeatureConfig.isDesktop
    //             ? (Platform.isIOS ? "_IOS" : "_ANDROID")
    //             : '_DESKTOPCLIENT');
    // // } else {
    // //   headers['AppVersion'] = '3.2_DesktopClient';
    // // }
    if (withToken) {
      var token = await AuthUtils.getAppToken();
      accessToken = token;
      requestHeaders['Authorization'] = 'Bearer $accessToken';
    }
    if (token != null) {
      accessToken = token;
      requestHeaders['Authorization'] = 'Bearer $accessToken';
    }
    if (kReleaseMode == false) {
      print(accessToken);
    }
  }

// Future<bool> cacheResponse(String key, String responses) async {
//   var result = await DatabaseService().insertResponses(
//       ResponsesTable.fromMap({
//     "key": key,
//     "responses": CryptographyHelper().encryptWord(responses)
//   }));
//   if (result == 0) {
//     return true;
//   }
//   return false;
// }

// Future<String?> getResponse(String key) async {
//   var result = await DatabaseService().getResponsesByKey(key);
//   String? responses;
//   if (result != null) {
//     try {
//       responses = CryptographyHelper().decryptWord(result['responses']);
//     } catch (ex) {}
//     return responses;
//   }
//   return responses;
// }

// clearResponses(String key) async {
//   await DatabaseService().removeResponses(key);
// }
}
