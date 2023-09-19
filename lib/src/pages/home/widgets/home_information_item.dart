import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/pages/home/home_controller.dart';

class HomeInformationItem extends StatelessWidget {
  final int index;
  HomeController controller;

  HomeInformationItem(
      {super.key, required this.index, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            children: [
              Text(
                index == 0
                    ? 'Tugas Hitung Meter'
                    : index == 1
                        ? 'Pengaduan'
                        : 'Pengumuman',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorStyle.blackColor,
                  fontSize: 16,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (controller.isCustomer && index == 1)
                const Row(
                  children: [
                    SizedBox(width: 8),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Nomor Tiket ',
                            style: TextStyle(
                              color: Color(0xFFF4C315),
                              fontSize: 10,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: '#2802000123',
                            style: TextStyle(
                              color: Color(0xFFF4C315),
                              fontSize: 10,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              Spacer(),
              Text(
                index == 0
                    ? 'Kerjakan Sekarang'
                    : index == 1
                        ? 'Selesai'
                        : 'Lihat Semua',
                style: TextStyle(
                    color: index == 0
                        ? const Color(0xFFFFB018)
                        : index == 1
                            ? HexColor('70DEB1')
                            : ColorStyle.blackColor,
                    fontSize: 9,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w700,
                    decoration: index == 2
                        ? TextDecoration.underline
                        : TextDecoration.none),
              )
            ],
          ),
          const SizedBox(height: 4),
          Text(
            index == 0
                ? 'Anda memiliki penugasan yang belum terselesaikan'
                : index == 1
                    ? 'Pengaduan anda sedang diproses mohon menunggu petugas datang'
                    : 'Pelanggan Yth. Dengan ini kami sampaikan bahwa akan ada gangguan air di wilayah anda pada tanggal 28-02-2023 karena adanya perbaikan pipa.',
            style: const TextStyle(
              color: Color(0xFF828282),
              fontSize: 12,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
