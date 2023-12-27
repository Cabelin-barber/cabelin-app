import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GoogleLoginSocialWidget extends StatelessWidget {
  
  GoogleLoginSocialWidget({
    super.key,
    required this.isLoading,
    required this.onTap
  });

  bool isLoading;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {  
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            isLoading 
              ? const CircularProgressIndicator()
              : SvgPicture.asset("assets/google.svg"),
              const Expanded(
                child: TextWidget(
                  "Continue com o Google",
                  textAlign: TextAlign.center,
                  customWeight: FontWeight.w800,
                )
              )
          ],
        ) 
      ),
    );
  }
}