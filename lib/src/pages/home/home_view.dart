import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/pages/home/widgets/customer_menu_item.dart';

import 'home_controller.dart';
import 'widgets/home_information_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeController>(
      controller: HomeController(), backgroundColor: ColorStyle.whiteColor, // appBar: AppBar(
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
      mobile: (controller) => GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => WillPopScope(
          onWillPop: controller.onWillPop,
          child: SafeArea(
            child: controller.isLoggingOut
                ? Center(
                    child: CircularProgressIndicator(
                    color: ColorStyle.blackColor,
                  ))
                : Scaffold(
                    backgroundColor: ColorStyle.whiteColor,
                    body: SizedBox(
                      height: Get.height,
                      width: Get.width,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: Get.height * 20 / 100,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [ColorStyle.grey1Color, ColorStyle.blackColor],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: Get.width * 5 / 100,
                                  bottom: -40,
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: ColorStyle.grey1Color,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: ColorStyle.whiteColor,
                                        width: 4,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 32,
                                  right: 32,
                                  child: Row(
                                    children: [
                                      Stack(
                                        children: [
                                          const Icon(Icons.notifications_none_outlined),
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: Container(
                                              height: 8,
                                              width: 8,
                                              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      InkWell(onTap: controller.tapLogout, child: const Icon(Icons.logout_rounded))
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 60),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: Get.width * 5 / 100),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.isCustomer ? 'Ni Komang Cintya Purnami ...' : 'Ketut Jhon Cena',
                                    style: TextStyle(
                                      color: ColorStyle.blackColor,
                                      fontSize: 20,
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    controller.isCustomer ? '833988332667' : 'Petugas PDAM',
                                    style: TextStyle(
                                      color: ColorStyle.grey1Color,
                                      fontSize: 14,
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 32),
                                  SingleChildScrollView(
                                    clipBehavior: Clip.none,
                                    scrollDirection: Axis.horizontal,
                                    child: controller.isCustomer
                                        ? Row(
                                            children: [
                                              CustomerMenuItem(typeMenu: 'Rekening', onTap: controller.tapAccount),
                                              const SizedBox(width: 16),
                                              CustomerMenuItem(typeMenu: 'Tagihan', onTap: controller.tapBill),
                                              const SizedBox(width: 16),
                                              CustomerMenuItem(typeMenu: 'Pengaduan', onTap: controller.tapReport),
                                              const SizedBox(width: 16),
                                              CustomerMenuItem(typeMenu: 'Survei', onTap: controller.tapSurvey),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              CustomerMenuItem(typeMenu: 'Baca Meter', onTap: controller.tapAccount),
                                              const SizedBox(width: 16),
                                              CustomerMenuItem(typeMenu: 'Pengaduan', onTap: controller.tapAssignment),
                                              const SizedBox(width: 16),
                                            ],
                                          ),
                                  ),
                                  const SizedBox(height: 24),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset('assets/ic_info.svg'),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Informasi',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: ColorStyle.blackColor,
                                          fontSize: 12,
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: controller.isCustomer ? 3 : 2,
                                    separatorBuilder: (context, index) => const SizedBox(
                                      height: 16,
                                    ),
                                    itemBuilder: (context, index) => HomeInformationItem(
                                      controller: controller,
                                      index: index,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
