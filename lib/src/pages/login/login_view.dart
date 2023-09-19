import 'package:pdam_bangli/src/core/base_import.dart';

import 'login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginController>(
      controller: LoginController(),
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
      mobile: (controller) => GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) => WillPopScope(
          onWillPop: controller.onWillPop,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: ColorStyle.whiteColor,
              body: Container(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                height: Get.height,
                width: Get.width,
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: [
                          SizedBox(height: Get.height * 15 / 100),
                          Text(
                            'Selamat Datang, \n${(controller.isCustomer) ? 'Pelanggan Terhormat' : 'Petugas PDAM'}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorStyle.blackColor,
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Silahkan masukan ${(controller.isCustomer) ? 'nomor rekening PDAM' : 'username'} dan\npassword anda',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorStyle.grey1Color,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 60),
                          TextField(
                            controller: controller.usernameController,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorStyle.grey1Color, width: 0.5),
                              ),
                              hintText: controller.isCustomer
                                  ? 'Nomor Rekening PDAM'
                                  : 'Username',
                              hintStyle: TextStyle(
                                color: ColorStyle.grey1Color,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            style: TextStyle(
                              color: ColorStyle.grey1Color,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            onChanged: (value) {
                              controller.username = value;
                              controller.update();
                            },
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            obscureText: true,
                            controller: controller.passwordController,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: ColorStyle.grey1Color,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorStyle.grey1Color, width: 0.5),
                              ),
                            ),
                            style: TextStyle(
                              color: ColorStyle.grey1Color,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            onChanged: (value) {
                              controller.password = value;
                              controller.update();
                            },
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              SizedBox(
                                width: 16,
                                height: 16,
                                child: Checkbox(
                                  value: controller.isValidatedRemind,
                                  onChanged: (value) =>
                                      controller.tapCheckList(value),
                                  side:
                                      BorderSide(color: ColorStyle.blackColor),
                                  activeColor: ColorStyle.blackColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Ingat saya',
                                style: TextStyle(
                                  color: ColorStyle.blackColor,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            width: Get.width,
                            height: Get.height * 6 / 100,
                            child: ElevatedButton(
                              onPressed: controller
                                          .usernameController.text.isNotEmpty &&
                                      controller
                                          .passwordController.text.isNotEmpty
                                  ? controller.doLogin
                                  : () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: controller.usernameController
                                            .text.isNotEmpty &&
                                        controller
                                            .passwordController.text.isNotEmpty
                                    ? ColorStyle.blackColor
                                    : HexColor('202226').withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(12), // <-- Radius
                                ),
                              ),
                              child: const Text(
                                'Masuk',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'PDAM Tirta Danu Arta',
                            style: TextStyle(
                              color: ColorStyle.grey1Color,
                              fontSize: 14,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
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
