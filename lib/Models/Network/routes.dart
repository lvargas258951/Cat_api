import '../../Pages/details.dart';
import '../../Pages/homepage.dart';
import '../../Pages/splash.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart' as route;

final routes = [
  GetPage(
    name: '/',
    page: () => const SplashPage(),
    transition: Transition.circularReveal,
  ),
  GetPage(
    name: '/home',
    page: () => const HomePage(),
    transition: route.Transition.fadeIn,
    transitionDuration: const Duration(
      milliseconds: 1000,
    ),
  ),
  GetPage(
    name: '/detail_cat',
    page: () => const DetailPage(),
    transition: route.Transition.fadeIn,
    transitionDuration: const Duration(
      milliseconds: 1000,
    ),
  ),
];
