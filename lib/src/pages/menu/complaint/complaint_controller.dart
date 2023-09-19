import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdam_bangli/src/apis/bank_account/get_complaints_api.dart';
import 'package:pdam_bangli/src/apis/bank_account/submit_complaint_api.dart';
import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/helpers/alert_helper.dart';
import 'package:pdam_bangli/src/models/bank_account/models/complaint.dart';

import 'popups/add_complaint_popup.dart';
import 'sections/complaint_detail_section.dart';
import 'sections/complaint_list_section.dart';

class ComplaintController extends BaseController {
  PageController pageController = PageController();

  String responseComplaint = "", descComplaint = "";
  int pageIndex = 0, numberBankAccount = 0;
  double scoreRespondedComplaint = 0;
  bool featureBuiltinImageChooser = true, isValidatedComplaint = false, isLoadingComplaints = false, isLoadingAddComplaint = false;
  File? file;

  List<Complaint?>? complaintList;
  Complaint? selectedComplaint;

  TextEditingController responseComplaintController = TextEditingController();
  TextEditingController descComplaintController = TextEditingController();

  @override
  onInit() {
    super.onInit();
  }

  @override
  onReady() async {
    numberBankAccount = await getNumberBankAccount();
    getComplaints();
    super.onReady();
  }

  @override
  onClose() async {
    super.onClose();
  }

  Future<bool> onWillPop() async {
    return onGoBack();
  }

  onGoBack() async {
    if (pageController.page == 0) {
      pageIndex = 0;
      update();
      Get.back();
      return;
    } else {
      pageIndex = 0;
      update();
      await pageController.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
      selectedComplaint = null;
      scoreRespondedComplaint = 0;
      responseComplaint = "";
      return;
    }
  }

  Widget pageItemBuilder(context, position) {
    switch (position) {
      case 0:
        return const ComplaintListSection();
      case 1:
        return const ComplaintDetailSection();
      default:
        return Container();
    }
  }

  tapComplaintItem(Complaint item) async {
    selectedComplaint = item;
    pageIndex = 1;
    update();
    pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    return;
  }

  tapAddComplaint() async {
    await AlertHelper.showBottomSheet(
      const AddComplaintPopup(),
    );
  }

  onTapImage() async {
    var result;
    if (featureBuiltinImageChooser) {
      result = await showCupertinoModalPopup(
        context: Get.context!,
        builder: (BuildContext iContext) => CupertinoActionSheet(
          cancelButton: CupertinoActionSheetAction(
              isDefaultAction: true,
              onPressed: () {
                Get.back();
              },
              child: const Text('Tutup')),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: const Text('Kamera'),
              onPressed: () {
                Get.back(result: 'camera');
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('Galeri'),
              onPressed: () {
                Get.back(result: 'gallery');
              },
            ),
          ],
        ),
      );
    } else {
      result = await showCupertinoModalPopup(
        context: Get.context!,
        builder: (BuildContext iContext) => CupertinoActionSheet(
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Get.back();
            },
            child: const Text('Tutup'),
          ),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: const Text('Kamera'),
              onPressed: () {
                Get.back(result: 'camera');
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('Galeri'),
              onPressed: () {
                Get.back(result: 'gallery');
              },
            ),
          ],
        ),
      );
    }
    file = null;
    if (result != null) {
      if (result == 'camera') {
        await onTapCamera();
      } else if (result == 'gallery') {
        await onTapGallery();
      }
    }
    updatePhoto();
  }

  onTapCamera() async {
    var result = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 25);
    if (result != null) {
      file = File(result.path);
      update();
    }
  }

  onTapGallery() async {
    var result = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 25);
    if (result != null) {
      file = File(result.path);
      update();
    }
  }

  updatePhoto() async {
    if (file != null) {}
    //   isUploadingNewPhoto = true;
    //   update();
    //   var result = await ChangePhotoProfileApi().request(file);
    //   if (result.status) {
    //     AlertHelper.snackbar(result.message);
    //     if (result.message != null &&
    //         result.message!.toLowerCase().contains('sukses')) update();
    //   }
    // }
    // await getStudentProfile();
    // res = "back_to_profile";
    // // await getStudentPhoto();
    // isUploadingNewPhoto = false;
    update();
  }

  tapCheckList(val) {
    isValidatedComplaint = val;
    update();
  }

  getComplaints() async {
    isLoadingComplaints = true;
    update();
    var result = await GetComplaintsApi().request(accountId: numberBankAccount);
    if (result.status) {
      complaintList = result.listData as List<Complaint?>;
    } else {
      AlertHelper.snackbar(result.message, isError: true, title: "Gagal");
    }
    isLoadingComplaints = false;
    update();
  }

  addComplaint() async {
    isLoadingAddComplaint = true;
    update();
    String errorMessages = "";
    if (descComplaintController.text == "") {
      errorMessages += "Deskripsi pengaduan tidak boleh kosong\n";
    }
    if (file == null) {
      errorMessages += "Foto pengaduan tidak boleh kosong\n";
    }
    if (isValidatedComplaint == false) {
      errorMessages += "Anda harus menyetujui syarat dan ketentuan\n";
    }
    if (errorMessages != "") {
      AlertHelper.snackbar(errorMessages, title: "Pengaduan Gagal Ditambahkan", isError: true);
      isLoadingAddComplaint = false;
      update();
      return;
    }

    var result = await SubmitComplaintApi().request(complaint: descComplaint, photo: file!, numberBankAccount: numberBankAccount);
    if (result.status) {
      Get.back();
      AlertHelper.snackbar(result.message);
      onReady();
    } else {
      AlertHelper.snackbar(result.message, isError: true);
    }
    isLoadingAddComplaint = false;
    update();
  }
}
