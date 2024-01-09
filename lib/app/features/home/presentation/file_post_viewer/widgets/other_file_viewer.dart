import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/buttons/primary_button.dart';
import 'package:wasikuna_admin/core/utils/downloader.dart';
import 'package:wasikuna_admin/core/utils/query_size.dart';

class OtherFileViewer extends ConsumerWidget {
  const OtherFileViewer({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Archivo desconocido",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 25.0),
          Center(
            child: SizedBox(
              width: QuerySize.width(context, 0.8),
              height: 60.0,
              child: PrimaryButton(
                  label: "Descargar",
                  onTap: () {
                    Downloader.downloadAndShare(url, ref);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
