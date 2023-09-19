import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pdam_bangli/src/core/base_import.dart';

import 'survey_controller.dart';

class SurveyView extends StatelessWidget {
  const SurveyView({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SurveyController>(
      controller: SurveyController(),
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
      mobile: (controller) => GetBuilder<SurveyController>(
        init: SurveyController(),
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
                  'Survei Kepuasan Pelanggan',
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
              body: SizedBox(
                height: Get.height,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            border: Border.all(
                                width: 1, color: ColorStyle.blackColor),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 40),
                          child: const Text(
                            'Mohon berikan penilaian demi \npelayanan yang lebih baik',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Apakah air jernih?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      RatingBar.builder(
                        unratedColor: ColorStyle.blackColor,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Apakah air mengalir normal?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      RatingBar.builder(
                        unratedColor: ColorStyle.blackColor,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Apakah pelayanan aduan balik?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      RatingBar.builder(
                        unratedColor: ColorStyle.blackColor,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      const SizedBox(height: 60),
                      TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorStyle.grey1Color, width: 0.5),
                          ),
                          hintText:
                              'Berikan tanggapan anda terkait penanganan aduan ini',
                          hintStyle: TextStyle(
                            color: ColorStyle.grey1Color,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        style: TextStyle(
                          color: ColorStyle.grey1Color,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: SizedBox(
                          width: Get.width,
                          height: Get.height * 6 / 100,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorStyle.blackColor,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12), // <-- Radius
                              ),
                            ),
                            child: const Text(
                              'Simpan',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
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
