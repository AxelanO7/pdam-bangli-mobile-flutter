import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/helpers/time_helper.dart';
import 'package:pdam_bangli/src/models/officer/models/report.dart';

class AssignmentItem extends StatelessWidget {
  final Function() onTap;
  final int index;
  final Report? item;
  const AssignmentItem({super.key, required this.onTap, required this.index, this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
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
                    item?.complaint ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorStyle.blackColor,
                      fontSize: 16,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    item?.status == 2
                        ? 'Menunggu'
                        : item?.status == 3
                            ? 'Diproses'
                            : item?.status == 4
                                ? 'Selesai'
                                : 'Belum Dikonfirmasi',
                    style: TextStyle(
                      color: item?.status == 1
                          ? HexColor('FFB018')
                          : item?.status == 2
                              ? ColorStyle.blackColor
                              : item?.status == 4
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Total Lapor : ',
                              style: TextStyle(
                                color: HexColor('A0A7BA'),
                                fontSize: 12,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: '${TimeHelper.convertTimeCustomFormatterFromISO(item?.dateReport ?? "", "dd-MM-yyyy")}',
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
                                  '${item?.dateConfirmationPdam == '-' ? '-' : TimeHelper.convertTimeCustomFormatterFromISO(item?.dateConfirmationPdam ?? "", "dd-MM-yyyy")}',
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
                              text: '${item?.dateComplete == '-' ? '-' : TimeHelper.convertTimeCustomFormatterFromISO(item?.dateComplete ?? "", "dd-MM-yyyy")}',
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
                              text: '${item?.officer ?? "-"}',
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
                      if (item?.status == 4)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: RatingBar.builder(
                            ignoreGestures: true,
                            unratedColor: ColorStyle.blackColor,
                            initialRating: item?.score?.toDouble() ?? 0,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                        )
                    ],
                  ),
                  const Text(
                    'Lihat Semua',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
