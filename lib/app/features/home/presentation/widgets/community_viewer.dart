import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunityViewer extends ConsumerWidget {
  const CommunityViewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Image(
        image: AssetImage(
          "assets/img/coming_soon.png",
        ),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
