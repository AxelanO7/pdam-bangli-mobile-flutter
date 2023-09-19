import 'dart:convert';

import 'package:pdam_bangli/src/core/base_api.dart';
import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/models/officer/models/report.dart';
import 'package:pdam_bangli/src/models/bank_account/responses/get_complaints_response.dart';

class AnswerSurveyApi extends BaseApi {
  String url = CoreConfig.getApiUrl() + '/rekening/jawab-survey';

  Future<ResultApi> request({required int score, required int questionId, required int numberBankAccount}) async {
    url += '/$numberBankAccount';

    requestPayload = {
      "score": score,
      "question_id": questionId,
    };

    if (CoreConfig.getDebuggableConfig("is_debug_mode")) LogUtils.log(requestPayload);

    try {
      await generateHeader(withToken: true);

      var response = await post(Uri.parse(url), body: json.encode(requestPayload), headers: requestHeaders);

      checkResponse(response);

      responseData.statusCode = response.statusCode;

      if (checkStatus200(response)) {
        // List<dynamic> responseBody = json.decode(response.body);
        // var responseBody = json.decode(response.body);
        // List<Report?> listtData = responseBody.map((e) => Report.fromJson(e)).toList();
        // var data = GetReportResponse.fromJson(responseBody);
        // responseData.status = true;
        // responseData.listData = listtData;
      }
    } catch (e) {
      printError(e);
    }
    return responseData;
  }
}
