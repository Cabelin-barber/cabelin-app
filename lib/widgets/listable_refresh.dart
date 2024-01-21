import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:sembast/sembast.dart';

class ListableRefreshWidget extends StatefulWidget {

  ListableRefreshWidget({
    super.key,
    required this.onRefresh,
    required this.onLoadMore,
    required this.itemBuilder,
    required this.itemCount,
    required this.items,
    this.customEmpty
  });


  Future Function() onRefresh;
  Future Function() onLoadMore;
  Widget? Function(BuildContext, int) itemBuilder;
  int itemCount;
  List items;
  Widget? customEmpty;

  @override
  State<ListableRefreshWidget> createState() => _ListableRefreshWidgetState();
}

class _ListableRefreshWidgetState extends State<ListableRefreshWidget> {
  ScrollController scrollController = ScrollController();
  bool isLoadingMore = false;
  late int countOld;
    
  @override
  Widget build(BuildContext context) {
    countOld = widget.itemCount;
    
    scrollController.addListener(() async {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        setState(() {
          isLoadingMore = true;
        });
        await Future.delayed(const Duration(milliseconds: 500));
        await widget.onLoadMore();
        setState(() {
          isLoadingMore = false;
        });
      }
    });

    return CustomMaterialIndicator(
      indicatorBuilder: (_, __) => const CircularProgressIndicator.adaptive(),
      onRefresh: () async {
        widget.onRefresh();
      },
      
      child: widget.itemCount == 0 
      ? widget.customEmpty ?? const Center(
          child: TextWidget(
            "Não encontramos nada por aqui :(",
            textAlign: TextAlign.center,
          )
        )
      : Stack(
        children: [
          Visibility(
            visible: isLoadingMore,
            child: const Positioned.fill(
              bottom: 20,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator()
              )
            )
          ),
          ListView.builder(
            controller: scrollController,
            itemCount: widget.itemCount,
            itemBuilder: widget.itemBuilder
          ),
        ],
      )
    );
  }
}