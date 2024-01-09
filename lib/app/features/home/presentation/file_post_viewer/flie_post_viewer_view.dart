import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wasikuna_admin/app/features/home/domain/post_item_domain.dart';
import 'package:wasikuna_admin/app/features/home/presentation/file_post_viewer/file_post_viewer_controller.dart';
import 'package:wasikuna_admin/app/features/home/presentation/file_post_viewer/widgets/file_distributor_viewer.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/buttons/icon_wrapper.dart';
import 'package:wasikuna_admin/core/utils/downloader.dart';

class FliePostViewerView extends ConsumerWidget {
  const FliePostViewerView(
      {Key? key, required this.files, required this.currentIndex})
      : super(key: key);
  final List<FilePostItemNewsDomain> files;
  final int currentIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(filePostViewerLoaderProvider(currentIndex, files.length));

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: getBtnAction(Icons.close, () {
            Navigator.pop(context);
          }),
          actions: [
            getBtnAction(Icons.download, () {
              final index = ref.watch(currentFileIndexPostProvider);
              final fileToDownload = files[index];
              Downloader.downloadAndShare(fileToDownload.url, ref);
            }),
          ],
        ),
        body: Center(child: InteractiveViewer(
          child: Consumer(builder: (context, refIntern, _) {
            final index = refIntern.watch(currentFileIndexPostProvider);
            return FileDistributorViewer(item: files[index]);
          }),
        )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getBtnAction(Iconsax.arrow_left_2, () {
                ref.read(currentFileIndexPostProvider.notifier).prev();
              }),
              const SizedBox(width: 15.0),
              getBtnAction(Iconsax.arrow_right_3, () {
                ref.read(currentFileIndexPostProvider.notifier).next();
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBtnAction(IconData icon, void Function()? onTap) {
    return IconWrapper(
      radius: 25.0,
      onTap: onTap,
      child: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.white10,
        child: Icon(
          icon,
          color: Colors.white,
          size: 16.0,
        ),
      ),
    );
  }
}
