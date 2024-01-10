import 'package:cabelin_v2/localstorage/models/user_model.dart';
import 'package:cabelin_v2/localstorage/repositories/user_storage_repository.dart';
import 'package:cabelin_v2/models/picture_model.dart';
import 'package:cabelin_v2/models/price_model.dart';
import 'package:cabelin_v2/models/professional_model.dart';
import 'package:cabelin_v2/models/service_model.dart';
import 'package:cabelin_v2/pages/allEstablishmentServices/all_establishment_services_page.dart';
import 'package:cabelin_v2/pages/bookingConfirmation/booking_confirmation_controller.dart';
import 'package:cabelin_v2/utils/globalContext.dart';
import 'package:cabelin_v2/widgets/appbar_widget.dart';
import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/list_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class BookingConfirmationPage extends StatelessWidget {
  BookingConfirmationPage({super.key, required this.servicePicked});

  ServiceModel servicePicked;

  @override
  Widget build(BuildContext context) {
    final userStorageRepository = GetIt.instance<UserStorageRepository>();
    initializeDateFormatting();
    DateFormat formatter = DateFormat("d 'de' MMMM", 'pt_BR');
    DateTime todayDate = DateTime.now();

    final calendarController = BookingConfirmationController(firstServicePicked: servicePicked);

    return Scaffold(
      appBar: AppbarWidget(
        title: "Dia e o horário da reserva",
      ),
      bottomNavigationBar: Container(
        color: Colors.grey.withOpacity(0.3),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Observer(builder: (_) =>             TextWidget(
              calendarController.allServicesPicked.fold(0, (sum, expense) => sum + expense.price.value).toString(),
              customWeight: FontWeight.w800,
            ),
            
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
                                      onTap: () {
                                        context.pop();
                                      },
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
                                      itemCount: calendarController.allServicesPicked.length,
                                      itemBuilder: (_, index) => ListTile(
                                            title: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                TextWidget(
                                                  "Barbeiro Ze",
                                                  //calendarController.allServicesPicked[index].professionals[index].name,
                                                  customWeight: FontWeight.w800,
                                                ),
                                                TextWidget(
                                                  calendarController.allServicesPicked[index].price.value.toString(),
                                                  customWeight: FontWeight.w800,
                                                ),
                                              ],
                                            ),
                                            subtitle: TextWidget(
                                              calendarController.allServicesPicked[index].name,
                                              customFontsize: 14,
                                              color: Colors.grey[600],
                                            ),
                                            leading: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:BorderRadius.all(
                                                  Radius.circular(10)
                                                )
                                              ),
                                            ),
                                          )
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
                                          calendarController.allServicesPicked.fold(0, (sum, expense) => sum + expense.price.value).toString(),
                                          customWeight: FontWeight.w900,
                                          customFontsize: 20,
                                        )
                                      ],
                                    ),
                                    ButtonWidget(
                                        title: "Finalizar",
                                        fullWidth: true,
                                        onTap: () {
                                          UserModel? currentUser = userStorageRepository.getUser();
                                          currentUser == null ? context.push("/authentication", extra: true) : context.push("/feedback");
                                        }
                            ),
                                  ],
                                )
                              ],
                            )
                  );
                      }
              );
                })
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
                onDateChange: (dateSelected) {
                  calendarController.changeDate(dateSelected);
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
                  Observer(builder: (_) {
                    return TextWidget(
                      formatter.format(calendarController.currentSelectedDate),
                      isFontWeight: true,
                    );
                  }),
                  const TextWidget(
                    "9 horários disponíveis",
                    customFontsize: 16,
                    color: Colors.grey,
                    margin: EdgeInsets.only(bottom: 16),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 4 / 2),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(onTap: () {
                        calendarController.setCurrentTimeSelected(index);
                      }, child: Observer(builder: (_) {
                        return Container(
                          decoration: BoxDecoration(
                              color: calendarController.currentTimeSelected 
                                !=null && calendarController.currentTimeSelected == index
                                  ? Colors.blue
                                  : Colors.white,
                              border: Border.all(
                                  color: calendarController.currentTimeSelected 
                                  != null && calendarController.currentTimeSelected == index
                                          ? Colors.blue
                                          : Colors.grey),
                              borderRadius: BorderRadius.circular(16)),
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
                        );
                      }));
                    },
                  ),
                  const SizedBox(height: 22),
                  Observer(
                      builder: (_) => ListWidget(
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 12),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                calendarController.allServicesPicked.length,
                            itemBuilder: (_, index) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              padding: const EdgeInsets.all(22),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                        calendarController
                                            .allServicesPicked[index].name,
                                        customWeight: FontWeight.w800,
                                        customFontsize: 16,
                                      ),
                                      TextWidget(
                                        "R\$ ${calendarController.allServicesPicked[index].price.value.toString()}",
                                        customWeight: FontWeight.w800,
                                        customFontsize: 16,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                  Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 16),
                    child: InkWell(
                      onTap: () async {
                        var res = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const AllEstablishmentServicesPage())
                        );
                        calendarController.addNewService(res);
                      },
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
    );
  }
}
