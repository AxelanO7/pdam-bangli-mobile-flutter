import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/pages/onboarding/onboarding_controller.dart';

class OnboardingPopup extends StatelessWidget {
  const OnboardingPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 24),
            Text(
              'Masuk Sebagai',
              style: TypographyStyle.heading6Bold
                  .copyWith(color: ColorStyle.blackColor),
            ),
            Text(
              'Masuk terlebih dahulu sebelum\nmengakses aplikasi PDAM Tirta Danu Arta',
              style: TextStyle(
                color: ColorStyle.grey1Color,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 68),
            SizedBox(
              height: Get.height * 6.5 / 100,
              width: Get.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorStyle.blackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: controller.tapLoginCustomer,
                child: Text(
                  'Pelanggan PDAM',
                  style: TypographyStyle.body1bBold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: Get.height * 6.5 / 100,
              width: Get.width,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: ColorStyle.blackColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: controller.tapLoginOfficer,
                child: Text(
                  'Petugas PDAM',
                  style: TypographyStyle.body1bBold
                      .copyWith(color: ColorStyle.blackColor),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
