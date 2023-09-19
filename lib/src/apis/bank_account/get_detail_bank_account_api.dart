import 'dart:convert';

import 'package:pdam_bangli/src/core/base_api.dart';
import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/models/bank_account/models/detail_bank_account.dart';

class GetDetailBankAccountApi extends BaseApi {
  String url = CoreConfig.getApiUrl() + '/rekening';

  Future<ResultApi> request({required int numberBankAccount}) async {
    url += '/$numberBankAccount';

    if (CoreConfig.getDebuggableConfig("is_debug_mode")) LogUtils.log(requestPayload);

    try {
      await generateHeader(withToken: true);

      var response = await get(Uri.parse(url), headers: requestHeaders);

      checkResponse(response);

      responseData.statusCode = response.statusCode;

      if (checkStatus200(response)) {
        var responseBody = json.decode(response.body);
        var data = DetailBankAccount.fromJson(responseBody);
        responseData.status = true;
        responseData.data = data;
      }
    } catch (e) {
      printError(e);
    }
    return responseData;
  }
}
