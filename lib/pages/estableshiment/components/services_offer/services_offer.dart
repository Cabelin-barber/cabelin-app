import 'package:cabelin_v2/pages/estableshiment/components/services_offer/service_offer_controller.dart';
import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/list_refresh_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class ServicesOfferPage extends StatefulWidget {

  ServicesOfferPage({
    super.key,
    required this.establishmentId
  });

  String establishmentId;

  @override
  State<ServicesOfferPage> createState() => _ServicesOfferPageState();
}

class _ServicesOfferPageState extends State<ServicesOfferPage> with AutomaticKeepAliveClientMixin{
  

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    ServiceOfferController serviceOfferController = ServiceOfferController(establishmentId: widget.establishmentId);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Observer(
        builder: (context) =>   ListRefreshWidget(
        isLoading: serviceOfferController.isLoading,
        onRefresh: () async {
          serviceOfferController.getServices();
        },
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
        separatorBuilder: (_, __) => const Divider(),
        itemCount: serviceOfferController.services.length,
        itemBuilder: (_, index) => ListTile(
        leading: TextWidget(
          "R\$ ${serviceOfferController.services[index].price.value.toString()}",
          customWeight: FontWeight.w800,
          customFontsize: 16,
        ),
        title: TextWidget(
          serviceOfferController.services[index].name,
          customWeight: FontWeight.w800,
          customFontsize: 16,
        ),
        subtitle: TextWidget(
          serviceOfferController.services[index].description,
          customFontsize: 13,
        ),
        trailing: ButtonWidget(
          title: "Escolher",
          onTap: () {
            context.push("/bookingConfirmation");
          }
        ),
      ),
     )) 
    );
  }
}
