import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ListWidget extends StatelessWidget {

  ListWidget({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.separatorBuilder,
    this.customEmpty,
    this.isLoading,
    this.scrollDirection = Axis.vertical,
    this.physics,
    this.isEmpty
  });

  Widget? Function(BuildContext, int) itemBuilder;
  Widget Function(BuildContext, int)? separatorBuilder;
  Widget? customEmpty;
  Axis scrollDirection = Axis.vertical;
  ScrollPhysics? physics;
  int itemCount;
  bool? isLoading;
  bool? isEmpty;

  @override
  Widget build(BuildContext context) {
    return isEmpty != null && isEmpty == true ? (
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
      : ListView.separated(
        shrinkWrap: true,
        scrollDirection: scrollDirection,
        physics: physics,
        itemBuilder: itemBuilder,
        separatorBuilder: separatorBuilder ?? (_, __) =>  Container(height: 16),
        itemCount: itemCount
      );
    }
}