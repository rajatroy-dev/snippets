import 'package:custom_list_card/custom_card/item_tag.dart';
import 'package:flutter/material.dart';

class ItemTagsList extends StatelessWidget {
  const ItemTagsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Row(
        children: const [
          ItemTag(title: "#abcdef"),
          ItemTag(title: "#ghijk"),
        ],
      ),
    );
  }
}
