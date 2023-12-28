import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/common_areas/common_areas_controller.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/common_areas/widgets/btn_help_whatsapp.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/common_areas/widgets/common_areas_appbar.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/common_areas/widgets/common_areas_viewer_vertical.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/dialogs/loading_widget.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/pages/custom_scaffold_main.dart';
import 'package:wasikuna_admin/core/routes/app_router.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';
import 'package:wasikuna_admin/core/utils/query_size.dart';

class CommonAreasView extends ConsumerWidget {
  const CommonAreasView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(commonAreasLoaderProvider);
    final colors = ref.watch(colorsStateProvider);

    final dataSliver = CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: CommonAreasAppBarDelegate(),
          pinned: true,
        ),
        // const SliverToBoxAdapter(child: CommonAreasViewerHorizontal()),
        const CommonAreasViewerVertical()
      ],
    );

    return CustomScaffoldMain(
      routeName: AppRoutesNamed.commonAreasRoute,
      child: Scaffold(
        backgroundColor: colors[ColorsName.backgroundColor],
        body: SafeArea(
          child: SizedBox(
            height: QuerySize.height(context, 1),
            child: isLoading.when(
                data: (_) {
                  return dataSliver;
                },
                error: (_, __) => null,
                loading: () {
                  return const Column(
                    children: [
                      CommonAreasAppbar(),
                      Spacer(),
                      LoadingWidget(),
                      Spacer(),
                    ],
                  );
                }),
          ),
        ),
        bottomNavigationBar: const BtnHelpWhatsapp(),
      ),
    );
  }
}
