import 'package:cabelin_v2/pages/estableshiment/components/portfolio/portfolio_controller.dart';
import 'package:cabelin_v2/widgets/image_widget.dart';
import 'package:cabelin_v2/widgets/list_refresh_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class Portfolio extends StatefulWidget {

  Portfolio({
    super.key,
    required this.establishmentId
  });

  String establishmentId;

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> with AutomaticKeepAliveClientMixin{
  

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final portfolioController = Get.put(PortfolioController(establishmentId: widget.establishmentId));
    
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
                    onTap: () => Get.back(),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.only(right: 16, top: 16),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(50)),
                        child: const Icon(Icons.close_rounded),
                      ),
                    ),
                  )
                ],
              ),
            );
          });
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListRefreshWidget(
          itemCount: portfolioController.photos.length,
          isLoading: portfolioController.isLoading,
          customEmpty: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LottieBuilder.asset(
                  "assets/empty.json",
                ),
                const TextWidget(
                  "Sem fotos por enquanto",
                ),
              ],
            ),
          ),
          onRefresh: () async {
            portfolioController.getPortfolioPhotos();
          },
          itemBuilder: (_, index) => InkWell(
            onTap: () => showImageFullScreen(portfolioController.photos[index].id),
              child: ImageNetworkWidget(
                url: portfolioController.photos[index].id,
                width: MediaQuery.of(context).size.width,
                height: 300,
              )
            ),
          )
    );
  }
}
