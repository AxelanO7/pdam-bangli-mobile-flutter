import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/pages/home/home_view.dart';
import 'package:pdam_bangli/src/pages/login/login_view.dart';
import 'package:pdam_bangli/src/pages/menu/account/account_view.dart';
import 'package:pdam_bangli/src/pages/menu/assignment/assignment_view.dart';
import 'package:pdam_bangli/src/pages/menu/bill/bill_view.dart';
import 'package:pdam_bangli/src/pages/menu/complaint/complaint_view.dart';
import 'package:pdam_bangli/src/pages/menu/survey/survey_view.dart';
import 'package:pdam_bangli/src/pages/onboarding/onboarding_view.dart';
import 'package:pdam_bangli/src/pages/startup/startup_view.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.initialRoute,
      page: () => const StartupView(),
    ),
    GetPage(
      name: AppRoutes.onBoardingPage,
      page: () => const OnboardingView(),
    ),
    GetPage(
      name: AppRoutes.loginPage,
      page: () => const LoginView(),
    ),
    GetPage(
      name: AppRoutes.homePage,
      page: () => const HomeView(),
    ),
    GetPage(
      name: AppRoutes.accountPage,
      page: () => const AccountView(),
    ),
    GetPage(
      name: AppRoutes.billPage,
      page: () => const BillView(),
    ),
    GetPage(
      name: AppRoutes.complaintPage,
      page: () => const ComplaintView(),
    ),
    GetPage(
      name: AppRoutes.surveyPage,
      page: () => const SurveyView(),
    ),
    GetPage(
      name: AppRoutes.assignmentPage,
      page: () => const AssignmentView(),
    )
  ];
}
