import 'package:pdam_bangli/src/core/base_import.dart';

class BillItem extends StatelessWidget {
  final Function() onTap;
  final int index;
  const BillItem({super.key, required this.onTap, required this.index});

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
                    index == 0 ? 'Tugas Hitung Meter' : 'Pengaduan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorStyle.blackColor,
                      fontSize: 16,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    index == 0 ? 'Kerjakan Sekarang' : 'Selesai',
                    style: TextStyle(
                      color: index == 0
                          ? const Color(0xFFFFB018)
                          : HexColor('70DEB1'),
                      fontSize: 9,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              Text(
                index == 0
                    ? 'Anda memiliki penugasan yang belum terselesaikan'
                    : 'Pengaduan anda sedang diproses mohon menunggu petugas datang',
                style: const TextStyle(
                  color: Color(0xFF828282),
                  fontSize: 12,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
