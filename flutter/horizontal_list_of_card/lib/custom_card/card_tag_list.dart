import 'package:flutter/material.dart';

import 'package:horizontal_list_of_card/custom_card/card_tag.dart';

class CardTagList extends StatelessWidget {
  const CardTagList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: Wrap(
        clipBehavior: Clip.hardEdge,
        children: const [
          CardTag(title: '#abcdef'),
          CardTag(title: '#ghijkl'),
        ],
      ),
    );
  }
}
