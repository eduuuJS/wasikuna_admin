// ignore_for_file: empty_catches

import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wasikuna_admin/app/features/booking/data/repository/booking_repository.dart';
import 'package:wasikuna_admin/app/features/booking/domain/booking_detail_domain.dart';
import 'package:wasikuna_admin/app/shared/domain/response_mutation_domain.dart';

part 'review_booking_controller.g.dart';

@riverpod
Future<BookingDetailDomain> reviewBookingLoader(
    ReviewBookingLoaderRef ref, String idBooking) async {
  await Future.delayed(Duration.zero);
  final repo = ref.watch(bookingRepositoryProvider);
  return await repo.getBookingDetail(idBooking);
}

@riverpod
class ReviewBookingController extends _$ReviewBookingController {
  @override
  void build() {
    return;
  }

  //TextEditingController
  TextEditingController ctrlComent = TextEditingController();

  Future<ResponseMutationDomain> reviewBooking(
      bool isApproved, String idBooking) async {
    final repo = ref.watch(bookingRepositoryProvider);
    return await repo.reviewBooking(idBooking, ctrlComent.text, isApproved);
  }
}
