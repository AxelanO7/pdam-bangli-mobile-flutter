import 'package:pdam_bangli/src/core/base_import.dart';

import 'onboarding_controller.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<OnboardingController>(
      controller: OnboardingController(),
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
      mobile: (controller) => GetBuilder<OnboardingController>(
        init: OnboardingController(),
        builder: (controller) => WillPopScope(
          onWillPop: controller.onWillPop,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: ColorStyle.whiteColor,
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(left: 28, right: 28, bottom: 28),
                child: SizedBox(
                  height: Get.height * 6 / 100,
                  child: ElevatedButton(
                    onPressed: controller.showLoginPopup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorStyle.blackColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    child: Text(
                      'Masuk',
                      style: TypographyStyle.body1bBold,
                    ),
                  ),
                ),
              ),
              body: Container(
                height: Get.height,
                width: Get.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: Get.height * 20 / 100),
                      Image.asset('assets/logo.png'),
                      const SizedBox(height: 48),
                      Text(
                        'Selamat Datang\ndi Aplikasi PDAM Bangli',
                        style: TypographyStyle.heading4Bold
                            .copyWith(color: ColorStyle.blackColor),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Memudahkan bagi para pelanggan untuk\nmelakukan pengecekan & pembayaran\ntagihan PDAM',
                        style: TextStyle(
                          color: ColorStyle.grey1Color,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      )
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
