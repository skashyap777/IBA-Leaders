import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/verification_screen.dart';
import '../screens/reset_password_screen.dart';
import '../screens/create_password_screen.dart';
import '../screens/main_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String main = '/main';  // Single main screen for all navigation
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String verification = '/verification';
  static const String resetPassword = '/reset-password';
  static const String createPassword = '/create-password';
  
  // Legacy routes - can be removed later
  static const String home = '/main';
  static const String dashboard = '/main';
  static const String allianceScreen = '/main';
  static const String postScreen = '/main';

  static Map<String, WidgetBuilder> get routes => {
    splash: (context) => const SplashScreen(),
    main: (context) => const MainScreen(),
    welcome: (context) => const WelcomeScreen(),
    login: (context) => const LoginScreen(),
    signup: (context) => const SignupScreen(),
    resetPassword: (context) => const ResetPasswordScreen(),
    createPassword: (context) => const CreatePasswordScreen(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case verification:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (context) => VerificationScreen(
            email: args?['email'] ?? '',
            isSignup: args?['isSignup'] ?? false,
          ),
        );
      default:
        return null;
    }
  }

  static void navigateToVerification(
    BuildContext context, {
    required String email,
    required bool isSignup,
  }) {
    Navigator.pushNamed(
      context,
      verification,
      arguments: {'email': email, 'isSignup': isSignup},
    );
  }
}
