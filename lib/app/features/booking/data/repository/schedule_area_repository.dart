import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wasikuna_admin/app/features/booking/data/dto/response_schedule_area_dto.dart';
import 'package:wasikuna_admin/app/features/booking/domain/schedule_area_item_domain.dart';
import 'package:wasikuna_admin/core/network/dio_client.dart';
import 'package:wasikuna_admin/core/utils/dependency_injection.dart';
import 'package:wasikuna_admin/core/utils/parser.dart';

part 'schedule_area_repository.g.dart';

abstract class IScheduleAreaRepository {
  Future<List<ScheduleAreaItemDomain>> getScheduleAreaById(
      String id, DateTime date);
}

class ScheduleAreaRepository implements IScheduleAreaRepository {
  final _dioClient = sl<DioClient>();

  @override
  Future<List<ScheduleAreaItemDomain>> getScheduleAreaById(
      String id, DateTime date) async {
    final response = await _dioClient.get(
      path: "/api/room/$id/reservations/${Parser.dateToDDMMYYYYEncoded(date)}",
    );
    return ResponseScheduleAreaDto.fromJson({"scheduleAreaDto": response.data})
        .toDomain();
  }
}

@riverpod
IScheduleAreaRepository scheduleAreaRepository(ScheduleAreaRepositoryRef ref) {
  return ScheduleAreaRepository();
}
