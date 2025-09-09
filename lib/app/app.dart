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

// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true,),
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
