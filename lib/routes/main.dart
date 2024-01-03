import 'package:cabelin_v2/pages/allEstablishmentServices/all_establishment_services_page.dart';
import 'package:cabelin_v2/pages/bookingConfirmation/booking_confirmation.dart';
import 'package:cabelin_v2/pages/bookingInformation/booking_information_page.dart';
import 'package:cabelin_v2/pages/editAccount/edit_account_page.dart';
import 'package:cabelin_v2/pages/estableshiment/estableshiment_page.dart';
import 'package:cabelin_v2/pages/feedback/feedback_page.dart';
import 'package:cabelin_v2/pages/pageview/pageview.dart';
import 'package:cabelin_v2/utils/globalContext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  navigatorKey: GlobalContext.context,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const PageViewApp(),
    ),
    GoRoute(
      path: '/estableshiment/:estableshimentId',
      builder: (context, state) => EstlableshimentPage(
        estableshimentId: state.pathParameters['estableshimentId']!,
      ),
    ),
    GoRoute(
      path: '/bookingConfirmation',
      builder: (context, state) => const BookingConfirmationPage(),
    ),
    GoRoute(
      path: "/feedback",
      builder: (context, state) => const FeedbackPage(),
    ),
    GoRoute(
      path: "/bookingInformation",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: const BookingInformationPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child
            );
          }
        );
      },
    ),
    GoRoute(
      path: "/editAccount",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: const EditAccountPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child
            );
          }
        );
      },
    ),
    GoRoute(
      path: "/allEstablishmentServices",
      builder: (context, state) => const AllEstablishmentServicesPage(),
    )
  ],
);