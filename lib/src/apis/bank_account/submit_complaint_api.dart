import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:pdam_bangli/src/core/base_api.dart';
import 'package:pdam_bangli/src/core/base_import.dart';

class SubmitComplaintApi extends BaseApi {
  String url = CoreConfig.getApiUrl() + '/rekening/pengaduan';

  Future<ResultApi> request({File? photo, required int numberBankAccount, String? complaint}) async {
    url += '/$numberBankAccount';

    if (CoreConfig.getDebuggableConfig("is_debug_mode")) LogUtils.log(requestPayload);

    try {
      requestHeaders['Content-Type'] = 'multipart/form-data';
      await generateHeader();

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(requestHeaders);
      if (photo != null) {
        var multipartComplaint = http.MultipartFile.fromString(
          'keluhan',
          complaint!,
        );
        var multipartFile = http.MultipartFile.fromPath(
          'bukti_gambar',
          photo.path,
        );
        request.files.addAll([await multipartComplaint, await multipartFile]);
      } else {
        responseData.status = false;
        return responseData;
      }

      http.StreamedResponse response = await request.send();

      responseData.statusCode = response.statusCode;
      if (await checkStatus200X(response)) {
        responseData.status = true;
        responseData.message = 'Berhasil mengirim pengaduan';
      }
    } catch (e) {
      printError(e);
    }
    return responseData;
  }
}
