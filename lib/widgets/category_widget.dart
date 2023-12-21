import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {

  CategoryWidget({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.onTap
  });

  String title;
  String imageUrl;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 76,
        height: 76,
        decoration: const BoxDecoration(
          color: Color(0XFFF8EDFF),
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 4),
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              width: 44,
              height: 44,
              // semanticsLabel: 'A red up arrow'
            ),
    
            TextWidget(
              title,
              customFontsize: 10,
              margin: const EdgeInsets.only(top: 6)
            )
          ],
        )
      ),
    );
  }
}