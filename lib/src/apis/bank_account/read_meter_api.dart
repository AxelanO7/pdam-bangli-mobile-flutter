import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:pdam_bangli/src/core/base_api.dart';
import 'package:pdam_bangli/src/core/base_import.dart';

class ReadMeterApi extends BaseApi {
  String url = CoreConfig.getApiUrl() + '/rekening/baca-meter';

  Future<ResultApi> request({File? photo, required int numberBankAccount}) async {
    url += '/$numberBankAccount';

    if (CoreConfig.getDebuggableConfig("is_debug_mode")) LogUtils.log(requestPayload);

    try {
      requestHeaders['Content-Type'] = 'multipart/form-data';
      await generateHeader();

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(requestHeaders);
      if (photo != null) {
        var multipartFile = http.MultipartFile.fromPath(
          'foto_meter',
          photo.path,
        );
        request.files.add(await multipartFile);
      } else {
        responseData.status = false;
        return responseData;
      }

      http.StreamedResponse response = await request.send();

      responseData.statusCode = response.statusCode;
      if (await checkStatus200X(response)) {
        responseData.status = true;
        // responseData.message = "Foto berhasil diubah";
      }
      // checkResponse(response);
      // if (checkStatus200(response)) {
      // var responseBody = json.decode(response.body);
      // var data = LoginOfficerResponse.fromJson(responseBody);
      // var dataLogin = LoginOfficer.fromJson(responseBody);
      // responseData.status = true;
      // responseData.data = data;
      // responseData.message = data.message;
      // }
    } catch (e) {
      printError(e);
    }
    return responseData;
  }

//   try {
//     var response = await post(Uri.parse(url), body: json.encode(requestPayload), headers: requestHeaders);
//
//     checkResponse(response);
//
//     responseData.statusCode = response.statusCode;
//
//     if (checkStatus200(response)) {
//       var responseBody = json.decode(response.body);
//       var data = LoginOfficerResponse.fromJson(responseBody);
//       // var dataLogin = LoginOfficer.fromJson(responseBody);
//       responseData.status = true;
//       responseData.data = data;
//       responseData.message = data.message;
//     }
//   } catch (e) {
//     printError(e);
//   }
//   return responseData;
// }
}
