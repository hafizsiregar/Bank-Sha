import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/auth/sign_in_page.dart';
import 'package:bank_sha/ui/pages/auth/sign_up_page.dart';
import 'package:bank_sha/ui/pages/auth/sign_up_upload_ktp_page.dart';
import 'package:bank_sha/ui/pages/auth/sign_up_upload_profile_page.dart';
import 'package:bank_sha/ui/pages/data/data_package_page.dart';
import 'package:bank_sha/ui/pages/data/data_provider_page.dart';
import 'package:bank_sha/ui/pages/data/data_success_page.dart';
import 'package:bank_sha/ui/pages/home/home_page.dart';
import 'package:bank_sha/ui/pages/profile/profile_edit_pin_page.dart';
import 'package:bank_sha/ui/pages/profile/profile_edit_success_page.dart';
import 'package:bank_sha/ui/pages/splash/onboarding_page.dart';
import 'package:bank_sha/ui/pages/profile/pin_page.dart';
import 'package:bank_sha/ui/pages/topup/topup_amount_page.dart';
import 'package:bank_sha/ui/pages/topup/topup_page.dart';
import 'package:bank_sha/ui/pages/topup/topup_success_page.dart';
import 'package:bank_sha/ui/pages/transfer/transfer_amount_page.dart';
import 'package:bank_sha/ui/pages/transfer/transfer_page.dart';
import 'package:bank_sha/ui/pages/transfer/transfer_success_page.dart';
import 'package:flutter/material.dart';
import 'ui/pages/auth/sign_up_success_page.dart';
import 'ui/pages/profile/profile_edit_page.dart';
import 'ui/pages/profile/profile_page.dart';
import 'ui/pages/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: lightBackgroundColor,
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),        
        '/on-boarding': (context) => const OnBoardingPage(),        
        '/sign-in': (context) => const SignInPage(),        
        '/sign-up': (context) => const SignUpPage(),        
        '/sign-up-upload': (context) => const SignUpUploadProfilePage(),        
        '/sign-up-upload-ktp': (context) => const SignUpUploadKtpPage(),        
        '/sign-up-success': (context) => const SignUpSuccessPage(),        
        '/home': (context) => const HomePage(),        
        '/profile': (context) => const ProfilePage(),        
        '/pin': (context) => const PinPage(),        
        '/profile-edit': (context) => const ProfileEditPage(),        
        '/profile-edit-pin': (context) => const ProfileEditPinPage(),        
        '/profile-edit-success': (context) => const ProfileEditSuccessPage(),        
        '/topup': (context) => const TopupPage(),        
        '/topup-amount': (context) => const TopupAmountPage(),        
        '/topup-success': (context) => const TopupSuccessPage(),        
        '/transfer': (context) => const TransferPage(),   
        '/transfer-amount': (context) => const TransferAmountPage(),   
        '/transfer-success': (context) => const TransferSuccessPage(),  
        '/data-provider': (context) => const DataProviderPage(),  
        '/data-package': (context) => const DataPackagePage(),  
        '/data-success': (context) => const DataSuccessPage(),  
      },
    );
  }
}