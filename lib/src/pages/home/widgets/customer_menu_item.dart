import 'package:flutter_svg/svg.dart';
import 'package:pdam_bangli/src/core/base_import.dart';

class CustomerMenuItem extends StatelessWidget {
  final String typeMenu;
  final Function() onTap;

  const CustomerMenuItem({super.key, required this.typeMenu, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorStyle.whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
              color: ColorStyle.whiteColor,
              blurRadius: 20,
              offset: const Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorStyle.greyColor,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    'assets/ic_${(typeMenu == 'Tagihan') ? 'bill' : (typeMenu == 'Pengaduan') ? 'report' : (typeMenu == 'Survei') ? 'survey' : 'account_bank'}.svg',
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  typeMenu,
                  style: TextStyle(
                    color: ColorStyle.blackColor,
                    fontSize: 16,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
