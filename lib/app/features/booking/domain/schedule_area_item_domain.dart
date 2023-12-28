class ScheduleAreaItemDomain {
  String idBooking;
  String flatNumber;
  String ownerName;
  String urlPhotoOwner;
  bool isOnFireOwner;
  String startTime;
  String endTime;
  BoockingState state;

  ScheduleAreaItemDomain({
    required this.idBooking,
    required this.flatNumber,
    required this.ownerName,
    required this.urlPhotoOwner,
    required this.isOnFireOwner,
    required this.startTime,
    required this.endTime,
    required this.state,
  });
}

enum BoockingState { approved, pending, observed }
