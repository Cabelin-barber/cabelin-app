import 'package:cabelin_v2/localstorage/models/user_model.dart';
import 'package:cabelin_v2/localstorage/repositories/user_storage_repository.dart';
import 'package:cabelin_v2/models/booking_model.dart';
import 'package:cabelin_v2/repositories/customer_repository.dart';
import 'package:cabelin_v2/utils/feedback_snackbar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalendarController extends GetxController {

  final _customerRepository = Get.find<CustomerRepository>();
  List<BookingModel> bookings = [];
  bool isLoading = false;

  CalendarController() {
    getAllBookings();
  }

  Future<void> getAllBookings() async {
    UserModel? currentUser = UserStorage.get();
    if(currentUser == null) return;
    isLoading = true;
    bookings.clear();
    update();
    try {
      List<BookingModel> res = await _customerRepository.getAllBookings();
      bookings.addAll(res);
      update();
    } catch (e) {
      FeedbackSnackbar.error("Houve um erro, tente novamente");
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> loadMoreBookings(int page) async {

  }
  
  String formatDate(DateTime dateTime) {
    String day = DateFormat('d', 'pt_BR').format(dateTime);
    String month = DateFormat('MMMM', 'pt_BR').format(dateTime);
    return '$day de $month';
  }
}