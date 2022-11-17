import 'package:flutter/material.dart';
import 'package:search_custom_list_card/card_data.dart';
import 'package:search_custom_list_card/custom_card/item_location.dart';
import 'package:search_custom_list_card/custom_card/item_name.dart';
import 'package:search_custom_list_card/custom_card/item_quantity.dart';
import 'package:search_custom_list_card/custom_card/item_tags_list.dart';

class ItemContent extends StatelessWidget {
  final CardData data;

  const ItemContent({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemName(name: data.title),
        ItemLocation(location: data.location),
        ItemQuantity(qty: data.qty.toString()),
        ItemTagsList(tags: data.tags),
      ],
    );
  }
}
