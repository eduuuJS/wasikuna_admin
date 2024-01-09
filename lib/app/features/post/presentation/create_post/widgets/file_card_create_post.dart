import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/features/post/domain/attachment_file_post.dart';
import 'package:wasikuna_admin/app/features/post/presentation/create_post/create_post_controller.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/buttons/icon_wrapper.dart';

class FileCardCreatePost extends ConsumerWidget {
  const FileCardCreatePost({Key? key, required this.item, required this.isPar})
      : super(key: key);
  final AttachmentFilePost item;
  final bool isPar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
              left: !isPar ? 15.0 : 0.0, right: isPar ? 15.0 : 0.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(image: getImage(item), fit: BoxFit.cover)),
        ),
        Container(
          margin: EdgeInsets.only(
              left: !isPar ? 15.0 : 0.0, right: isPar ? 15.0 : 0.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black87])),
        ),
        Positioned(
            bottom: 8.0,
            left: !isPar ? 23.0 : 8.0,
            right: isPar ? 15.0 : 0.0,
            child: Text(item.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold))),
        Positioned(
            top: 5.0,
            right: isPar ? 20.0 : 5.0,
            child: IconWrapper(
                onTap: () {
                  ref
                      .read(fileListCreatePostProvider.notifier)
                      .removeFile(item.id);
                },
                child: const CircleAvatar(
                  radius: 13.0,
                  backgroundColor: Colors.black45,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 16.0,
                  ),
                )))
      ],
    );
  }

  ImageProvider<Object> getImage(AttachmentFilePost item) {
    switch (item.type) {
      case AttachmentType.image:
        return FileImage(item.file);
      case AttachmentType.video:
        return const AssetImage('assets/img/file_video.png');
      case AttachmentType.audio:
        return const AssetImage('assets/img/file_audio.png');
      case AttachmentType.document:
        return const AssetImage('assets/img/file_pdf.png');
      default:
        return const AssetImage('assets/img/file_other.png');
    }
  }
}
