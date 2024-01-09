import 'package:flutter/material.dart';

import 'package:wasikuna_admin/app/features/home/domain/post_item_domain.dart';
import 'package:wasikuna_admin/app/features/home/presentation/file_post_viewer/widgets/audio_player_viewer.dart';
import 'package:wasikuna_admin/app/features/home/presentation/file_post_viewer/widgets/other_file_viewer.dart';
import 'package:wasikuna_admin/app/features/home/presentation/file_post_viewer/widgets/pdf_viewer.dart';
import 'package:wasikuna_admin/app/features/home/presentation/file_post_viewer/widgets/video_viewer.dart';

class FileDistributorViewer extends StatelessWidget {
  const FileDistributorViewer({Key? key, required this.item}) : super(key: key);
  final FilePostItemNewsDomain item;

  @override
  Widget build(BuildContext context) {
    return getContentMedia();
  }

  Widget getContentMedia() {
    switch (item.type) {
      case TypeFilePostItemNewsDomain.image:
        return Image.network(
          item.url,
          fit: BoxFit.cover,
        );
      case TypeFilePostItemNewsDomain.pdf:
        return PDFScreen(path: item.url);
      case TypeFilePostItemNewsDomain.video:
        return VideoPlayerPage(videoURL: item.url);
      case TypeFilePostItemNewsDomain.audio:
        return AudioPlayerPage(audioURL: item.url);
      default:
        return OtherFileViewer(url: item.url);
    }
  }
}
