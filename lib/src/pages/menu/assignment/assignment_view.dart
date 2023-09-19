import 'package:pdam_bangli/src/core/base_import.dart';

import 'assignment_controller.dart';

class AssignmentView extends StatelessWidget {
  const AssignmentView({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<AssignmentController>(
      controller: AssignmentController(), backgroundColor: ColorStyle.whiteColor, // appBar: AppBar(
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
      mobile: (controller) => GetBuilder<AssignmentController>(
        init: AssignmentController(),
        builder: (controller) => WillPopScope(
          onWillPop: controller.onWillPop,
          child: SafeArea(
            child: Scaffold(
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
                  controller.pageIndex == 0.0 ? 'Daftar Penugasan Pengaduan' : 'Penanganan Pengaduan',
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
              backgroundColor: ColorStyle.whiteColor,
              // todo : detail assignment information
              bottomNavigationBar: controller.pageIndex != 0
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: SizedBox(
                        height: 320,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -20,
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
                                    SizedBox(
                                      width: Get.width - 92,
                                      child: Row(
                                        children: [
                                          Text(
                                            'Lokasi Pengaduan',
                                            style: TextStyle(
                                              color: ColorStyle.blackColor,
                                              fontSize: 16,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const Spacer(),
                                          InkWell(
                                            onTap: controller.onRefreshLocation,
                                            child: Icon(
                                              Icons.refresh,
                                              color: ColorStyle.blackColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 200),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 24),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        height: Get.height * 6 / 100,
                                        child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(color: ColorStyle.blackColor),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12), // <-- Radius
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            'Di Proses',
                                            style: TypographyStyle.body1bBold.copyWith(color: ColorStyle.blackColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 24),
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        height: Get.height * 6 / 100,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: ColorStyle.blackColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12), // <-- Radius
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            'Selesai',
                                            style: TypographyStyle.body1bBold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              body: PageView.builder(
                  controller: controller.pageController, itemCount: 2, physics: const NeverScrollableScrollPhysics(), itemBuilder: controller.pageItemBuilder),
            ),
          ),
        ),
      ),
    );
  }
}
