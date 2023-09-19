import 'package:pdam_bangli/src/core/base_import.dart';

import 'bill_controller.dart';

class BillView extends StatelessWidget {
  const BillView({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<BillController>(
      controller: BillController(),
      backgroundColor: ColorStyle.whiteColor,
      // appBar: AppBar(
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
      mobile: (controller) => GetBuilder<BillController>(
        init: BillController(),
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
                  controller.pageIndex == 0 ? 'Tagihan' : 'Pembayaran',
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
              body: PageView.builder(
                  controller: controller.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: controller.pageItemBuilder),
            ),
          ),
        ),
      ),
    );
  }
}
