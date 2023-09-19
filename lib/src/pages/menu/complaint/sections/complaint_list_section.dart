import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/pages/menu/complaint/complaint_controller.dart';
import 'package:pdam_bangli/src/pages/menu/complaint/widgets/complaint_item.dart';

class ComplaintListSection extends StatelessWidget {
  const ComplaintListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComplaintController>(
      builder: (controller) => controller.isLoadingComplaints
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
                itemCount: controller.complaintList?.length ?? 0,
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
                itemBuilder: (context, index) {
                  var item = controller.complaintList?[index];
                  return ComplaintItem(onTap: () => controller.tapComplaintItem(item!), index: index, item: item);
                },
              ),
            ),
    );
  }
}
