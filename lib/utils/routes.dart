import 'package:dry_cleaners/misc/misc_global_variables.dart';
import 'package:dry_cleaners/models/addres_list_model/address.dart';
import 'package:dry_cleaners/models/all_service_model/service.dart';
import 'package:dry_cleaners/screens/address/add_update_address.dart';
import 'package:dry_cleaners/screens/address/manage_address_screen.dart';
import 'package:dry_cleaners/screens/auth/login_screen.dart';
import 'package:dry_cleaners/screens/auth/password_recovery.dart';
import 'package:dry_cleaners/screens/auth/password_recovery_stage_three.dart';
import 'package:dry_cleaners/screens/auth/password_recovery_stage_two.dart';
import 'package:dry_cleaners/screens/auth/sign_up_otp_image_upload.dart';
import 'package:dry_cleaners/screens/auth/sign_up_otp_verification.dart';
import 'package:dry_cleaners/screens/auth/sign_up_screen.dart';
import 'package:dry_cleaners/screens/auth/sign_up_success.dart';
import 'package:dry_cleaners/screens/homePage/choose_items.dart';
import 'package:dry_cleaners/screens/homePage/edit_profile.dart';
import 'package:dry_cleaners/screens/homePage/home_screen.dart';
import 'package:dry_cleaners/screens/onBoarding/on_boarding.dart';
import 'package:dry_cleaners/screens/onBoarding/splash_screen.dart';
import 'package:dry_cleaners/screens/order/delivery_schedule_picker.dart';
import 'package:dry_cleaners/screens/order/order_details_page.dart';
import 'package:dry_cleaners/screens/order/schedule_picker.dart';
import 'package:dry_cleaners/screens/other/about_us.dart';
import 'package:dry_cleaners/screens/other/contact_us.dart';
import 'package:dry_cleaners/screens/other/privacy_policy.dart';
import 'package:dry_cleaners/screens/other/terms_of_service.dart';
import 'package:dry_cleaners/screens/payment/add_card_screen.dart';
import 'package:dry_cleaners/screens/payment/order_success.dart';
import 'package:dry_cleaners/screens/payment/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  /*We are mapping all th eroutes here
  so that we can call any named route
  without making typing mistake
  */
  Routes._();
  //core
  static const splash = '/';
  static const onBoarding = '/onBoarding';
  static const loginScreen = '/loginScreen';
  static const recoverPassWordStageOne = '/recoverPassWordStageOne';
  static const recoverPassWordStageTwo = '/recoverPassWordStageTwo';
  static const recoverPassWordStageThree = '/recoverPassWordStageThree';
  static const signUpScreen = '/signUpScreen';
  static const signUpOtpScreen = '/signUpOtpScreen';
  static const signUpImageUpload = '/signUpImageUpload';
  static const signUpComeplete = '/signUpComplete';
  static const homeScreen = '/homeScreen';
  static const orderDetails = '/orderDetails';
  static const checkOutScreen = '/checkOutScreen';
  static const orderSuccessScreen = '/orderSuccessScreen';

  //Functionality
  static const chooseItemScreen = '/chooseItemScreen';
  //Functionality
  static const manageAddressScreen = '/manageAddressScreen';
  static const addOrUpdateAddressScreen = '/addOrUpdateAddressScreen';
  //others
  static const privacyPolicyScreen = '/privacyPolicyScreen';
  static const termsOfServiceScreen = '/termsOfServiceScreen';
  static const aboutUsScreen = '/aboutUsScreen';
  static const contactUsScreen = '/contactUsScreen';
  static const schedulePickerScreen = '/schedulePickerScreen';
  static const deilverySchedulePickerScreen = '/deilverySchedulePickerScreen';

  //Card
  static const addCardScreen = '/addCardScreen';

  static const editProfileScreen = '/editProfileScreen';
}

Route generatedRoutes(RouteSettings settings) {
  Widget child;

  switch (settings.name) {
    //core
    case Routes.splash:
      child = const SplashScreen();
      break;
    case Routes.onBoarding:
      child = OnBoardingScreen();

      break;
    case Routes.loginScreen:
      child = const LoginScreen();
      break;
    case Routes.recoverPassWordStageOne:
      child = RecoverPasswordStageOne();
      break;
    case Routes.recoverPassWordStageTwo:
      child = RecoverPasswordStageTwo(
        forEmailorPhone: settings.arguments! as String,
      );
      break;
    case Routes.recoverPassWordStageThree:
      child = RecoverPasswordStageThree(
        token: settings.arguments! as String,
      );
      break;
    case Routes.signUpScreen:
      child = const SignUpScreen();
      break;
    case Routes.signUpOtpScreen:
      child = SignUpOtpVerification(
        forEmailorPhone: settings.arguments! as String,
      );
      break;
    case Routes.signUpImageUpload:
      child = const SignUpImageUpload();
      break;
    case Routes.signUpComeplete:
      child = const SignUpComplete();
      break;
    case Routes.homeScreen:
      child = const HomeScreen();
      break;
    case Routes.orderDetails:
      child = OrderDetails(
        orderID: settings.arguments! as String,
      );
      break;
    case Routes.checkOutScreen:
      child = const CheckOutScreen();
      break;
    case Routes.orderSuccessScreen:
      child = OrderSuccessScreen(
        details: settings.arguments! as Map<String, dynamic>,
      );
      break;
    //Functionality
    case Routes.chooseItemScreen:
      child = ChooseItems(
        service: settings.arguments! as Service,
      );
      break;
    //Functionality
    case Routes.manageAddressScreen:
      child = const ManageAddressScreen();
      break;
    case Routes.addOrUpdateAddressScreen:
      child = AddOrEditAddress(
        address: settings.arguments as Address?,
      );
      break;
    //Others
    case Routes.privacyPolicyScreen:
      child = const PrivacyPolicy();
      break;
    case Routes.termsOfServiceScreen:
      child = const TermsOfService();
      break;
    case Routes.aboutUsScreen:
      child = const AboutUs();
      break;
    case Routes.contactUsScreen:
      child = const ContactUs();
      break;
    case Routes.schedulePickerScreen:
      child = const SchedulerPicker();
      break;
    case Routes.deilverySchedulePickerScreen:
      child = const DeliverySchedulerPicker();
      break;
    //Card
    case Routes.addCardScreen:
      child = AddCardScreen();
      break;
    case Routes.editProfileScreen:
      child = const EditProfilePage();
      break;

    default:
      throw Exception('Invalid route: ${settings.name}');
  }

  return PageTransition(
    child: child,
    type: PageTransitionType.fade,
    settings: settings,
    duration: transissionDuration,
    reverseDuration: transissionDuration,
  );
}
