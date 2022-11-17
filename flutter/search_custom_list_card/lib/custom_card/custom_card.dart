import 'package:flutter/material.dart';
import 'package:search_custom_list_card/card_data.dart';
import 'package:search_custom_list_card/custom_card/item_content.dart';
import 'package:search_custom_list_card/custom_card/item_thumbnail.dart';

class CustomCard extends StatelessWidget {
  final CardData data;

  const CustomCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: SizedBox(
        height: 110,
        child: Row(
          children: [
            const ItemThumbnail(),
            ItemContent(data: data),
          ],
        ),
      ),
    );
  }
}
