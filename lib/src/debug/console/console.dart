import 'package:pdam_bangli/src/core/base_import.dart';

TextEditingController _tokenController = TextEditingController();
TextEditingController _pageController = TextEditingController();
String _targetCategory = "ptk";

Future<void> showDebugConsole(BuildContext context) async {
  var token = await AuthUtils.getAppToken();
  _tokenController.text = token;
  _targetCategory = await SettingsUtils.getString("target_category");
  if (_targetCategory != "ptk" && _targetCategory != "ptn") {
    _targetCategory = "ptk";
  }
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('System Console'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Page Launcher"),
            TextField(
              controller: _pageController,
              decoration: InputDecoration(hintText: "Route Name"),
            ),
            SizedBox(
              height: 16,
            ),
            Text("API Token"),
            TextField(
              controller: _tokenController,
              decoration: InputDecoration(hintText: "Set Token"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorStyle.blackColor,
              ),
              onPressed: () => Get.toNamed(_pageController.text),
              child: Text("Launch Page"),
            ),
          ],
        ),
      );
    },
  );
}
