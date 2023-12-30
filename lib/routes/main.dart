import 'package:cabelin_v2/pages/bookingConfirmation/booking_confirmation.dart';
import 'package:cabelin_v2/pages/estableshiment/estableshiment_page.dart';
import 'package:cabelin_v2/pages/feedback/feedback_page.dart';
import 'package:cabelin_v2/pages/pageview/pageview.dart';
import 'package:cabelin_v2/utils/globalContext.dart';
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
      path: '/estableshiment',
      builder: (context, state) => const EstlableshimentPage(),
    ),
    GoRoute(
      path: '/bookingConfirmation',
      builder: (context, state) => const BookingConfirmationPage(),
    ),
    GoRoute(
      path: "/feedback",
      builder: (context, state) => const FeedbackPage(),
    )
  ],
);