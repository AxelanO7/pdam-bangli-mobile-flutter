import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/pages/menu/assignment/assignment_controller.dart';
import 'package:pdam_bangli/src/pages/menu/assignment/widgets/assignment_item.dart';

class AssignmentSection extends StatelessWidget {
  const AssignmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssignmentController>(
      builder: (controller) => SizedBox(
        height: Get.height,
        width: Get.width,
        child: ListView.separated(
          itemCount: 1,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(
            height: 16,
          ),
          itemBuilder: (context, index) =>
              AssignmentItem(onTap: controller.tapAssignmentItem, index: index),
        ),
      ),
    );
  }
}
