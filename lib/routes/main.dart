import 'package:cabelin_v2/pages/bookingConfirmation/booking_confirmation.dart';
import 'package:cabelin_v2/pages/estableshiment/estableshiment_page.dart';
import 'package:cabelin_v2/pages/pageview/pageview.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const PageViewApp(),
    ),
    GoRoute(
      path: '/estableshiment',
      builder: (context, state) => const EstlableshimentPage(),
    ),
    GoRoute(
      path: '/bookingConfirmation',
      builder: (context, state) => const BookingConfirmationPage(),
    ),
  ],
);