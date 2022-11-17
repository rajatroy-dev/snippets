import 'package:flutter/material.dart';
import 'package:search_custom_list_card/custom_card/item_tag.dart';

class ItemTagsList extends StatelessWidget {
  final List<String> tags;

  const ItemTagsList({
    Key? key,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Row(
        children: [
          ItemTag(title: "# ${tags[0]}"),
          ItemTag(title: "# ${tags[1]}"),
        ],
      ),
    );
  }
}
