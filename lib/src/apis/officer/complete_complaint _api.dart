import 'dart:convert';

import 'package:pdam_bangli/src/core/base_api.dart';
import 'package:pdam_bangli/src/core/base_import.dart';

class CompleteComplaintApi extends BaseApi {
  String url = CoreConfig.getApiUrl() + '/pegawai/pengaduan/selesai';

  Future<ResultApi> request({required String complaintId,}) async {
    url += '/$complaintId';

    // requestPayload = {
    //   "username": username,
    //   "password": password,
    //   "device_token": fcmToken,
    // };

    if (CoreConfig.getDebuggableConfig("is_debug_mode")) LogUtils.log(requestPayload);

    try {
      var response = await put(Uri.parse(url), body: json.encode(requestPayload), headers: requestHeaders);

      checkResponse(response);

      responseData.statusCode = response.statusCode;

      if (checkStatus200(response)) {
        var responseBody = json.decode(response.body);
        var data = LoginOfficerResponse.fromJson(responseBody);
        // var dataLogin = LoginOfficer.fromJson(responseBody);
        responseData.status = true;
        responseData.data = data;
        responseData.message = data.message;
      }
    } catch (e) {
      printError(e);
    }
    return responseData;
  }
}
