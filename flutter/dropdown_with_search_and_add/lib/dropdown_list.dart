import 'package:dropdown_with_search_and_add/list_item.dart';
import 'package:flutter/material.dart';

class DropdownList extends StatelessWidget {
  final List<ListItem> list;
  final void Function(String) handleTap;
  final void Function(String) handleSelect;

  const DropdownList({
    super.key,
    required this.list,
    required this.handleTap,
    required this.handleSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 300.0,
        ),
        child: Card(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: list[index].isAddable
                    ? GestureDetector(
                        onTap: () => handleTap(list[index].value as String),
                        child: Text(
                          list[index].item,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () => handleSelect(list[index].item),
                        child: Text(
                          list[index].item,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}
