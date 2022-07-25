import 'package:get/get.dart';

import '../../pages/notfound/index.dart';

abstract class AppRoutes {
  static const Home = '/home';
  static const List = '/list';
  static const Detail = '/detail';
  static const CameraApp = '/camera';
  static const Detail_ID = '/detail/:id';

  static const NotFound = '/notfound';

  static const Login = '/login';
  static const My = '/my';
}