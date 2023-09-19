import 'package:pdam_bangli/src/core/base_import.dart';

import 'src/pages/startup/startup_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: const [Locale(id'), Locale('en')],
      // locale: const Locale('id', 'ID'),
      // fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData.dark(),
      home: const StartupView(),
      getPages: AppPages.routes,
    ),
  );
}
