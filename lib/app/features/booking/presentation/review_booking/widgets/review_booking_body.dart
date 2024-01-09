import 'package:flutter/material.dart';
import 'package:wasikuna_admin/app/features/booking/domain/booking_detail_domain.dart';
import 'package:wasikuna_admin/app/features/booking/domain/schedule_area_item_domain.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/review_booking/widgets/info_area_review.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/review_booking/widgets/payment_booking_imgs.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/review_booking/widgets/review_booking_resume.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/separators/main_divider.dart';

class ReviewBoockingBody extends StatelessWidget {
  const ReviewBoockingBody({Key? key, required this.detail, required this.item})
      : super(key: key);
  final BookingDetailDomain detail;
  final ScheduleAreaItemDomain item;

  @override
  Widget build(BuildContext context) {
    // List<String> myImgsDemo = [
    //   "https://greenti.pe/api/attachments/room/image/22757faf-b242-491a-bc1c-dc3d69d272c9",
    //   "https://greenti.pe/api/attachments/room/image/cd34669f-8f85-4ebf-bb48-67fac6e7c63d",
    //   "https://greenti.pe/api/attachments/room/image/d1684d7f-bba3-48a6-9503-2001698de85b",
    //   "https://greenti.pe/api/attachments/room/image/e8a02248-08ec-477d-8a18-2420ac4e406b",
    //   "https://greenti.pe/api/attachments/reservation/payment/0b68fa19-9aea-452c-a88a-1336cae5895f"
    // ];
    return Expanded(
        child: Container(
      padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
      child: ListView(
        children: [
          InfoAreaReview(areaDetail: detail),
          const MainDivider(space: 25.0),
          PaymentBookingImgs(imgs: detail.imagesPaymentBooking, item: item),
          // PaymentBookingImgs(imgs: myImgsDemo, item: item),
          const MainDivider(space: 25.0),
          ReviewBookingResume(data: detail)
        ],
      ),
    ));
  }
}
