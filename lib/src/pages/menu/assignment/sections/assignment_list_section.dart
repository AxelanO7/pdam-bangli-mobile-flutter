import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/pages/menu/assignment/assignment_controller.dart';
import 'package:pdam_bangli/src/pages/menu/assignment/widgets/assignment_item.dart';

class ListAssignmentSection extends StatelessWidget {
  const ListAssignmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssignmentController>(
      builder: (controller) => controller.isLoadingAssignments
          ? Center(
              child: SizedBox(
                height: 32,
                width: 32,
                child: CircularProgressIndicator(color: ColorStyle.blackColor),
              ),
            )
          : SizedBox(
              height: Get.height,
              width: Get.width,
              child: ListView.separated(
                itemCount: controller.listAssignment?.length ?? 0,
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
                itemBuilder: (context, index) {
                  var item = controller.listAssignment?[index];
                  return AssignmentItem(onTap: () => controller.tapAssignmentItem(item!), index: index, item: item);
                },
              ),
            ),
    );
  }
}
