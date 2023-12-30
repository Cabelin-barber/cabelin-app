import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {

    showImageFullScreen(String urlImage) {
      showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Center(child: Image.network(urlImage)),
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: const EdgeInsets.only(right: 16, top: 16),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: const Icon(Icons.close_rounded),
                    ),
                  ),
                )
              ],
            ),
          );
        }
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.count(
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        crossAxisCount: 2,
        children: List.generate(100, (index) {
          return InkWell(
            onTap: () => showImageFullScreen("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.X6-9dBY_jMvvulC67C1MxgHaHa%26pid%3DApi&f=1&ipt=69951b32b3fa69c52caf2752ca959341b3041b3c2065e4a6251ed4b029ac389b&ipo=images"),
            child: Image.network("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.X6-9dBY_jMvvulC67C1MxgHaHa%26pid%3DApi&f=1&ipt=69951b32b3fa69c52caf2752ca959341b3041b3c2065e4a6251ed4b029ac389b&ipo=images")
          );
        }),
      ),
    );
  }
}
