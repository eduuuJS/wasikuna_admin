import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/features/home/domain/selector_item_domain.dart';
import 'package:wasikuna_admin/app/features/home/presentation/controllers.dart/selector_controller.dart';
import 'package:wasikuna_admin/app/features/home/presentation/home_controller.dart';
import 'package:wasikuna_admin/app/features/home/presentation/widgets/community_viewer.dart';
import 'package:wasikuna_admin/app/features/home/presentation/widgets/documents_viewer.dart';
import 'package:wasikuna_admin/app/features/home/presentation/widgets/news_viewer.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/dialogs/loading_widget.dart';

class HomeContent extends ConsumerWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typeContent = ref.watch(areaTypeControllerProvider);
    final isRefreshing = ref.watch(homeRefreshProvider);
    return isRefreshing
        ? const SliverToBoxAdapter(
            child: Center(
              child: LoadingWidget(),
            ),
          )
        : getWidgetContent(typeContent);
  }

  Widget getWidgetContent(AreaTypeSelector type) {
    switch (type) {
      case AreaTypeSelector.news:
        return const NewsViewer();
      case AreaTypeSelector.community:
        return const SliverToBoxAdapter(child: CommunityViewer());
      case AreaTypeSelector.documents:
        return const SliverToBoxAdapter(child: DocumentsViewer());
      default:
        return const NewsViewer();
    }
  }
}
