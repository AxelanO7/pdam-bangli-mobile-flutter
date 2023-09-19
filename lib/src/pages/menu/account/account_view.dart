import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/helpers/time_helper.dart';

import 'account_controller.dart';

class AccountView extends StatelessWidget {
  const AccountView({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<AccountController>(
      controller: AccountController(), backgroundColor: ColorStyle.whiteColor, // appBar: AppBar(
      //   backgroundColor: ColorStyle.whiteColor,
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     // Android
      //     statusBarColor: ColorStyle.whiteColor,
      //     statusBarIconBrightness: Brightness.dark,
      //     // iOS
      //     statusBarBrightness: Brightness.light,
      //     systemNavigationBarColor: ColorStyle.whiteColor,
      //     systemNavigationBarIconBrightness: Brightness.light,
      //     systemNavigationBarDividerColor: ColorStyle.whiteColor,
      //   ),
      //   toolbarHeight: 0,
      //   elevation: 0,
      // ),
      mobile: (controller) => GetBuilder<AccountController>(
        init: AccountController(),
        builder: (controller) => WillPopScope(
          onWillPop: controller.onWillPop,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: ColorStyle.whiteColor,
              appBar: AppBar(
                backgroundColor: ColorStyle.whiteColor,
                elevation: 0,
                leading: InkWell(
                  onTap: controller.onGoBack,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: ColorStyle.blackColor,
                    size: 16,
                  ),
                ),
                title: Text(
                  controller.isCustomer ? 'Rekening' : 'Hitung Meter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorStyle.blackColor,
                    fontSize: 16,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                centerTitle: true,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.more_horiz,
                      color: ColorStyle.blackColor,
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: controller.isLoadingGetBankAccount
                  ? SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 36),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 28),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: ColorStyle.whiteColor,
                                border: Border.all(
                                  color: ColorStyle.greyColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Lokasi PDAM',
                                        style: TextStyle(
                                          color: ColorStyle.blackColor,
                                          fontSize: 16,
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: controller.onRefreshLocation,
                                        child: Icon(
                                          Icons.refresh,
                                          color: ColorStyle.blackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Divider(
                                    thickness: 1,
                                    color: HexColor('EFEFEF'),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/ic_info.svg'),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Informasi',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: ColorStyle.blackColor,
                                          fontSize: 12,
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: HexColor('49EF0E'),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                        ),
                                        child: const Text(
                                          'Aktif',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontFamily: 'Plus Jakarta Sans',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'No Rekening : ${controller.detailBankAccount.numberBankAccount}',
                                    style: TextStyle(
                                      color: ColorStyle.blackColor,
                                      fontSize: 14,
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Nama Pelanggan : ${controller.detailBankAccount.customer.nameCustomer}',
                                    style: TextStyle(
                                      color: ColorStyle.blackColor,
                                      fontSize: 14,
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Wilayah : ${controller.detailBankAccount.subdistrict ?? ""} - ${controller.detailBankAccount.ward ?? ""}',
                                    style: TextStyle(
                                      color: ColorStyle.blackColor,
                                      fontSize: 14,
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Alamat : ${controller.detailBankAccount.customer.addressCustomer}',
                                    style: TextStyle(
                                      color: ColorStyle.blackColor,
                                      fontSize: 14,
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Tanggal Aktif : ${TimeHelper.convertTimeCustomFormatterFromISO(controller.detailBankAccount.customer.createdAt, "dd MMMM yyyy", toWib: true)}',
                                    style: TextStyle(
                                      color: ColorStyle.blackColor,
                                      fontSize: 14,
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              body: controller.isLoadingGetBankAccount
                  ? Center(
                      child: SizedBox(
                        height: 32,
                        width: 32,
                        child: CircularProgressIndicator(color: ColorStyle.blackColor),
                      ),
                    )
                  : SizedBox(
                      height: Get.height,
                      width: Get.width,
                      child: Column(
                        children: [
                          Expanded(
                            child: controller.isRefresh
                                ? Center(
                                    child: SizedBox(
                                      height: 32,
                                      width: 32,
                                      child: CircularProgressIndicator(color: ColorStyle.blackColor),
                                    ),
                                  )
                                : const GoogleMap(
                                    initialCameraPosition: CameraPosition(
                                      zoom: 50,
                                      target: LatLng(-8.46394469999999, 115.35238032883625),
                                    ),
                                  ),
                          ), // SizedBox(
                          //   height: 160,
                          //   width: Get.width,
                          // )
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
