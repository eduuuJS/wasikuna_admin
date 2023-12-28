import 'package:wasikuna_admin/app/features/booking/domain/schedule_area_item_domain.dart';
import 'package:wasikuna_admin/core/utils/constants.dart';
import 'package:wasikuna_admin/core/utils/parser.dart';

class ResponseScheduleAreaDto {
  List<ScheduleAreaDto>? scheduleAreaDto;

  ResponseScheduleAreaDto({
    this.scheduleAreaDto,
  });

  factory ResponseScheduleAreaDto.fromJson(Map<String, dynamic> json) =>
      ResponseScheduleAreaDto(
        scheduleAreaDto: json["scheduleAreaDto"] == null
            ? []
            : List<ScheduleAreaDto>.from(json["scheduleAreaDto"]!
                .map((x) => ScheduleAreaDto.fromJson(x))),
      );

  List<ScheduleAreaItemDomain> toDomain() =>
      scheduleAreaDto!.map((e) => e.toDomain()).toList();
}

class ScheduleAreaDto {
  int? id;
  String? userPhoto;
  String? userName;
  String? userDepartment;
  String? startTime;
  String? endTime;
  String? state;

  ScheduleAreaDto({
    this.id,
    this.userPhoto,
    this.userName,
    this.userDepartment,
    this.startTime,
    this.endTime,
    this.state,
  });

  factory ScheduleAreaDto.fromJson(Map<String, dynamic> json) =>
      ScheduleAreaDto(
        id: json["id"],
        userPhoto: json["user_photo"],
        userName: json["user_name"],
        userDepartment: json["user_department"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        state: json["state"],
      );

  ScheduleAreaItemDomain toDomain() => ScheduleAreaItemDomain(
        idBooking: "$id",
        flatNumber: userDepartment ?? "",
        ownerName: userName ?? "",
        urlPhotoOwner: (userPhoto ?? "").replaceAll(localhost, myIP),
        isOnFireOwner: false,
        startTime: Parser.timeToStringFormat12(startTime ?? ""),
        endTime: Parser.timeToStringFormat12(endTime ?? ""),
        state: getBoockingState(),
      );

  BoockingState getBoockingState() {
    switch (state) {
      case "Aprobado":
        return BoockingState.approved;
      case "Pendiente":
        return BoockingState.pending;
      case "Observado":
        return BoockingState.observed;
      default:
        return BoockingState.pending;
    }
  }
}
