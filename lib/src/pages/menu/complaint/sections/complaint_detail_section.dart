import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/helpers/time_helper.dart';
import 'package:pdam_bangli/src/pages/menu/complaint/complaint_controller.dart';

class ComplaintDetailSection extends StatelessWidget {
  const ComplaintDetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComplaintController>(
      builder: (controller) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorStyle.whiteColor,
                border: Border.all(
                  color: HexColor('EFEFEF'),
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1E0F0F0F),
                    blurRadius: 32,
                    offset: Offset(0, 25),
                    spreadRadius: -24,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${controller.selectedComplaint?.complaint}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorStyle.blackColor,
                          fontSize: 16,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        controller.selectedComplaint?.status == 2
                            ? 'Menunggu'
                            : controller.selectedComplaint?.status == 3
                                ? 'Diproses'
                                : controller.selectedComplaint?.status == 4
                                    ? 'Selesai'
                                    : 'Belum Dikonfirmasi',
                        style: TextStyle(
                          color: controller.selectedComplaint?.status == 1
                              ? HexColor('FFB018')
                              : controller.selectedComplaint?.status == 2
                                  ? ColorStyle.blackColor
                                  : controller.selectedComplaint?.status == 4
                                      ? HexColor('49EF0E')
                                      : ColorStyle.blackColor,
                          fontSize: 9,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Tanggal Lapor : ',
                          style: TextStyle(
                            color: HexColor('A0A7BA'),
                            fontSize: 12,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: '${TimeHelper.convertTimeCustomFormatterFromISO(controller.selectedComplaint?.dateReport ?? "", "dd-MM-yyyy")}',
                          style: TextStyle(
                            color: HexColor('A0A7BA'),
                            fontSize: 12,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Tanggal Konfirmasi : ',
                          style: TextStyle(
                            color: HexColor('A0A7BA'),
                            fontSize: 12,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text:
                              '${controller.selectedComplaint?.dateConfirmationPdam == '-' ? '-' : TimeHelper.convertTimeCustomFormatterFromISO(controller.selectedComplaint?.dateConfirmationPdam ?? "", "dd-MM-yyyy")}',
                          style: TextStyle(
                            color: HexColor('A0A7BA'),
                            fontSize: 12,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Tanggal Selesai : ',
                          style: TextStyle(
                            color: HexColor('A0A7BA'),
                            fontSize: 12,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text:
                              '${controller.selectedComplaint?.dateComplete == '-' || controller.selectedComplaint?.dateComplete == null ? '-' : controller.selectedComplaint?.dateComplete ?? "-"}',
                          style: TextStyle(
                            color: HexColor('A0A7BA'),
                            fontSize: 12,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Nama Petugas : ',
                          style: TextStyle(
                            color: HexColor('A0A7BA'),
                            fontSize: 12,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: '${controller.selectedComplaint?.officer ?? '-'}',
                          style: TextStyle(
                            color: HexColor('A0A7BA'),
                            fontSize: 12,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (controller.selectedComplaint?.status == 4)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Beri Penilaian',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorStyle.blackColor,
                      fontSize: 16,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: RatingBar.builder(
                      unratedColor: ColorStyle.blackColor,
                      initialRating: controller.selectedComplaint?.score == null ? 0 : controller.selectedComplaint?.score?.toDouble() ?? 0,
                      minRating: 0,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        controller.scoreRespondedComplaint = rating;
                        controller.update();
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: controller.responseComplaintController,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorStyle.grey1Color, width: 0.5),
                      ),
                      hintText: 'Berikan tanggapan anda terkait penanganan aduan ini',
                      hintStyle: TextStyle(
                        color: ColorStyle.grey1Color,
                        fontSize: 14,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    style: TextStyle(
                      color: ColorStyle.grey1Color,
                      fontSize: 14,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w400,
                    ),
                    onChanged: (value) {
                      controller.responseComplaint = value;
                      controller.update();
                    },
                  ),
                ],
              ),
            ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 32),
            child: SizedBox(
              width: Get.width,
              height: Get.height * 6 / 100,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorStyle.blackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
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
    );
  }
}
