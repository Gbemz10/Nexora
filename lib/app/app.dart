import 'package:nexora/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:nexora/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:nexora/ui/views/home/home_view.dart';
import 'package:nexora/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:nexora/ui/views/counter/counter_view.dart';
import 'package:nexora/services/network_service.dart';
import 'package:nexora/ui/views/sign_up/sign_up_view.dart';
import 'package:nexora/ui/views/login/login_view.dart';
import 'package:nexora/services/authentication_service_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: CounterView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: LoginView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: NetworkService),
    LazySingleton(classType: AuthenticationServiceService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
