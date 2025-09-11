import 'package:flutter/material.dart';

class AppConstants {
  // Colors
  static const Color primaryBlue = Color(0xFF1976D2);
  static const Color lightBlue = Color(0xFFE3F2FD);
  static const Color darkBlue = Color(0xFF0D47A1);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color greyColor = Color(0xFF757575);
  static const Color lightGreyColor = Color(0xFFE0E0E0);
  static const Color errorColor = Color(0xFFD32F2F);
  static const Color successColor = Color(0xFF388E3C);

  // Text Styles
  static const TextStyle headingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: blackColor,
  );

  static const TextStyle subHeadingStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: blackColor,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: blackColor,
  );

  static const TextStyle captionStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: greyColor,
  );

  // Strings
  static const String appName = 'IBA Leaders';
  static const String welcomeTitle = 'Welcome to IBA Leaders';
  static const String welcomeSubtitle =
      'Connect, collaborate, and lead with confidence in our exclusive community platform.';
  static const String getStartedButton = 'Get Started';

  // Login Screen
  static const String loginTitle = 'Welcome Back';
  static const String loginSubtitle = 'Sign in to your account to continue';
  static const String emailLabel = 'Email';
  static const String passwordLabel = 'Password';
  static const String loginButton = 'Log In';
  static const String forgotPasswordButton = 'Forgot Password?';
  static const String signUpButton = 'Sign Up';
  static const String dontHaveAccount = "Don't have an account? ";

  // Signup Screen
  static const String signupTitle = 'Create Account';
  static const String signupSubtitle = 'Join the IBA Leaders community today';
  static const String getCodeButton = 'Get Code';
  static const String alreadyHaveAccount = 'Already have an account? ';
  static const String signInButton = 'Sign In';

  // Verification Screen
  static const String verificationTitle = 'Check Your Inbox';
  static const String verificationSubtitle =
      'We\'ve sent a verification code to';
  static const String codeLabel = 'Verification Code';
  static const String submitButton = 'Submit';
  static const String resendCodeButton = 'Resend Code';
  static const String didntReceiveCode = "Didn't receive the code? ";

  // Password Screens
  static const String resetPasswordTitle = 'Reset Password';
  static const String createPasswordTitle = 'Create Password';
  static const String passwordSubtitle = 'Please enter your new password';
  static const String newPasswordLabel = 'New Password';
  static const String confirmPasswordLabel = 'Confirm Password';
  static const String updatePasswordButton = 'Update Password';
  static const String createPasswordButton = 'Create Password';

  // Validation Messages
  static const String emailRequiredError = 'Please enter your email';
  static const String emailInvalidError = 'Please enter a valid email';
  static const String phoneNotAllowedError = 'Phone numbers are not allowed';
  static const String nameNotAllowedError = 'Names are not allowed';
  static const String emailSymbolError =
      'Please enter a valid email address with @ symbol';
  static const String passwordRequiredError = 'Please enter your password';
  static const String passwordLengthError =
      'Password must be at least 8 characters';
  static const String passwordMatchError = 'Passwords do not match';
  static const String codeRequiredError = 'Please enter the verification code';
  static const String codeInvalidError = 'Please enter a valid 6-digit code';

  // Success Messages
  static const String passwordResetSuccess = 'Password reset successfully!';
  static const String passwordCreatedSuccess = 'Password created successfully!';
  static const String accountCreatedSuccess = 'Account created successfully!';
  static const String codeResendSuccess = 'Verification code sent!';

  // Asset Paths
  static const String logoPath = 'lib/assets/images/logo.png';
  static const String splashBackgroundPath = 'lib/assets/images/splash.png';
  static const String loginBackgroundPath = 'lib/assets/images/Log in.jpg';

  // Animation Durations
  static const Duration splashDuration = Duration(seconds: 3);
  static const Duration animationDuration = Duration(milliseconds: 1500);
  static const Duration shortAnimationDuration = Duration(milliseconds: 300);

  // Dimensions
  static const double defaultPadding = 16.0;
  static const double largePadding = 24.0;
  static const double smallPadding = 8.0;
  static const double borderRadius = 12.0;
  static const double buttonHeight = 50.0;
  static const double inputHeight = 56.0;

  // Regular Expressions
  static const String emailRegex =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  static const String phoneRegex = r'^[\+]?[0-9\s\-\(\)]{10,}$';
  static const String nameRegex = r'^[a-zA-Z\s]+$';
}
