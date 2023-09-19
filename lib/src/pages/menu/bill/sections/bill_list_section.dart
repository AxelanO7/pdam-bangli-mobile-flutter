import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/pages/menu/bill/bill_controller.dart';
import 'package:pdam_bangli/src/pages/menu/bill/widgets/bill_item.dart';

class BillListSection extends StatelessWidget {
  const BillListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BillController>(
      builder: (controller) => SizedBox(
        height: Get.height,
        width: Get.width,
        child: ListView.separated(
          itemCount: 3,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(
            height: 16,
          ),
          itemBuilder: (context, index) =>
              BillItem(onTap: controller.tapBillItem, index: index),
        ),
      ),
    );
  }
}
