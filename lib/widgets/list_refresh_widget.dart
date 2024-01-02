import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class ListRefreshWidget extends StatelessWidget {

  ListRefreshWidget({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    required this.onRefresh,
    this.separatorBuilder,
    this.customEmpty,
    this.isLoading,
    this.scrollDirection = Axis.vertical,
    this.physics
  });

  
  Widget? Function(BuildContext, int) itemBuilder;
  Widget Function(BuildContext, int)? separatorBuilder;
  Future<void> Function() onRefresh;
  Widget? customEmpty;
  Axis scrollDirection = Axis.vertical;
  ScrollPhysics? physics;
  int itemCount;
  bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading != null && isLoading == false && itemCount == 0 ? (
      customEmpty ?? const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              "Encontramos nada por aqui",
              textAlign: TextAlign.center,
            )
          ],
        )
      ):
    isLoading != null && isLoading == true ? 
      Align(
        child: LottieBuilder.asset(
          "assets/loading.json",
          width: 100,
        ),
      )
      : CustomMaterialIndicator(
        onRefresh: onRefresh,
        indicatorBuilder: (context, controller) => const CupertinoActivityIndicator(),
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: scrollDirection,
          physics: physics,
          itemBuilder: itemBuilder,
          separatorBuilder: separatorBuilder ?? (_, __) =>  Container(height: 16),
          itemCount: itemCount
        ),
      );
    }
}