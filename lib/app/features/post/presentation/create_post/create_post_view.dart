import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/features/post/presentation/create_post/create_post_controller.dart';
import 'package:wasikuna_admin/app/features/post/presentation/create_post/widgets/author_post.dart';
import 'package:wasikuna_admin/app/features/post/presentation/create_post/widgets/content_post.dart';
import 'package:wasikuna_admin/app/features/post/presentation/create_post/widgets/create_post_appbar.dart';
import 'package:wasikuna_admin/app/features/post/presentation/create_post/widgets/create_post_bottom_bar.dart';
import 'package:wasikuna_admin/app/features/post/presentation/create_post/widgets/files_post.dart';
import 'package:wasikuna_admin/app/features/post/presentation/create_post/widgets/title_post.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';
import 'package:wasikuna_admin/core/utils/query_size.dart';

class CreatePostView extends ConsumerWidget {
  const CreatePostView({Key? key, required this.initFileType})
      : super(key: key);
  final int initFileType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);

    final dataSliver = CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: CreatePostAppBarDelegate(),
        ),
        const SliverToBoxAdapter(child: AuthorPost()),
        const SliverToBoxAdapter(child: TitlePost()),
        const SliverToBoxAdapter(child: ContentPost()),
        const FilesPost()
      ],
    );

    return Scaffold(
      backgroundColor: colors[ColorsName.backgroundColor],
      body: SafeArea(
        child: SizedBox(
            height: QuerySize.height(context, 1),
            child: Form(
                key: ref.watch(createPostControllerProvider.notifier).formKey,
                child: dataSliver)),
      ),
      bottomNavigationBar: CreatePostBottomBar(initFileType: initFileType),
    );
  }
}
