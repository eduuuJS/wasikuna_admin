class BookingDetailDomain {
  String idBooking;
  String nameArea;
  String hrefArea;
  String openTime;
  String closeTime;
  String qualificationArea;
  String capacityArea;
  String dateBooking;
  String coastArea;
  String warranty;
  List<String> imagesPaymentBooking;

  BookingDetailDomain({
    required this.idBooking,
    required this.nameArea,
    required this.hrefArea,
    required this.openTime,
    required this.closeTime,
    required this.qualificationArea,
    required this.capacityArea,
    required this.dateBooking,
    required this.coastArea,
    required this.warranty,
    required this.imagesPaymentBooking,
  });
}
