import 'package:get/get.dart';
import 'package:getx_study/pages/obx/obx.dart';
import 'package:getx_study/pages/state_workers/index.dart';
import '../../pages/camera/index.dart';
import '../../pages/getx/index.dart';
import '../../pages/home/index.dart';
import '../../pages/list/index.dart';
import '../../pages/list_detail/index.dart';
import '../../pages/login/index.dart';
import '../../pages/my/index.dart';
import '../../pages/notfound/index.dart';
import '../middleware/router_auth.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Home;

  static final routes = [
    // 白名单
    GetPage(
      name: AppRoutes.Login,
      page: () => LoginView(),
    ),
    GetPage(
      name: AppRoutes.CameraApp,
      page: () => CameraApp(),
    ),

    // 我的，需要认证
    GetPage(
      name: AppRoutes.My,
      page: () => MyView(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),

    GetPage(
      name: AppRoutes.Home,
      page: () => HomeView(),
      children: [
        GetPage(
          name: AppRoutes.Obs,
          page: () => StateObxView(),
        ),
        GetPage(
          name: AppRoutes.Getx,
          page: () => StateGetxView(),
        ),
        GetPage(
          name: AppRoutes.Workers,
          page: () => StateWorkersView(),
        ),
        GetPage(
          name: AppRoutes.List,
          page: () => ListView(),
          children: [
            GetPage(
              name: AppRoutes.Detail,
              page: () => DetailView(),
            ),
            GetPage(
              name: AppRoutes.Detail_ID,
              page: () => DetailView(),
              transition: Transition.fadeIn, // 過渡動畫
            ),
          ],
        ),
      ],
    ),
  ];


  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => NotfoundView(),
  );
}
