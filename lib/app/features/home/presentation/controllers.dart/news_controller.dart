import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wasikuna_admin/app/features/home/data/home_repository.dart';
import 'package:wasikuna_admin/app/features/home/domain/post_item_domain.dart';

part 'news_controller.g.dart';

@riverpod
class NewsController extends _$NewsController {
  @override
  List<PostItemNewsDomain> build() {
    return [];
  }

  void setList(List<PostItemNewsDomain> list) {
    state = list;
  }

  Future<void> getList() async {
    final repository = ref.watch(homeRepositoryProvider);
    try {
      final response = await repository.getPostList();
      state = response;
    } catch (e) {
      print(e);
    }
  }
}
