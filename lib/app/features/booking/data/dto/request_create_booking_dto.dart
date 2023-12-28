class RequestCreateBookingDto {
  int? roomId;
  String? date;
  String? startTime;
  String? endTime;
  String? payment;

  RequestCreateBookingDto({
    this.roomId,
    this.date,
    this.startTime,
    this.endTime,
    this.payment,
  });

  factory RequestCreateBookingDto.fromJson(Map<String, dynamic> json) =>
      RequestCreateBookingDto(
        roomId: json["room_id"],
        date: json["date"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        payment: json["payment"],
      );

  Map<String, dynamic> toJson() => {
        "room_id": roomId,
        "date": date,
        "start_time": startTime,
        "end_time": endTime,
        "payment": payment,
      };
}
