import 'package:flutter/material.dart';
import 'package:horizontal_list_of_card/custom_card/card_image.dart';
import 'package:horizontal_list_of_card/custom_card/card_item_quantity.dart';
import 'package:horizontal_list_of_card/custom_card/card_location.dart';
import 'package:horizontal_list_of_card/custom_card/card_tag_list.dart';
import 'package:horizontal_list_of_card/custom_card/card_title.dart';
import 'package:horizontal_list_of_card/custom_card/favorite_button.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          SizedBox(
            width: 149,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CardImage(),
                CardTitle(),
                CardLocation(),
                CardItemQuantity(),
                CardTagList()
              ],
            ),
          ),
          const FavoriteButton(),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
