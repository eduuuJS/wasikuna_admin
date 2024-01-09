import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/features/home/domain/post_item_domain.dart';
import 'package:wasikuna_admin/app/features/home/presentation/controllers.dart/news_controller.dart';
import 'package:wasikuna_admin/app/features/home/presentation/widgets/card_item_post_file.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/buttons/icon_wrapper.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/separators/main_divider.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';
import 'package:wasikuna_admin/core/utils/query_size.dart';

class NewsViewer extends ConsumerWidget {
  const NewsViewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsList = ref.watch(newsControllerProvider);
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final item = newsList[index];
        return ItemPostNews(item: item);
      }, childCount: newsList.length),
    );
  }
}

class ItemPostNews extends ConsumerWidget {
  const ItemPostNews({super.key, required this.item});
  final PostItemNewsDomain item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    //Elements
    Widget headerNews = Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: colors[ColorsName.borderContainerColor],
              borderRadius: BorderRadius.circular(8.0)),
          child: Column(
            children: [
              Text(
                item.day,
                style: TextStyle(
                    color: colors[ColorsName.secondaryColor],
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                item.month,
                style: TextStyle(
                    color: colors[ColorsName.secondaryColor],
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        const SizedBox(width: 15.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: QuerySize.width(context, 0.7),
              child: Text(
                item.title,
                style: TextStyle(
                    color: colors[ColorsName.mainLetterColor],
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              item.timeAgo,
              style: TextStyle(
                  color: colors[ColorsName.secondaryLetterColor],
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
    Widget contentText = Row(
      children: [
        Expanded(
            child: Text(
          item.contentText,
          style: TextStyle(
              color: colors[ColorsName.mainLetterColor],
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ))
      ],
    );
    Widget footerNews = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Publicado por:",
          style: TextStyle(
              color: colors[ColorsName.secondaryLetterColor],
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
        const MainDivider(space: 5.0),
        Row(
          children: [
            CircleAvatar(
              radius: 22.5,
              backgroundImage: NetworkImage(item.urlPhotoPublisher),
            ),
            const SizedBox(width: 25.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: QuerySize.width(context, 0.5),
                  child: Text(
                    item.publisher,
                    style: TextStyle(
                        color: colors[ColorsName.mainLetterColor],
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  item.rolPublisher,
                  style: TextStyle(
                      color: colors[ColorsName.secondaryLetterColor],
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Spacer(),
            IconWrapper(
                radius: 20.0,
                onTap: () {},
                child: Icon(
                  Icons.share_outlined,
                  color: colors[ColorsName.mainLetterColor],
                  size: 20.0,
                ))
          ],
        )
      ],
    );
    // Widget mediaContent = Column(
    //   children: item.files
    //       .where((element) => element.type == TypeFilePostItemNewsDomain.image)
    //       .map((file) => Row(
    //             children: [
    //               Expanded(
    //                 child: Container(
    //                   margin: const EdgeInsets.symmetric(vertical: 6.0),
    //                   height: 160.0,
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(10.0),
    //                     image: DecorationImage(
    //                       image: NetworkImage(file.url),
    //                       fit: BoxFit.cover,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ))
    //       .toList(),
    // );

    Widget mediaContent = item.files.length % 2 == 0
        ? Column(
            children: List.generate(
              ((item.files.length + 1) / 2).floor(),
              (index) {
                return getRowContent(item.files, item.files[index * 2],
                    item.files[index * 2 + 1]);
              },
            ),
          )
        : Column(
            children: List.generate(
              ((item.files.length + 1) / 2).floor(),
              (index) {
                if (index == 0) {
                  return getUniqueContent(
                    item.files[0],
                    item.files,
                  );
                }
                return getRowContent(item.files, item.files[(index * 2) - 1],
                    item.files[index * 2]);
              },
            ),
          );

    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: colors[ColorsName.borderContainerColor]!,
                  width: 1.0,
                ),
              ),
            ),
            child: Column(
              children: [
                headerNews,
                const MainDivider(space: 10.0),
                contentText,
                const MainDivider(space: 15.0),
                if (item.hasMediaContent) mediaContent,
                if (item.hasMediaContent) const MainDivider(space: 15.0),
                footerNews
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getRowContent(List<FilePostItemNewsDomain> listFiles,
      FilePostItemNewsDomain first, FilePostItemNewsDomain second) {
    return Row(
      children: [
        Expanded(child: CardItemPostFile(item: first, files: listFiles)),
        const SizedBox(width: 2.0),
        Expanded(child: CardItemPostFile(item: second, files: listFiles)),
      ],
    );
  }

  Widget getUniqueContent(
    FilePostItemNewsDomain first,
    List<FilePostItemNewsDomain> listFiles,
  ) {
    return Row(
      children: [
        Expanded(
            child: CardItemPostFile(
          files: listFiles,
          item: first,
          isImportant: true,
        )),
      ],
    );
  }
}
