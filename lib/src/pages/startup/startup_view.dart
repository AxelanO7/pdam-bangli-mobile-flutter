import 'package:pdam_bangli/src/core/base_import.dart';

import 'startup_controller.dart';

class StartupView extends StatefulWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      backgroundColor: ColorStyle.whiteColor, // appBar: AppBar(
      //   backgroundColor: ColorStyle.whiteColor,
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //       // Android
      //       statusBarColor: ColorStyle.whiteColor,
      //       statusBarIconBrightness: Brightness.dark,
      //       // iOS
      //       statusBarBrightness: Brightness.light,
      //       systemNavigationBarColor: ColorStyle.whiteColor,
      //       systemNavigationBarIconBrightness: Brightness.light,
      //       systemNavigationBarDividerColor: ColorStyle.whiteColor),
      //   toolbarHeight: 0,
      //   elevation: 0,
      //   centerTitle: true,
      // ),
      controller: StartupController(),
      mobile: (controller) => GetBuilder<StartupController>(
        init: StartupController(),
        builder: (controller) => SafeArea(
          child: Scaffold(
            backgroundColor: ColorStyle.whiteColor,
            body: SizedBox(
              height: Get.height,
              width: Get.width,
              child: Stack(
                children: [
                  Positioned(
                    top: Get.height * 2 / 100,
                    right: -Get.width * 75 / 100,
                    child: Container(
                      height: Get.height * 50 / 100,
                      width: Get.width,
                      decoration: ShapeDecoration(
                        shape: OvalBorder(
                          side: BorderSide(
                            width: 0.5,
                            color: ColorStyle.blackColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(48),
                        child: Container(
                          height: Get.height,
                          width: Get.width,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 0.5,
                                color: ColorStyle.blackColor.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -Get.height * 5 / 100,
                    left: -Get.width * 50 / 100,
                    child: Container(
                      height: Get.height * 50 / 100,
                      width: Get.width,
                      decoration: ShapeDecoration(
                        shape: OvalBorder(
                          side: BorderSide(
                            width: 0.5,
                            color: ColorStyle.blackColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(88),
                        child: Container(
                          height: Get.height,
                          width: Get.width,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 0.5,
                                color: ColorStyle.blackColor.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/logo.png'),
                        Text(
                          'Tirta Danu Arta',
                          style: TypographyStyle.heading6Bold.copyWith(color: ColorStyle.blackColor),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: Get.height * 3 / 100,
                    child: SizedBox(
                      width: Get.width,
                      child: Text(
                        'Bangli 2023',
                        style: TypographyStyle.body2Bold.copyWith(
                          color: HexColor('767676'),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
