import 'dart:io';

import 'package:add_image_with_list/selected_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageList extends StatefulWidget {
  final List<XFile> list;
  final void Function() handler;

  const ImageList({
    Key? key,
    required this.list,
    required this.handler,
  }) : super(key: key);

  @override
  State<ImageList> createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  int thumbnailIndex = 0;

  selectThumbnailHandler(int index) {
    setState(() {
      thumbnailIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.list.length,
                itemBuilder: (context, index) {
                  return SelectedThumbnail(
                    handler: (index) => selectThumbnailHandler(index),
                    child: Image.file(File(widget.list[index].path)),
                    isThumbnail: thumbnailIndex == index,
                  );
                }),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: widget.handler,
            icon: const Icon(Icons.add_rounded),
            label: const Text("Add Photo"),
          ),
        ],
      ),
    );
  }
}
