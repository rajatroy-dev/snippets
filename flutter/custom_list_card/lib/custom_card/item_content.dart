import 'package:custom_list_card/custom_card/item_location.dart';
import 'package:custom_list_card/custom_card/item_name.dart';
import 'package:custom_list_card/custom_card/item_quantity.dart';
import 'package:custom_list_card/custom_card/item_tags_list.dart';
import 'package:flutter/material.dart';

class ItemContent extends StatelessWidget {
  const ItemContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ItemName(),
        ItemLocation(),
        ItemQuantity(),
        ItemTagsList(),
      ],
    );
  }
}
