import 'package:cabelin_v2/models/service_model.dart';
import 'package:cabelin_v2/pages/allEstablishmentServices/all_establishment_services_page.dart';
import 'package:cabelin_v2/pages/authentication/authenticatin_page.dart';
import 'package:cabelin_v2/pages/bookingConfirmation/booking_confirmation.dart';
import 'package:cabelin_v2/pages/bookingInformation/booking_information_page.dart';
import 'package:cabelin_v2/pages/editAccount/edit_account_page.dart';
import 'package:cabelin_v2/pages/email_confirmation/pages/email_confirmation_page.dart';
import 'package:cabelin_v2/pages/estableshiment/estableshiment_page.dart';
import 'package:cabelin_v2/pages/feedback/feedback_page.dart';
import 'package:cabelin_v2/pages/pageview/pageview.dart';
import 'package:cabelin_v2/pages/searchEstabliments/search_establishments_page.dart';
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
      path: '/bookingConfirmation/:estableshimentId',
        builder: (context, state) {
        final servicePicked = state.extra as ServiceModel;
        final estableshimentId = state.pathParameters["estableshimentId"] as String;
        return BookingConfirmationPage(
          servicePicked: servicePicked,
          establishmentId: estableshimentId,
        ); 
      },
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
      path: "/authentication",
      builder: (context, state) {
        final shouldComeBack = state.extra as bool;
        return AuthenticationPage(
          shouldComeBack: shouldComeBack,
        );
      } 
    ),
///establishmentId
    GoRoute(
      path: "/allEstablishmentServices/:estableshimentId",
      builder: (context, state) => AllEstablishmentServicesPage(
         establishemntId: state.pathParameters["estableshimentId"] as String,
      ),
    ),
    GoRoute(
      path: "/emailConfirmation",
      builder: (context, state) => const EmailConfirmationPage(),
    ),
    GoRoute(
      path: "/searchEstablishments",
      builder: (context, state) =>  SearchEstablishmentsPage(),
    )
  ],
);