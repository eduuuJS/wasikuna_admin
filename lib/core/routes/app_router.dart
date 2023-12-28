import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wasikuna_admin/app/features/authentication/presentation/auth_view.dart';
import 'package:wasikuna_admin/app/features/booking/domain/schedule_area_item_domain.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/common_areas/common_areas_view.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/new_booking/new_booking_view.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/review_booking/review_booking_view.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/schedule_area/schedule_area_view.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/success_booking/succes_booking.dart';
import 'package:wasikuna_admin/app/features/home/presentation/home_view.dart';
import 'package:wasikuna_admin/app/features/splash/presentation/splash_view.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: AppRoutesNamed.splashRoute,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: AppRoutesNamed.authRoute,
      builder: (context, state) => const AuthView(),
    ),
    GoRoute(
      path: AppRoutesNamed.homeRoute,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: AppRoutesNamed.commonAreasRoute,
      builder: (context, state) => const CommonAreasView(),
    ),
    GoRoute(
      path: AppRoutesNamed.scheduleAreaRoute,
      builder: (context, state) {
        final params = state.extra as Map;
        return ScheduleArea(
            idArea: params["idArea"],
            nameArea: params["nameArea"],
            coastArea: params["coastArea"]);
      },
    ),
    GoRoute(
      path: AppRoutesNamed.newBookingRoute,
      builder: (context, state) {
        final params = state.extra as Map;
        return NewBookingView(
          idArea: params["idArea"],
          dateBooking: params["dateBooking"],
        );
      },
    ),
    GoRoute(
      path: AppRoutesNamed.successBooking,
      builder: (context, state) => const SuccesBooking(),
    ),
    GoRoute(
      path: AppRoutesNamed.reviewBooking,
      builder: (context, state) {
        final item = state.extra as ScheduleAreaItemDomain;
        return ReviewBookingView(item: item);
      },
    ),
  ]);
}

class AppRoutesNamed {
  static const splashRoute = "/splash";
  static const authRoute = "/auth";
  static const homeRoute = "/home";
  static const commonAreasRoute = "/commonAreas";
  static const scheduleAreaRoute = "/scheduleArea";
  static const newBookingRoute = "/newBookingRoute";
  static const successBooking = "/successBooking";
  static const reviewBooking = "/reviewBooking";
}
