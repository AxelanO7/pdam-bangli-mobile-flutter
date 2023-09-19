import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pdam_bangli/src/core/base_import.dart';

class AssignmentItem extends StatelessWidget {
  final Function() onTap;
  final int index;
  const AssignmentItem({super.key, required this.onTap, required this.index});

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
                    'Pipa bocor sehingga air macet',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorStyle.blackColor,
                      fontSize: 16,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    (index == 1)
                        ? 'Diproses'
                        : (index == 2)
                            ? 'Selesai'
                            : 'Menunggu',
                    style: TextStyle(
                      color: index == 1
                          ? ColorStyle.blackColor
                          : index == 2
                              ? HexColor('49EF0E')
                              : HexColor('FFB018'),
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
                              text: '01-10-2023',
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
                              text: '11-10-2023',
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
                              text: '01-10-2023',
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
                              text: 'Ketut Jerink',
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
                      if (index == 2)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: RatingBar.builder(
                            unratedColor: ColorStyle.blackColor,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                            },
                          ),
                        )
                    ],
                  ),
                  InkWell(
                    onTap: onTap,
                    child: const Text(
                      'Lihat Semua',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
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
