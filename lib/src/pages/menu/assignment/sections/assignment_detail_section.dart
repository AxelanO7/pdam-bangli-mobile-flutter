import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/pages/menu/assignment/assignment_controller.dart';

class AssignmentDetailSection extends StatelessWidget {
  const AssignmentDetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssignmentController>(
      builder: (controller) => SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            Expanded(
              child: controller.isRefresh
                  ? Center(
                      child: SizedBox(
                        height: 32,
                        width: 32,
                        child: CircularProgressIndicator(color: ColorStyle.blackColor),
                      ),
                    )
                  : GoogleMap(
                      initialCameraPosition: CameraPosition(
                        zoom: 50,
                        target: LatLng(double.parse(controller.selectedAssignment?.account.lat ?? '-8.46394469999999'),
                            double.parse(controller.selectedAssignment?.account.lng ?? '115.35238032883625')),
                        // target: LatLng(-8.46394469999999, 115.35238032883625),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
