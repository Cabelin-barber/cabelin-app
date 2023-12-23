import 'package:flutter/material.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: GridView.count(
        mainAxisSpacing: 30,
        crossAxisSpacing: 30,
        crossAxisCount: 2,
        children: List.generate(100, (index) {
          return Image.network("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.X6-9dBY_jMvvulC67C1MxgHaHa%26pid%3DApi&f=1&ipt=69951b32b3fa69c52caf2752ca959341b3041b3c2065e4a6251ed4b029ac389b&ipo=images");
        }),
      ),
    );
  }
}
