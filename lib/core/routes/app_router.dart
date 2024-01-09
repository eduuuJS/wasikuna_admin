import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wasikuna_admin/app/features/authentication/presentation/auth_view.dart';
import 'package:wasikuna_admin/app/features/booking/domain/schedule_area_item_domain.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/common_areas/common_areas_view.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/multi_img_viewer/multi_img_viewer.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/new_booking/new_booking_view.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/review_booking/review_booking_view.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/schedule_area/schedule_area_view.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/success_booking/succes_booking.dart';
import 'package:wasikuna_admin/app/features/home/domain/post_item_domain.dart';
import 'package:wasikuna_admin/app/features/home/presentation/file_post_viewer/flie_post_viewer_view.dart';
import 'package:wasikuna_admin/app/features/home/presentation/home_view.dart';
import 'package:wasikuna_admin/app/features/post/presentation/create_post/create_post_view.dart';
import 'package:wasikuna_admin/app/features/splash/presentation/splash_view.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(debugLogDiagnostics: true, routes: [
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
      builder: (context, state) {
        final value = state.extra as bool;
        return SuccesBooking(isApprobed: value);
      },
    ),
    GoRoute(
      path: AppRoutesNamed.reviewBooking,
      builder: (context, state) {
        final item = state.extra as ScheduleAreaItemDomain;
        return ReviewBookingView(item: item);
      },
    ),
    GoRoute(
      path: AppRoutesNamed.createPost,
      builder: (context, state) {
        final initTypeFile = state.extra as int;
        return CreatePostView(initFileType: initTypeFile);
      },
    ),
    GoRoute(
      path: AppRoutesNamed.multiImgViewer,
      builder: (context, state) {
        final map = state.extra as Map;
        final item = map["item"] as ScheduleAreaItemDomain;
        final imgs = map["imgs"] as List<String>;
        final index = map["index"] as int;
        return MultiImgViewer(item: item, imgs: imgs, index: index);
      },
    ),
    GoRoute(
      path: AppRoutesNamed.multiFileViewer,
      builder: (context, state) {
        final map = state.extra as Map;
        final files = map["files"] as List<FilePostItemNewsDomain>;
        final index = map["index"] as int;
        return FliePostViewerView(currentIndex: index, files: files);
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
  static const createPost = "/createPost";
  static const multiImgViewer = "/multiImgViewer";
  static const multiFileViewer = "/multiFileViewer";
}
