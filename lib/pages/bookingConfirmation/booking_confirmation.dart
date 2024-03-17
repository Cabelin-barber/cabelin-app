import 'package:cabelin_v2/localstorage/models/user_model.dart';
import 'package:cabelin_v2/localstorage/repositories/user_storage_repository.dart';
import 'package:cabelin_v2/models/service_model.dart';
import 'package:cabelin_v2/pages/allEstablishmentServices/all_establishment_services_page.dart';
import 'package:cabelin_v2/pages/authentication/authenticatin_page.dart';
import 'package:cabelin_v2/pages/bookingConfirmation/booking_confirmation_controller.dart';
import 'package:cabelin_v2/pages/bookingConfirmation/components/list_services.dart';
import 'package:cabelin_v2/utils/loading_fullscreen.dart';
import 'package:cabelin_v2/utils/real_formatter.dart';
import 'package:cabelin_v2/widgets/appbar_widget.dart';
import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/list_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class BookingConfirmationPage extends StatelessWidget {
  BookingConfirmationPage({super.key});

  ServiceModel servicePicked = Get.arguments["service"];
  String establishmentId = Get.arguments["establishmentId"];

  @override
  Widget build(BuildContext context) {
    //final userStorageRepository = GetIt.instance<UserStorageRepository>();
    initializeDateFormatting();
    DateFormat formatter = DateFormat("d 'de' MMMM", 'pt_BR');
    DateTime todayDate = DateTime.now();

    return GetBuilder(
      init: BookingConfirmationController(
        firstServicePicked: servicePicked
      ),
      builder: (controller) => Scaffold(
        appBar: AppbarWidget(
          title: "Dia e horário da reserva",
        ),
        bottomNavigationBar: Container(
          color: Colors.grey.withOpacity(0.3),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                controller.allServicesPicked.fold(0, (sum, expense) => sum + expense.price.value.toInt()).toString(),
                customWeight: FontWeight.w800,
              ),
      
              ButtonWidget(
                  title: "Finalizar",
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        useSafeArea: true,
                        builder: (context) {
                          return Container(
                              height: MediaQuery.of(context).size.height / 1.3,
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(16),
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const TextWidget(
                                        "Finalização de pedido",
                                        customWeight: FontWeight.w800,
                                      ),
                                      GestureDetector(
                                        onTap: () => Get.back(),
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(50)
                                          ),
                                          child: const Icon(Icons.close_rounded),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height/2,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView.builder(
                                      itemCount: controller.allServicesPicked.length,
                                      itemBuilder: (_, index) {
                                        return ListTile(
                                          title: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextWidget(
                                                controller.allServicesPicked[index].professionals[index].name,
                                                customWeight: FontWeight.w800,
                                              ),
                                              TextWidget(
                                                RealFormat.format(controller.allServicesPicked[index].price.value),
                                                customWeight: FontWeight.w800,
                                              ),
                                            ],
                                          ),
                                          subtitle: TextWidget(
                                            controller.allServicesPicked[index].name,
                                            customFontsize: 14,
                                            color: Colors.grey[600],
                                          ),
                                        );
                                      } 
                                    ),
                                  ),
                                  const Spacer(flex: 2,),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const TextWidget(
                                            "Total",
                                            customWeight: FontWeight.w900,
                                            customFontsize: 20,
                                          ),
                                          TextWidget(
                                            RealFormat.format(controller.allServicesPicked.fold(0, (sum, expense) => sum + expense.price.value.toInt())),
                                            customWeight: FontWeight.w900,
                                            customFontsize: 20,
                                          )
                                        ],
                                      ),
                                      ButtonWidget(
                                        title: "Finalizar",
                                        fullWidth: true,
                                        onTap: () {
                                          UserModel? currentUser = UserStorage.get();// userStorageRepository.getUser();
                                          currentUser == null 
                                            ?  Get.to(AuthenticationPage(shouldComeBack: true))
                                            : Get.toNamed("/feedback");
                                        }
                                      ),
                                    ],
                                  )
                                ],
                              )
                          );
                        }
                    );
                  }
                )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Theme(
                data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent),
                child: EasyDateTimeLine(
                  initialDate: DateTime.now(),
                  locale: "pt_Br",
                  activeColor: Colors.blue,
                  onDateChange: (dateSelected) async {
                    LoadingFullscreen.startLoading();
                    await Future.delayed(const Duration(seconds: 3));
                    LoadingFullscreen.stopLoading();
                    controller.changeDate(dateSelected);
                  },
                  itemBuilder: (context, dayNumber, dayName, monthName, fullDate,
                      isSelected) {
                    return Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: isSelected ? Colors.blue : Colors.black,
                              borderRadius: BorderRadius.circular(50)),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              TextWidget(
                                dayNumber.toString(),
                                color: isSelected ? Colors.black : Colors.white,
                                isFontWeight: true,
                                customFontsize: 16,
                              ),
                              TextWidget(
                                dayName,
                                isFontWeight: true,
                                customFontsize: 13,
                                color: isSelected ? Colors.black : Colors.white,
                              ),
                              Visibility(
                                visible: formatter.format(fullDate) ==
                                    formatter.format(todayDate),
                                child: Container(
                                  width: 5,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  headerProps: const EasyHeaderProps(
                      monthPickerType: MonthPickerType.switcher,
                      showSelectedDate: true,
                      monthStyle: TextStyle(fontFamily: 'Sora'),
                      selectedDateStyle: TextStyle(
                          fontFamily: 'Sora', fontWeight: FontWeight.w600)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      formatter.format(controller.currentSelectedDate),
                      isFontWeight: true,
                    ),
                    const TextWidget(
                      "9 horários disponíveis",
                      customFontsize: 16,
                      color: Colors.grey,
                      margin: EdgeInsets.only(bottom: 16),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ListWidget(
                        separatorBuilder: (_, __) => Container(width: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (_, index) => GestureDetector(
                          onTap: () => controller.setCurrentTimeSelected(index),
                          child: Container(
                            decoration: BoxDecoration(
                              color: controller.currentTimeSelected 
                                !=null && controller.currentTimeSelected == index
                                  ? Colors.blue
                                  : Colors.white,
                                border: Border.all(
                                  color: controller.currentTimeSelected 
                                    != null && controller.currentTimeSelected == index
                                    ? Colors.blue
                                    : Colors.grey
                                ),
                              borderRadius: BorderRadius.circular(16)
                            ),
                            padding: const EdgeInsets.all(16),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.wb_sunny_outlined,
                                  size: 16,
                                ),
                                TextWidget(
                                  "13:00",
                                  margin: EdgeInsets.only(left: 3),
                                  customFontsize: 13,
                                  isFontWeight: true,
                                )
                              ],
                            ),
                          )
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    ListServices(
                      services: controller.allServicesPicked,
                      onDeleteService: (int index) {
                        controller.deleteService(index);
                      }
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 16),
                      child: InkWell(
                        onTap: () => Get.to(() => AllEstablishmentServicesPage(establishemntId: establishmentId)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              "Adicionar outro corte",
                              customWeight: FontWeight.w800,
                              color: Colors.blue[900],
                              customFontsize: 16,
                            ),
                            Icon(
                              Icons.add,
                              color: Colors.blue[900],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
