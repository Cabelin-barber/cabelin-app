import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class SmartRefreshWidget extends StatefulWidget {

  SmartRefreshWidget({
    required this.loadMore,
    required this.onRefresh,
    required this.child,
    super.key
  });

  Function() loadMore;
  Function() onRefresh;
  Widget child;

  @override
  State<SmartRefreshWidget> createState() => _SmartRefreshWidgetState();
}

class _SmartRefreshWidgetState extends State<SmartRefreshWidget> {
  final refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {

    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: refreshController,
        header: const WaterDropHeader(
          complete: CupertinoActivityIndicator(),
        ),
        onLoading: () async {
          await widget.loadMore();
          refreshController.loadComplete();
        },
        onRefresh: () async {
          await widget.onRefresh();
          refreshController.refreshCompleted();
        },
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode){
            Widget body ;
            if(mode==LoadStatus.loading){
              body = const CupertinoActivityIndicator();
            }
            else if(mode == LoadStatus.failed){
              body = const Text("Load Failed!Click retry!");
            }
            else{
              body = const TextWidget("Você chegou ao fim");
            }
            return SizedBox(
              height: 55.0,
              child: Center(child:body),
            );
          },
        ),
        child: widget.child,
      );
  }
}