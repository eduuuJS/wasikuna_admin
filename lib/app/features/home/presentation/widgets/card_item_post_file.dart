import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wasikuna_admin/app/features/home/domain/post_item_domain.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/buttons/icon_wrapper.dart';
import 'package:wasikuna_admin/core/routes/app_router.dart';
import 'package:wasikuna_admin/core/utils/downloader.dart';

class CardItemPostFile extends ConsumerWidget {
  const CardItemPostFile({
    Key? key,
    required this.item,
    this.isImportant = false,
    required this.files,
  }) : super(key: key);
  final FilePostItemNewsDomain item;
  final bool isImportant;
  final List<FilePostItemNewsDomain> files;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          height: isImportant ? 150.0 : 120.0,
          margin: const EdgeInsets.only(bottom: 2.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.0),
              image: DecorationImage(image: getImage(item), fit: BoxFit.cover)),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                final index =
                    files.indexWhere((element) => element.id == item.id);
                context.push(AppRoutesNamed.multiFileViewer, extra: {
                  "files": files,
                  "index": index,
                });
              },
            ),
          ),
        ),
        if (item.type != TypeFilePostItemNewsDomain.image)
          Positioned(
              top: 5.0,
              right: 5.0,
              child: IconWrapper(
                  onTap: () {
                    Downloader.downloadAndShare(item.url, ref);
                  },
                  child: const CircleAvatar(
                    radius: 13.0,
                    backgroundColor: Colors.black45,
                    child: Icon(
                      Icons.download,
                      color: Colors.white,
                      size: 16.0,
                    ),
                  )))
      ],
    );
  }

  ImageProvider<Object> getImage(FilePostItemNewsDomain item) {
    switch (item.type) {
      case TypeFilePostItemNewsDomain.image:
        return NetworkImage(item.url);
      case TypeFilePostItemNewsDomain.video:
        return const AssetImage('assets/img/file_video.png');
      case TypeFilePostItemNewsDomain.audio:
        return const AssetImage('assets/img/file_audio.png');
      case TypeFilePostItemNewsDomain.pdf:
        return const AssetImage('assets/img/file_pdf.png');
      default:
        return const AssetImage('assets/img/file_other.png');
    }
  }
}
