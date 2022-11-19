import 'package:add_image_with_list/image_source_choice/each_choice.dart';
import 'package:add_image_with_list/source_choice.dart';
import 'package:flutter/material.dart';

class ImageSourceChoicePopup extends StatelessWidget {
  final void Function(SourceChoice) handler;

  const ImageSourceChoicePopup({
    Key? key,
    required this.handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 200,
          width: double.infinity,
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                EachChoice(
                  btnTxt: "Gallery",
                  choice: SourceChoice.gallery,
                  handler: handler,
                ),
                EachChoice(
                  btnTxt: "Camera",
                  choice: SourceChoice.camera,
                  handler: handler,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
