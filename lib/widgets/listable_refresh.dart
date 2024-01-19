import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';

class ListableRefreshWidget extends StatefulWidget {

  ListableRefreshWidget ({super.key, required this.items});
  List items;

  @override
  State<ListableRefreshWidget> createState() => _ListableRefreshWidgetState();
}

class _ListableRefreshWidgetState extends State<ListableRefreshWidget> {
  ScrollController scrollController = ScrollController();
  bool isLoadingMore = false;
    
  @override
  Widget build(BuildContext context) {

    scrollController.addListener(() async {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        setState(() {
          isLoadingMore = true;
        });
        await Future.delayed(const Duration(seconds: 2));
        setState(() {
          isLoadingMore = false;
        });
      }
    });

    return CustomMaterialIndicator(
      indicatorBuilder: (_, __) => const CircularProgressIndicator.adaptive(),
      onRefresh: () async {
        print(widget.items);
        print(widget.items.length);
        print("REFRESH...");
      },
      
      child: Stack(
        children: [
          Visibility(
            visible: isLoadingMore,
            child: const Positioned.fill(
              bottom: 30,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator()
              )
            )
          ),
          ListView.builder(
            controller: scrollController,
            itemCount: 50,
            itemBuilder: (_, __) => const TextWidget("Item")
          ),
        ],
      )
    );
  }
}