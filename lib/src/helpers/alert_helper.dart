import 'package:pdam_bangli/src/core/base_import.dart';

class AlertHelper {
  static showBottomSheet(Widget content,
      {bool canHide = true, bool disablePadding = false}) async {
    var data;
    data = await showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: canHide,
      enableDrag: canHide,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      context: Get.context!,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () => Future.value(false),
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                  padding: EdgeInsets.only(
                      top: 16,
                      left: disablePadding
                          ? 0
                          : context.isTablet
                              ? context.isLargeTablet
                                  ? Get.width * .25
                                  : Get.width * .15
                              : 0,
                      right: disablePadding
                          ? 0
                          : context.isTablet
                              ? context.isLargeTablet
                                  ? Get.width * .25
                                  : Get.width * .15
                              : 0),
                  decoration: BoxDecoration(
                    color: ColorStyle.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top -
                          85),
                  child: content),
            ));
      },
    );
    return data;
  }

  static showScaleDialog(Widget content,
      {bool barrierDismissible = true, bool useTransparent = false}) async {
    var data;
    if (!(Get.isSnackbarOpen) && !(Get.isDialogOpen ?? false)) {
      data = await showGeneralDialog(
          barrierColor: ColorStyle.blackColor.withOpacity(0.5),
          transitionBuilder: (context, a1, a2, widget) {
            return Transform.scale(
              scale: a1.value,
              child: Opacity(
                opacity: a1.value,
                child: SafeArea(
                  minimum: EdgeInsets.symmetric(
                      horizontal: context.isTablet
                          ? context.isLargeTablet
                              ? Get.width * .25
                              : Get.width * .15
                          : 0,
                      vertical: context.isTablet
                          ? context.isLargeTablet
                              ? Get.height * .02
                              : 0
                          : 0),
                  child: AlertDialog(
                      backgroundColor:
                          useTransparent ? Colors.transparent : null,
                      contentPadding: EdgeInsets.zero,
                      shape: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 5.0),
                          borderRadius: BorderRadius.circular(16.0)),
                      content: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: content)),
                ),
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 150),
          barrierDismissible: barrierDismissible,
          barrierLabel: '',
          context: Get.context!,
          pageBuilder: (context, animation1, animation2) => const SizedBox());
    }
    return data;
  }

  static void snackbar(String? message,
      {String? title, bool isError = false, int? timeout}) {
    if (message != null) {
      if (!(Get.isSnackbarOpen) && !(Get.isDialogOpen ?? false)) {
        Get.snackbar(
          title ?? 'Info', message, snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.TOP,
          // barBlur: 0,
          backgroundColor: isError
              ? Colors.red.withOpacity(.8)
              : Colors.green.withOpacity(.8),
          colorText: ColorStyle.whiteColor,
          borderRadius: 20,
          duration: Duration(seconds: timeout ?? 3),
          icon: Icon(
            Icons.info_outline,
            color: ColorStyle.whiteColor,
          ),
          shouldIconPulse: true,
        );
      }
    }
  }
}
