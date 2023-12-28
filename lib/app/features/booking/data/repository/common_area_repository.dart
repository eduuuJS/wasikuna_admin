import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wasikuna_admin/app/features/booking/data/dto/response_room_inbox_dto.dart';
import 'package:wasikuna_admin/app/features/booking/domain/common_area_domain.dart';
import 'package:wasikuna_admin/core/network/dio_client.dart';
import 'package:wasikuna_admin/core/utils/dependency_injection.dart';
part 'common_area_repository.g.dart';

abstract class CommonAreaRepository {
  Future<List<CommonAreaDomain>> getCommonAreas();
}

class CommonAreaRepositoryBackend implements CommonAreaRepository {
  final _dioClient = sl<DioClient>();

  @override
  Future<List<CommonAreaDomain>> getCommonAreas() async {
    final response = await _dioClient.get(
      path: "/api/room/list-data",
    );
    return ResponseRoomInboxDto.fromJson({"roomInbox": response.data})
        .toDomain();
  }
}

@riverpod
CommonAreaRepository commonAreaRepository(CommonAreaRepositoryRef ref) {
  return CommonAreaRepositoryBackend();
}
