// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Let's Get Started`
  String get letsGetStarted {
    return Intl.message(
      'Let`s Get Started',
      name: 'letsGetStarted',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get myCart {
    return Intl.message(
      'My Cart',
      name: 'myCart',
      desc: '',
      args: [],
    );
  }

  /// `Coupon Code`
  String get couponCode {
    return Intl.message(
      'Coupon Code',
      name: 'couponCode',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Remove Coupon`
  String get removeCoupon {
    return Intl.message(
      'Remove Coupon',
      name: 'removeCoupon',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an Account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an Account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `You Need to Accept Terms And Conditions`
  String get acceptTermsAndConditions {
    return Intl.message(
      'You Need to Accept Terms And Conditions',
      name: 'acceptTermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Create password`
  String get createPassword {
    return Intl.message(
      'Create password',
      name: 'createPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `I accept and agree to the`
  String get iAcceptAndAgreeToThe {
    return Intl.message(
      'I accept and agree to the',
      name: 'iAcceptAndAgreeToThe',
      desc: '',
      args: [],
    );
  }

  /// `Terms  & Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms  & Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Okay`
  String get okay {
    return Intl.message(
      'Okay',
      name: 'okay',
      desc: '',
      args: [],
    );
  }

  /// `And`
  String get and {
    return Intl.message(
      'And',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Already have an Account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an Account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `You are not signed in!\nPlease sign in first.`
  String get yourntsignedin {
    return Intl.message(
      'You are not signed in!\nPlease sign in first.',
      name: 'yourntsignedin',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myorder {
    return Intl.message(
      'My Orders',
      name: 'myorder',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Please Login`
  String get plslgin {
    return Intl.message(
      'Please Login',
      name: 'plslgin',
      desc: '',
      args: [],
    );
  }

  /// `Service Categories`
  String get srvctgrs {
    return Intl.message(
      'Service Categories',
      name: 'srvctgrs',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get ntfctns {
    return Intl.message(
      'Notifications',
      name: 'ntfctns',
      desc: '',
      args: [],
    );
  }

  /// `Your notification is Empty.`
  String get nontfctn {
    return Intl.message(
      'Your notification is Empty.',
      name: 'nontfctn',
      desc: '',
      args: [],
    );
  }

  /// `Login Now`
  String get lginnow {
    return Intl.message(
      'Login Now',
      name: 'lginnow',
      desc: '',
      args: [],
    );
  }

  /// `Manage Address`
  String get mngaddrs {
    return Intl.message(
      'Manage Address',
      name: 'mngaddrs',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get prvcyplcy {
    return Intl.message(
      'Privacy Policy',
      name: 'prvcyplcy',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get trmsofsrvc {
    return Intl.message(
      'Terms of Service',
      name: 'trmsofsrvc',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get cntctus {
    return Intl.message(
      'Contact us',
      name: 'cntctus',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get abt {
    return Intl.message(
      'About',
      name: 'abt',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get lgout {
    return Intl.message(
      'Log Out',
      name: 'lgout',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edt {
    return Intl.message(
      'Edit',
      name: 'edt',
      desc: '',
      args: [],
    );
  }

  /// `No Item In Cart`
  String get noitmcrt {
    return Intl.message(
      'No Item In Cart',
      name: 'noitmcrt',
      desc: '',
      args: [],
    );
  }

  /// `No Service Available`
  String get nosrvcavlbl {
    return Intl.message(
      'No Service Available',
      name: 'nosrvcavlbl',
      desc: '',
      args: [],
    );
  }

  /// `No Order Found`
  String get noordrfnd {
    return Intl.message(
      'No Order Found',
      name: 'noordrfnd',
      desc: '',
      args: [],
    );
  }

  /// `Active Order`
  String get actvordr {
    return Intl.message(
      'Active Order',
      name: 'actvordr',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get vewall {
    return Intl.message(
      'View All',
      name: 'vewall',
      desc: '',
      args: [],
    );
  }

  /// `Order ID`
  String get ordrid {
    return Intl.message(
      'Order ID',
      name: 'ordrid',
      desc: '',
      args: [],
    );
  }

  /// `Pick Up At`
  String get pickupat {
    return Intl.message(
      'Pick Up At',
      name: 'pickupat',
      desc: '',
      args: [],
    );
  }

  /// `Delivery At`
  String get dlvryat {
    return Intl.message(
      'Delivery At',
      name: 'dlvryat',
      desc: '',
      args: [],
    );
  }

  /// `Order Status`
  String get ordrstats {
    return Intl.message(
      'Order Status',
      name: 'ordrstats',
      desc: '',
      args: [],
    );
  }

  /// `Payment Status`
  String get pymntstats {
    return Intl.message(
      'Payment Status',
      name: 'pymntstats',
      desc: '',
      args: [],
    );
  }

  /// `Sub total`
  String get sbttl {
    return Intl.message(
      'Sub total',
      name: 'sbttl',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Charge`
  String get dlvrychrg {
    return Intl.message(
      'Delivery Charge',
      name: 'dlvrychrg',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get dscnt {
    return Intl.message(
      'Discount',
      name: 'dscnt',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get ttl {
    return Intl.message(
      'Total',
      name: 'ttl',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get dlvrd {
    return Intl.message(
      'Delivered',
      name: 'dlvrd',
      desc: '',
      args: [],
    );
  }

  /// `Rate Your Experience`
  String get rateurexprnc {
    return Intl.message(
      'Rate Your Experience',
      name: 'rateurexprnc',
      desc: '',
      args: [],
    );
  }

  /// `No Order Found`
  String get noordrfound {
    return Intl.message(
      'No Order Found',
      name: 'noordrfound',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Option`
  String get dlvryoptn {
    return Intl.message(
      'Delivery Option',
      name: 'dlvryoptn',
      desc: '',
      args: [],
    );
  }

  /// `Payable Amount`
  String get pyblamnt {
    return Intl.message(
      'Payable Amount',
      name: 'pyblamnt',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `pickedYourOrder`
  String get pickedYourOrder {
    return Intl.message(
      'pickedYourOrder',
      name: 'pickedYourOrder',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure\nwant to Cancel this order?`
  String get surewnttocnclordr {
    return Intl.message(
      'Are you sure\nwant to Cancel this order?',
      name: 'surewnttocnclordr',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cncl {
    return Intl.message(
      'Cancel',
      name: 'cncl',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get cnfirm {
    return Intl.message(
      'Confirm',
      name: 'cnfirm',
      desc: '',
      args: [],
    );
  }

  /// `How was Ironing Service?`
  String get howwasironsrvc {
    return Intl.message(
      'How was Ironing Service?',
      name: 'howwasironsrvc',
      desc: '',
      args: [],
    );
  }

  /// `Your feedback will help us to improve the Iron Service Experience.`
  String get urfdbckwillhlp {
    return Intl.message(
      'Your feedback will help us to improve the Iron Service Experience.',
      name: 'urfdbckwillhlp',
      desc: '',
      args: [],
    );
  }

  /// `Add Address`
  String get addadrs {
    return Intl.message(
      'Add Address',
      name: 'addadrs',
      desc: '',
      args: [],
    );
  }

  /// `Update Address`
  String get updtadrs {
    return Intl.message(
      'Update Address',
      name: 'updtadrs',
      desc: '',
      args: [],
    );
  }

  /// `Address Name (Ex: Office/Home/etc)`
  String get adrsname {
    return Intl.message(
      'Address Name (Ex: Office/Home/etc)',
      name: 'adrsname',
      desc: '',
      args: [],
    );
  }

  /// `Area (Ex: Bashundhara)`
  String get areaex {
    return Intl.message(
      'Area (Ex: Bashundhara)',
      name: 'areaex',
      desc: '',
      args: [],
    );
  }

  /// `Flat`
  String get flat {
    return Intl.message(
      'Flat',
      name: 'flat',
      desc: '',
      args: [],
    );
  }

  /// `House NO#`
  String get houseno {
    return Intl.message(
      'House NO#',
      name: 'houseno',
      desc: '',
      args: [],
    );
  }

  /// `Post Code`
  String get postcode {
    return Intl.message(
      'Post Code',
      name: 'postcode',
      desc: '',
      args: [],
    );
  }

  /// `Address Line`
  String get adrsline {
    return Intl.message(
      'Address Line',
      name: 'adrsline',
      desc: '',
      args: [],
    );
  }

  /// `Address Line 2`
  String get adrsline_two {
    return Intl.message(
      'Address Line 2',
      name: 'adrsline_two',
      desc: '',
      args: [],
    );
  }

  /// `Add Address`
  String get adadres {
    return Intl.message(
      'Add Address',
      name: 'adadres',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get scs {
    return Intl.message(
      'Success',
      name: 'scs',
      desc: '',
      args: [],
    );
  }

  /// `Manage Addresses`
  String get mngadrs {
    return Intl.message(
      'Manage Addresses',
      name: 'mngadrs',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address`
  String get addnwadrs {
    return Intl.message(
      'Add New Address',
      name: 'addnwadrs',
      desc: '',
      args: [],
    );
  }

  /// `Minimum order Amount`
  String get mnmlamnt {
    return Intl.message(
      'Minimum order Amount',
      name: 'mnmlamnt',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get edtprfl {
    return Intl.message(
      'Edit Profile',
      name: 'edtprfl',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get frstnm {
    return Intl.message(
      'First Name',
      name: 'frstnm',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gndr {
    return Intl.message(
      'Gender',
      name: 'gndr',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Email Address(Optional)`
  String get rmladrs {
    return Intl.message(
      'Email Address(Optional)',
      name: 'rmladrs',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get mbl {
    return Intl.message(
      'Mobile',
      name: 'mbl',
      desc: '',
      args: [],
    );
  }

  /// `Alternative Phone (Optional)`
  String get altrntvphn {
    return Intl.message(
      'Alternative Phone (Optional)',
      name: 'altrntvphn',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get updtaprl {
    return Intl.message(
      'Update Profile',
      name: 'updtaprl',
      desc: '',
      args: [],
    );
  }

  /// `Order online or via our app`
  String get ordronlineviaapp {
    return Intl.message(
      'Order online or via our app',
      name: 'ordronlineviaapp',
      desc: '',
      args: [],
    );
  }

  /// `We Collect at a time that suits you and work our magic`
  String get wecvlclctattime {
    return Intl.message(
      'We Collect at a time that suits you and work our magic',
      name: 'wecvlclctattime',
      desc: '',
      args: [],
    );
  }

  /// `We return your clean clothes back to you`
  String get wertrnclnclothes {
    return Intl.message(
      'We return your clean clothes back to you',
      name: 'wertrnclnclothes',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Pick Up Schedule First`
  String get plsslctpckupschdl {
    return Intl.message(
      'Please Select Pick Up Schedule First',
      name: 'plsslctpckupschdl',
      desc: '',
      args: [],
    );
  }

  /// `No Slots Available`
  String get noslctavlbl {
    return Intl.message(
      'No Slots Available',
      name: 'noslctavlbl',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get abtus {
    return Intl.message(
      'About Us',
      name: 'abtus',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get cls {
    return Intl.message(
      'Close',
      name: 'cls',
      desc: '',
      args: [],
    );
  }

  /// `Message us on WhatsApp`
  String get msgonwhtsap {
    return Intl.message(
      'Message us on WhatsApp',
      name: 'msgonwhtsap',
      desc: '',
      args: [],
    );
  }

  /// `Check Out`
  String get chckout {
    return Intl.message(
      'Check Out',
      name: 'chckout',
      desc: '',
      args: [],
    );
  }

  /// `Minimum order Amount`
  String get mnmmordramnt {
    return Intl.message(
      'Minimum order Amount',
      name: 'mnmmordramnt',
      desc: '',
      args: [],
    );
  }

  /// `Schedule`
  String get schdl {
    return Intl.message(
      'Schedule',
      name: 'schdl',
      desc: '',
      args: [],
    );
  }

  /// `You Are About to Logout`
  String get urabttolgot {
    return Intl.message(
      'You Are About to Logout',
      name: 'urabttolgot',
      desc: '',
      args: [],
    );
  }

  /// `Are you Sure?`
  String get arusre {
    return Intl.message(
      'Are you Sure?',
      name: 'arusre',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get y {
    return Intl.message(
      'Yes',
      name: 'y',
      desc: '',
      args: [],
    );
  }

  /// `NO`
  String get no {
    return Intl.message(
      'NO',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Order now`
  String get ordrnow {
    return Intl.message(
      'Order now',
      name: 'ordrnow',
      desc: '',
      args: [],
    );
  }

  /// `Add Item`
  String get additm {
    return Intl.message(
      'Add Item',
      name: 'additm',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get mycrt {
    return Intl.message(
      'My Cart',
      name: 'mycrt',
      desc: '',
      args: [],
    );
  }

  /// `My Order`
  String get myordr {
    return Intl.message(
      'My Order',
      name: 'myordr',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get ntfctn {
    return Intl.message(
      'Notification',
      name: 'ntfctn',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get prfl {
    return Intl.message(
      'Profile',
      name: 'prfl',
      desc: '',
      args: [],
    );
  }

  /// `item`
  String get item {
    return Intl.message(
      'item',
      name: 'item',
      desc: '',
      args: [],
    );
  }

  /// `Shipping & Payment`
  String get shpngndpymnt {
    return Intl.message(
      'Shipping & Payment',
      name: 'shpngndpymnt',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Schedule`
  String get shpngschdl {
    return Intl.message(
      'Shipping Schedule',
      name: 'shpngschdl',
      desc: '',
      args: [],
    );
  }

  /// `Pick Up`
  String get pckup {
    return Intl.message(
      'Pick Up',
      name: 'pckup',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get dlvry {
    return Intl.message(
      'Delivery',
      name: 'dlvry',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get adrs {
    return Intl.message(
      'Address',
      name: 'adrs',
      desc: '',
      args: [],
    );
  }

  /// `Choose Address`
  String get chsadrs {
    return Intl.message(
      'Choose Address',
      name: 'chsadrs',
      desc: '',
      args: [],
    );
  }

  /// `Instruction`
  String get instrctn {
    return Intl.message(
      'Instruction',
      name: 'instrctn',
      desc: '',
      args: [],
    );
  }

  /// `Add Instruction(Optional)`
  String get adinstrctnop {
    return Intl.message(
      'Add Instruction(Optional)',
      name: 'adinstrctnop',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get pymntmthd {
    return Intl.message(
      'Payment Method',
      name: 'pymntmthd',
      desc: '',
      args: [],
    );
  }

  /// `Cash On Delivery`
  String get cshondlvry {
    return Intl.message(
      'Cash On Delivery',
      name: 'cshondlvry',
      desc: '',
      args: [],
    );
  }

  /// `Pay When Taking Delivery`
  String get pywhndlvry {
    return Intl.message(
      'Pay When Taking Delivery',
      name: 'pywhndlvry',
      desc: '',
      args: [],
    );
  }

  /// `Total Payable`
  String get ttlpybl {
    return Intl.message(
      'Total Payable',
      name: 'ttlpybl',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Order`
  String get pynw {
    return Intl.message(
      'Confirm Order',
      name: 'pynw',
      desc: '',
      args: [],
    );
  }

  /// `Please Select All Fields`
  String get plsslctalflds {
    return Intl.message(
      'Please Select All Fields',
      name: 'plsslctalflds',
      desc: '',
      args: [],
    );
  }

  /// `We are processing your Previous Request.\nPlease Wait`
  String get wrprcsngprvsdlvry {
    return Intl.message(
      'We are processing your Previous Request.\nPlease Wait',
      name: 'wrprcsngprvsdlvry',
      desc: '',
      args: [],
    );
  }

  /// `Order Placed`
  String get ordrplcd {
    return Intl.message(
      'Order Placed',
      name: 'ordrplcd',
      desc: '',
      args: [],
    );
  }

  /// `Unselected`
  String get unslctd {
    return Intl.message(
      'Unselected',
      name: 'unslctd',
      desc: '',
      args: [],
    );
  }

  /// `Your order has been Confirmed`
  String get urordrhsbncnfmrd {
    return Intl.message(
      'Your order has been Confirmed',
      name: 'urordrhsbncnfmrd',
      desc: '',
      args: [],
    );
  }

  /// `Your order has been`
  String get urordrhsbnplcd {
    return Intl.message(
      'Your order has been',
      name: 'urordrhsbnplcd',
      desc: '',
      args: [],
    );
  }

  /// `Confirmed`
  String get cnfrmd {
    return Intl.message(
      'Confirmed',
      name: 'cnfrmd',
      desc: '',
      args: [],
    );
  }

  /// `Placed, Please Make payment to Confirm it`
  String get plcdplsmkpymnttocnfrmit {
    return Intl.message(
      'Placed, Please Make payment to Confirm it',
      name: 'plcdplsmkpymnttocnfrmit',
      desc: '',
      args: [],
    );
  }

  /// `Your Order ID`
  String get urordrid {
    return Intl.message(
      'Your Order ID',
      name: 'urordrid',
      desc: '',
      args: [],
    );
  }

  /// `Go to Home`
  String get gotohome {
    return Intl.message(
      'Go to Home',
      name: 'gotohome',
      desc: '',
      args: [],
    );
  }

  /// `Make Payment`
  String get mkpymnt {
    return Intl.message(
      'Make Payment',
      name: 'mkpymnt',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get nointrntcnctn {
    return Intl.message(
      'No internet connection',
      name: 'nointrntcnctn',
      desc: '',
      args: [],
    );
  }

  /// `Order details`
  String get ordrdtls {
    return Intl.message(
      'Order details',
      name: 'ordrdtls',
      desc: '',
      args: [],
    );
  }

  /// `Items`
  String get itms {
    return Intl.message(
      'Items',
      name: 'itms',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Address`
  String get shpngadrs {
    return Intl.message(
      'Shipping Address',
      name: 'shpngadrs',
      desc: '',
      args: [],
    );
  }

  /// `Recover Password`
  String get rcvrpswrd {
    return Intl.message(
      'Recover Password',
      name: 'rcvrpswrd',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email or phone number to recover Password`
  String get entrpswrdorphn {
    return Intl.message(
      'Enter your email or phone number to recover Password',
      name: 'entrpswrdorphn',
      desc: '',
      args: [],
    );
  }

  /// `Send OTP`
  String get sndotp {
    return Intl.message(
      'Send OTP',
      name: 'sndotp',
      desc: '',
      args: [],
    );
  }

  /// `Enter OTP`
  String get entrotp {
    return Intl.message(
      'Enter OTP',
      name: 'entrotp',
      desc: '',
      args: [],
    );
  }

  /// `An 4 digit code has been sent to`
  String get ndgtotp {
    return Intl.message(
      'An 4 digit code has been sent to',
      name: 'ndgtotp',
      desc: '',
      args: [],
    );
  }

  /// `OTP will send within`
  String get otpwillbesnd {
    return Intl.message(
      'OTP will send within',
      name: 'otpwillbesnd',
      desc: '',
      args: [],
    );
  }

  /// `Resend OTP`
  String get rsndotp {
    return Intl.message(
      'Resend OTP',
      name: 'rsndotp',
      desc: '',
      args: [],
    );
  }

  /// `Verify OTP`
  String get vrfyotp {
    return Intl.message(
      'Verify OTP',
      name: 'vrfyotp',
      desc: '',
      args: [],
    );
  }

  /// `Create new password`
  String get crtnwpswrd {
    return Intl.message(
      'Create new password',
      name: 'crtnwpswrd',
      desc: '',
      args: [],
    );
  }

  /// `Create your new password`
  String get crturnwpswrd {
    return Intl.message(
      'Create your new password',
      name: 'crturnwpswrd',
      desc: '',
      args: [],
    );
  }

  /// `Password Again`
  String get pswrdagn {
    return Intl.message(
      'Password Again',
      name: 'pswrdagn',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get rstpswrd {
    return Intl.message(
      'Reset Password',
      name: 'rstpswrd',
      desc: '',
      args: [],
    );
  }

  /// `Upload a photo`
  String get upldaphto {
    return Intl.message(
      'Upload a photo',
      name: 'upldaphto',
      desc: '',
      args: [],
    );
  }

  /// `You can upload a JPG or PNG file as a user Profile photo`
  String get ucnupldajpgorpng {
    return Intl.message(
      'You can upload a JPG or PNG file as a user Profile photo',
      name: 'ucnupldajpgorpng',
      desc: '',
      args: [],
    );
  }

  /// `Crop Image`
  String get crpimg {
    return Intl.message(
      'Crop Image',
      name: 'crpimg',
      desc: '',
      args: [],
    );
  }

  /// `Upload a profile photo`
  String get upldaprflpht {
    return Intl.message(
      'Upload a profile photo',
      name: 'upldaprflpht',
      desc: '',
      args: [],
    );
  }

  /// `Please Select an Image`
  String get plslctanimg {
    return Intl.message(
      'Please Select an Image',
      name: 'plslctanimg',
      desc: '',
      args: [],
    );
  }

  /// `Skip, I will upload later`
  String get skipiwluldltr {
    return Intl.message(
      'Skip, I will upload later',
      name: 'skipiwluldltr',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations!`
  String get cngrts {
    return Intl.message(
      'Congratulations!',
      name: 'cngrts',
      desc: '',
      args: [],
    );
  }

  /// `You have successfully Signed up on`
  String get uhvscsflysgndupon {
    return Intl.message(
      'You have successfully Signed up on',
      name: 'uhvscsflysgndupon',
      desc: '',
      args: [],
    );
  }

  /// `Great`
  String get grt {
    return Intl.message(
      'Great',
      name: 'grt',
      desc: '',
      args: [],
    );
  }

  /// `service`
  String get srvc {
    return Intl.message(
      'service',
      name: 'srvc',
      desc: '',
      args: [],
    );
  }

  /// `Logged Out`
  String get lgdot {
    return Intl.message(
      'Logged Out',
      name: 'lgdot',
      desc: '',
      args: [],
    );
  }

  /// `Order Summary`
  String get odrdsmry {
    return Intl.message(
      'Order Summary',
      name: 'odrdsmry',
      desc: '',
      args: [],
    );
  }

  /// `Od`
  String get odrdsmry2 {
    return Intl.message(
      'Od',
      name: 'odrdsmry2',
      desc: '',
      args: [],
    );
  }

  /// `Pay Online With Your Card`
  String get payonlinewithcard {
    return Intl.message(
      'Pay Online With Your Card',
      name: 'payonlinewithcard',
      desc: '',
      args: [],
    );
  }

  /// `Select Variant`
  String get slctvarient {
    return Intl.message(
      'Select Variant',
      name: 'slctvarient',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Order Placed Successfully`
  String get ordrplcdscsfly {
    return Intl.message(
      'Order Placed Successfully',
      name: 'ordrplcdscsfly',
      desc: '',
      args: [],
    );
  }

  /// `Update Product`
  String get updateproduct {
    return Intl.message(
      'Update Product',
      name: 'updateproduct',
      desc: '',
      args: [],
    );
  }

  /// `Order update successful!`
  String get orderupdatesuccmes {
    return Intl.message(
      'Order update successful!',
      name: 'orderupdatesuccmes',
      desc: '',
      args: [],
    );
  }

  /// `Add More`
  String get addmore {
    return Intl.message(
      'Add More',
      name: 'addmore',
      desc: '',
      args: [],
    );
  }

  /// `Show More`
  String get showmore {
    return Intl.message(
      'Show More',
      name: 'showmore',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'bn'),
      Locale.fromSubtags(languageCode: 'tr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
