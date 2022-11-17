import 'package:flutter/material.dart';
import 'package:search_custom_list_card/card_data.dart';
import 'package:search_custom_list_card/custom_card/custom_card.dart';

class CustomCardList extends StatelessWidget {
  final List<CardData> list;
  const CustomCardList({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? const Center(
            child: Text("No data"),
          )
        : ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return CustomCard(data: list[index]);
            },
          );
  }
}
