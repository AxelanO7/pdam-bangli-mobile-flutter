import 'dart:convert';

import 'package:pdam_bangli/src/core/base_api.dart';
import 'package:pdam_bangli/src/core/base_import.dart';

class RegisterApi extends BaseApi {
  String url = CoreConfig.getApiUrl() + '/auth/register';

  Future<ResultApi> request({
    required String numberBankAccount,
    required String customerNumber,
    required String customerName,
    required String customerNin,
    required String username,
    required String email,
    required String password,
  }) async {
    requestPayload = {
      "no_rekening": numberBankAccount,
      "no_pelanggan": customerNumber,
      "nama_pelanggan": customerName,
      "nik_pelanggan": customerNin,
      "username": username,
      "email": email,
      "password": password,
    };

    if (CoreConfig.getDebuggableConfig("is_debug_mode")) print(requestPayload);

    try {
      var response = await post(Uri.parse(url), body: json.encode(requestPayload), headers: requestHeaders);

      checkResponse(response);

      responseData.statusCode = response.statusCode;
      if (checkStatus200(response)) {
        var responseBody = json.decode(response.body);
        responseData.status = true;
        // todo : massage
      }
    } catch (e) {
      printError(e);
    }
    return responseData;
  }
}
