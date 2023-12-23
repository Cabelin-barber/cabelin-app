import 'package:mobx/mobx.dart';
part 'booking_confirmation_controller.g.dart';

class BookingConfirmationController = _BookingConfirmationControllerBase with _$BookingConfirmationController;

abstract class _BookingConfirmationControllerBase with Store {
  @observable
  int? currentTimeSelected;

  @action
  void setCurrentTimeSelected(int newTime) {
    currentTimeSelected = newTime;
  } 

  @observable
  DateTime currentSelectedDate = DateTime.now();

  @action
  void changeDate(DateTime newDate) {
    currentSelectedDate = newDate;
  }
}