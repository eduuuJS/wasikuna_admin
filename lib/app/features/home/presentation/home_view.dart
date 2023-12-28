import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/features/home/presentation/home_controller.dart';
import 'package:wasikuna_admin/app/features/home/presentation/widgets/area_selector.dart';
import 'package:wasikuna_admin/app/features/home/presentation/widgets/chart_neighborgs.dart';
import 'package:wasikuna_admin/app/features/home/presentation/widgets/home_appbar.dart';
import 'package:wasikuna_admin/app/features/home/presentation/widgets/home_content.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/dialogs/loading_widget.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/pages/custom_scaffold_main.dart';
import 'package:wasikuna_admin/core/routes/app_router.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';
import 'package:wasikuna_admin/core/utils/query_size.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Providers
    final isLoading = ref.watch(homeLoaderProvider);
    final colors = ref.watch(colorsStateProvider);

    //Elements
    Widget data = RefreshIndicator(
      backgroundColor: colors[ColorsName.primaryColor],
      color: colors[ColorsName.whiteColor],
      onRefresh: () async {
        await ref.read(homeRefreshProvider.notifier).refresh();
      },
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: HomeAppBarDelegate(),
            pinned: true,
          ),
          const SliverToBoxAdapter(child: ChartNeighBorgs()),
          const SliverToBoxAdapter(child: AreaSelector()),
          const HomeContent()
        ],
      ),
    );
    Widget loading = const Column(
      children: [
        HomeAppbar(),
        Spacer(),
        LoadingWidget(),
        Spacer(),
      ],
    );

    return CustomScaffoldMain(
      routeName: AppRoutesNamed.homeRoute,
      child: Scaffold(
        backgroundColor: colors[ColorsName.backgroundColor],
        body: SafeArea(
          child: SizedBox(
            height: QuerySize.height(context, 1),
            child: isLoading.when(
                data: (_) => data,
                error: (_, __) => null,
                loading: () => loading),
          ),
        ),
      ),
    );
  }
}
