import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/pages/menu/bill/bill_controller.dart';

class BillPurchaseSection extends StatelessWidget {
  const BillPurchaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BillController>(
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
                        'Januari 2023',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorStyle.blackColor,
                          fontSize: 16,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Text(
                        'Belum Lunas',
                        style: TextStyle(
                          color: Color(0xFFFFB018),
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
                          text: 'Total Kilometer : ',
                          style: TextStyle(
                            color: HexColor('A0A7BA'),
                            fontSize: 12,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: '23.233',
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
                          text: 'Tagihan : ',
                          style: TextStyle(
                            color: HexColor('A0A7BA'),
                            fontSize: 12,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: 'Rp. 150.000',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: Get.width,
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
                  Text(
                    'Pilih Bank',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorStyle.blackColor,
                      fontSize: 16,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Pilih bank yang tersedia untuk melakukan\npembayaran tagihan',
                    style: TextStyle(
                      color: HexColor('A0A7BA'),
                      fontSize: 12,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/bpd.png'),
                        const SizedBox(width: 24),
                        Image.asset('assets/bca.png'),
                        const SizedBox(width: 24),
                        Image.asset('assets/bri.png')
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Nomor Virtual Account',
                          style: TextStyle(
                            color: HexColor('A0A7BA'),
                            fontSize: 12,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '992073728747927397',
                          style: TextStyle(
                            color: ColorStyle.blackColor,
                            fontSize: 24,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Berlaku hingga 20/04/2023',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorStyle.blackColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'PROSES',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
