import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/layout_widget.dart';
import 'package:cabelin_v2/widgets/text_button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if(didPop) {
            return;
          }
          context.go("/");

        },
        child: LayoutWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              LottieBuilder.asset(
                "assets/feedback_success.json",
                repeat: false,
              ),
              const TextWidget(
                "Reserva confirmada",
                customFontsize: 24,
              ),
              const TextWidget(
                "Hoje às 13:00",
                margin: EdgeInsets.only(top: 16),
                customFontsize: 24,
              ),
              
              TextButtonWidget(
                icon: Icons.calendar_month,
                title: "Adicionar lembrete",
                onTap: () {}
              ),
        
              const Spacer(),
              ButtonWidget(
                title: "Ir para agenda",
                margin: const EdgeInsets.only(bottom: 16),
                fullWidth: true,
                onTap: () {}
              )
            ],
          )
        ),
      ),
    );  
  }
}