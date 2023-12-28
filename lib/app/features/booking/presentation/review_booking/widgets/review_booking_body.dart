import 'package:flutter/material.dart';
import 'package:wasikuna_admin/app/features/booking/domain/booking_detail_domain.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/review_booking/widgets/info_area_review.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/review_booking/widgets/payment_booking_imgs.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/review_booking/widgets/review_booking_resume.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/separators/main_divider.dart';

class ReviewBoockingBody extends StatelessWidget {
  const ReviewBoockingBody({Key? key, required this.detail}) : super(key: key);
  final BookingDetailDomain detail;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
      child: ListView(
        children: [
          InfoAreaReview(areaDetail: detail),
          const MainDivider(space: 25.0),
          PaymentBookingImgs(imgs: detail.imagesPaymentBooking),
          const MainDivider(space: 25.0),
          ReviewBookingResume(data: detail)
        ],
      ),
    ));
  }
}
