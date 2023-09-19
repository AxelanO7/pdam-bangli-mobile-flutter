import 'package:pdam_bangli/src/core/base_import.dart';

import 'complaint_controller.dart';

class ComplaintView extends StatelessWidget {
  const ComplaintView({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ComplaintController>(
      controller: ComplaintController(), backgroundColor: ColorStyle.whiteColor, // appBar: AppBar(
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
      mobile: (controller) => GetBuilder<ComplaintController>(
        init: ComplaintController(),
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
                  controller.pageIndex == 0.0 ? 'Pengaduan' : 'Detail Pengaduan',
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
              floatingActionButton: controller.pageIndex == 0
                  ? InkWell(
                      onTap: controller.tapAddComplaint,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: ColorStyle.blackColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: const Icon(Icons.add),
                      ),
                    )
                  : null,
              body: PageView.builder(
                  controller: controller.pageController, physics: const NeverScrollableScrollPhysics(), itemCount: 2, itemBuilder: controller.pageItemBuilder),
            ),
          ),
        ),
      ),
    );
  }
}
