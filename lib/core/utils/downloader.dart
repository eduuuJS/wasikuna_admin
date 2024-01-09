import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/dialogs/spinner.dart';
import 'package:wasikuna_admin/core/utils/dependency_injection.dart';

abstract class Downloader {
  static Future<bool> downloadAndShare(String url, WidgetRef ref) async {
    try {
      ref.watch(spinnerStateProvider.notifier).show();
      final dio = sl<Dio>();
      final Directory directory = await getApplicationDocumentsDirectory();
      final String path = '${directory.path}/${url.split('/').last}';
      await dio.download(url, path);
      ref.watch(spinnerStateProvider.notifier).hide();
      await Share.shareXFiles([XFile(path)]);
      return true;
    } catch (e) {
      ref.watch(spinnerStateProvider.notifier).hide();
      return false;
    }
  }
}
