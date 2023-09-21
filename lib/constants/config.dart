class AppConfig {
  AppConfig._();

  //Base Url For APP
  static const String baseUrl = 'http://adminlaundry.razinsoft.com/api';

  //Stripe Keys For App - Replace With Yours
  static const String secretKey =
      'abc';
  static const String publicKey =
      'abc';

  //One Signal
  static const String oneSignalAppID =
      '96fa9ec8-39bc-4395-9f3b-2c30fd9fdc3e'; // One Signal App ID

  static const String appName =
      'Laundry'; //Only For Showing Inside App. Doesn't Change Launher App Name

  //Contact US Config
  static const String ctAboutCompany =
      'RazinSoft, Dhaka, 1216'; //Company name And Address
  static const String ctWhatsApp =
      '+88017xxxxxxxx'; // whats app Number with Country Code
  static const String ctPhone = '+88017xxxxxxxx'; // Contact Phone Numbers
  static const String ctMail = 'razinsoftbd@gmail.com'; // Contact Mail
}
