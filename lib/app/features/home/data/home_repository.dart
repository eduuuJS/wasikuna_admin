import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wasikuna_admin/app/features/home/data/dto/response_post_dto.dart';
import 'package:wasikuna_admin/app/features/home/domain/neighborg_item_domain.dart';
import 'package:wasikuna_admin/app/features/home/domain/post_item_domain.dart';
import 'package:wasikuna_admin/core/network/dio_client.dart';
import 'package:wasikuna_admin/core/utils/dependency_injection.dart';
import 'package:wasikuna_admin/core/utils/mock_data.dart';

part 'home_repository.g.dart';

abstract class IHomeRepository {
  Future<List<NeighborgItemDomain>> getChartNeighborgs();
  Future<List<PostItemNewsDomain>> getPostList();
}

class HomeRepository implements IHomeRepository {
  final _dioClient = sl<DioClient>();

  @override
  Future<List<NeighborgItemDomain>> getChartNeighborgs() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return fakeListNeighborgs;
  }

  @override
  Future<List<PostItemNewsDomain>> getPostList() async {
    final response = await _dioClient.get(
      path: "/api/publication?pageIndex=1&pageSize=10",
    );
    return ResponsePostDto.fromJson(response.data).toDomain();
  }
}

@riverpod
IHomeRepository homeRepository(HomeRepositoryRef ref) {
  return HomeRepository();
}
