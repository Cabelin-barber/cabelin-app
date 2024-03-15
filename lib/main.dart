import 'package:cabelin_v2/firebase_options.dart';
import 'package:cabelin_v2/localstorage/repositories/location_storage.repository.dart';
import 'package:cabelin_v2/localstorage/repositories/user_storage_repository.dart';
import 'package:cabelin_v2/notifications/notification_service.dart';
import 'package:cabelin_v2/notifications/push_notificaitions.dart';
import 'package:cabelin_v2/pages/allEstablishmentServices/all_establishment_services_page.dart';
import 'package:cabelin_v2/pages/authentication/authenticatin_page.dart';
import 'package:cabelin_v2/pages/bookingConfirmation/booking_confirmation.dart';
import 'package:cabelin_v2/pages/bookingInformation/booking_information_page.dart';
import 'package:cabelin_v2/pages/createAccount/create_account_email.dart';
import 'package:cabelin_v2/pages/editAccount/edit_account_page.dart';
import 'package:cabelin_v2/pages/email_confirmation/pages/email_confirmation_page.dart';
import 'package:cabelin_v2/pages/estableshiment/estableshiment_page.dart';
import 'package:cabelin_v2/pages/feedback/feedback_page.dart';
import 'package:cabelin_v2/pages/pageview/pageview.dart';
import 'package:cabelin_v2/pages/pageview/pageview_controller.dart';
import 'package:cabelin_v2/pages/permissions.request/location/location_request_page.dart';
import 'package:cabelin_v2/pages/permissions.request/notification/notification_request_page.dart';
import 'package:cabelin_v2/pages/presentation/presentation_page.dart';
import 'package:cabelin_v2/pages/searchEstabliments/search_establishments_page.dart';
import 'package:cabelin_v2/routes/main.dart';
import 'package:event_bus/event_bus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_it/get_it.dart';
import 'package:timezone/data/latest.dart' as tz;

EventBus eventBus = EventBus();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var notificationService = NotificationService();
  await notificationService.initNotification();
  tz.initializeTimeZones();
  final getIt = GetIt.instance;
  getIt.registerSingletonAsync<UserStorageRepository>(() async {
    final userStorageRepository = UserStorageRepository();
    await userStorageRepository.openDatabase();
    return userStorageRepository;
  });
   getIt.registerSingletonAsync<UserLocationStorageRepository>(() async {
    final userLocationStorageRepository = UserLocationStorageRepository();
    await userLocationStorageRepository.openDatabase();
    return userLocationStorageRepository;
  });
  getIt.registerSingleton<PageViewController>(PageViewController());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform 
  );
  await FirebaseMessagingService(notificationService).initialize();

  await getIt.allReady();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
    GetPage(
      name: '/',
      page: () => const PageViewApp(),
  ),
    GetPage(
      name: '/presentation',
      page: () => PresentationPage(),
    ),
    GetPage(
      name: '/request_location',
      page: () => const RequestLocationPage(),
    ),
    GetPage(
      name: '/request_notification',
      page: () => const NotificationRequestPage(),
    ),
    
    GetPage(
      name: '/estableshiment',
      page: () => EstlableshimentPage(),
    ),
    GetPage(
      name: '/bookingConfirmation',
        page: () => BookingConfirmationPage(),
    ),
    GetPage(
      name: "/feedback",
      page: () => const FeedbackPage(),
    ),
    GetPage(
      name: "/bookingInformation",
      page: () => BookingInformationPage(),
    ),
    GetPage(
      name: "/editAccount",
      page: () => EditAccountPage()
    ),
    GetPage(
      name: "/authentication",
      page: () => AuthenticationPage(shouldComeBack: false)
    ),
///establishmentId
    GetPage(
      name: "/allEstablishmentServices/:estableshimentId",
      page: () => AllEstablishmentServicesPage(establishemntId: "teste",),
    ),
    GetPage(
      name: "/emailConfirmation",
      page: () => const EmailConfirmationPage(),
    ),
    GetPage(
      name: "/searchEstablishments",
      page: () =>  SearchEstablishmentsPage(),
    ),
    GetPage(
      name: "/createAccount",
      page: () =>  CreateAccountEmail(),
    )
  ],
      title: 'Flutter Demo',
      theme: ThemeData(
        dividerTheme: DividerThemeData(
          space: 35,
          color: Colors.grey.withOpacity(0.2)
        ),
        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.zero,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              )
            )
          )
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
          )
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[200],
          suffixIconColor: const Color(0xFF272727).withOpacity(0.5),
          iconColor: const Color(0xFF272727).withOpacity(0.5),
          prefixIconColor: const Color(0xFF272727).withOpacity(0.5),
          contentPadding:const EdgeInsets.only(left: 16, top: 23, right: 16, bottom: 23),
          hintStyle: TextStyle(
            fontFamily: 'Sora',
            color: Colors.black.withOpacity(0.6),
            fontWeight: FontWeight.w300
          ),
          errorStyle: const TextStyle(
            fontFamily: 'Sora',
            fontWeight: FontWeight.w800,
            color: Colors.red
          ),
          floatingLabelStyle: TextStyle(
            fontFamily: 'Sora',
            color: const Color(0xFF272727).withOpacity(0.5),
          ),
          labelStyle: TextStyle(
            color: const Color(0xFF272727).withOpacity(0.5),
            fontFamily: 'Sora'
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide:BorderSide(color: const Color(0xFF272727).withOpacity(0.5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: const Color(0xFF272727).withOpacity(0.5)),
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: const Color(0xFF272727).withOpacity(0.5)),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          enableFeedback: false,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          selectedItemColor: Color(0XFF322938),
          unselectedItemColor: Color(0XFF322938),
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            fontFamily: "Sora"
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            fontFamily: "Sora"
          )
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}