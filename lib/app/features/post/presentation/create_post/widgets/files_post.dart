import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/features/post/presentation/create_post/create_post_controller.dart';
import 'package:wasikuna_admin/app/features/post/presentation/create_post/widgets/file_card_create_post.dart';

class FilesPost extends ConsumerWidget {
  const FilesPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fileList = ref.watch(fileListCreatePostProvider);
    return SliverGrid.builder(
        addRepaintBoundaries: false,
        itemCount: fileList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.3,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0),
        itemBuilder: (context, index) {
          final item = fileList[index];
          return FileCardCreatePost(item: item, isPar: (index + 1) % 2 == 0);
        });
  }
}
