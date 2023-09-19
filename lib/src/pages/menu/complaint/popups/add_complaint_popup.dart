import 'dart:io';

import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/pages/menu/complaint/complaint_controller.dart';

class AddComplaintPopup extends StatelessWidget {
  const AddComplaintPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComplaintController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 24),
              Text(
                'Deskripsi Kendala',
                style: TypographyStyle.heading6Bold.copyWith(color: ColorStyle.blackColor),
              ),
              const SizedBox(height: 28),
              TextField(
                controller: controller.descComplaintController,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorStyle.grey1Color, width: 0.5),
                  ),
                  hintText: 'Contoh: Pipa bocor sehingga air macet',
                  hintStyle: TextStyle(
                    color: ColorStyle.grey1Color,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorStyle.grey1Color, width: 0.5),
                  ),
                ),
                style: TextStyle(
                  color: ColorStyle.grey1Color,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
                onChanged: (value) {
                  controller.descComplaint = value;
                  controller.update();
                },
              ),
              const SizedBox(height: 36),
              Text(
                'Foto Kendala',
                style: TypographyStyle.heading6Bold.copyWith(color: ColorStyle.blackColor),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: controller.onTapImage,
                child: controller.file != null
                    ? Image.file(
                        controller.file ?? File(''),
                        width: Get.width,
                        height: 200,
                      )
                    : Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 28),
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: HexColor('efefef'),
                        ),
                        child: Icon(
                          size: 32,
                          Icons.camera_alt_outlined,
                          color: ColorStyle.blackColor,
                        ),
                      ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: Checkbox(
                      value: controller.isValidatedComplaint,
                      onChanged: (value) => controller.tapCheckList(value),
                      activeColor: ColorStyle.blackColor,
                      side: BorderSide(color: ColorStyle.blackColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Dengan ini saya menyatakan, laporan yang saya buat adalah benar adanya',
                      style: TextStyle(
                        color: ColorStyle.blackColor,
                        fontSize: 14,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 56),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: Get.height * 6.5 / 100,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: ColorStyle.blackColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                        onPressed: Get.back,
                        child: Text(
                          'Batal',
                          style: TypographyStyle.body1bBold.copyWith(color: ColorStyle.blackColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: Get.height * 6.5 / 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorStyle.blackColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // <-- Radius
                          ),
                        ), // todo : add onTap
                        onPressed: controller.addComplaint,
                        child: Text(
                          'Buat Pengaduan',
                          style: TypographyStyle.body1bBold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
