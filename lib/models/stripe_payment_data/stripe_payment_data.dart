import 'dart:convert';

import 'package:dry_cleaners/models/stripe_payment_data/charges.dart';
import 'package:dry_cleaners/models/stripe_payment_data/payment_method_options.dart';

class StripePaymentData {
  String? id;
  String? object;
  int? amount;
  int? amountCapturable;
  int? amountReceived;
  dynamic application;
  dynamic applicationFeeAmount;
  dynamic automaticPaymentMethods;
  dynamic canceledAt;
  dynamic cancellationReason;
  String? captureMethod;
  Charges? charges;
  String? clientSecret;
  String? confirmationMethod;
  int? created;
  String? currency;
  dynamic customer;
  dynamic description;
  dynamic invoice;
  dynamic lastPaymentError;
  bool? livemode;
  dynamic nextAction;
  dynamic onBehalfOf;
  String? paymentMethod;
  PaymentMethodOptions? paymentMethodOptions;

  dynamic processing;
  dynamic receiptEmail;
  dynamic review;
  dynamic setupFutureUsage;
  dynamic shipping;
  dynamic source;
  dynamic statementDescriptor;
  dynamic statementDescriptorSuffix;
  String? status;
  dynamic transferData;
  dynamic transferGroup;

  StripePaymentData({
    this.id,
    this.object,
    this.amount,
    this.amountCapturable,
    this.amountReceived,
    this.application,
    this.applicationFeeAmount,
    this.automaticPaymentMethods,
    this.canceledAt,
    this.cancellationReason,
    this.captureMethod,
    this.charges,
    this.clientSecret,
    this.confirmationMethod,
    this.created,
    this.currency,
    this.customer,
    this.description,
    this.invoice,
    this.lastPaymentError,
    this.livemode,
    this.nextAction,
    this.onBehalfOf,
    this.paymentMethod,
    this.paymentMethodOptions,
    this.processing,
    this.receiptEmail,
    this.review,
    this.setupFutureUsage,
    this.shipping,
    this.source,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    this.status,
    this.transferData,
    this.transferGroup,
  });

  factory StripePaymentData.fromMap(Map<String, dynamic> data) {
    return StripePaymentData(
      id: data['id'] as String?,
      object: data['object'] as String?,
      amount: data['amount'] as int?,
      amountCapturable: data['amount_capturable'] as int?,
      amountReceived: data['amount_received'] as int?,
      application: data['application'] as dynamic,
      applicationFeeAmount: data['application_fee_amount'] as dynamic,
      automaticPaymentMethods: data['automatic_payment_methods'] as dynamic,
      canceledAt: data['canceled_at'] as dynamic,
      cancellationReason: data['cancellation_reason'] as dynamic,
      captureMethod: data['capture_method'] as String?,
      charges: data['charges'] == null
          ? null
          : Charges.fromMap(data['charges'] as Map<String, dynamic>),
      clientSecret: data['client_secret'] as String?,
      confirmationMethod: data['confirmation_method'] as String?,
      created: data['created'] as int?,
      currency: data['currency'] as String?,
      customer: data['customer'] as dynamic,
      description: data['description'] as dynamic,
      invoice: data['invoice'] as dynamic,
      lastPaymentError: data['last_payment_error'] as dynamic,
      livemode: data['livemode'] as bool?,
      nextAction: data['next_action'] as dynamic,
      onBehalfOf: data['on_behalf_of'] as dynamic,
      paymentMethod: data['payment_method'] as String?,
      paymentMethodOptions: data['payment_method_options'] == null
          ? null
          : PaymentMethodOptions.fromMap(
              data['payment_method_options'] as Map<String, dynamic>,
            ),
      processing: data['processing'] as dynamic,
      receiptEmail: data['receipt_email'] as dynamic,
      review: data['review'] as dynamic,
      setupFutureUsage: data['setup_future_usage'] as dynamic,
      shipping: data['shipping'] as dynamic,
      source: data['source'] as dynamic,
      statementDescriptor: data['statement_descriptor'] as dynamic,
      statementDescriptorSuffix: data['statement_descriptor_suffix'] as dynamic,
      status: data['status'] as String?,
      transferData: data['transfer_data'] as dynamic,
      transferGroup: data['transfer_group'] as dynamic,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'object': object,
        'amount': amount,
        'amount_capturable': amountCapturable,
        'amount_received': amountReceived,
        'application': application,
        'application_fee_amount': applicationFeeAmount,
        'automatic_payment_methods': automaticPaymentMethods,
        'canceled_at': canceledAt,
        'cancellation_reason': cancellationReason,
        'capture_method': captureMethod,
        'charges': charges?.toMap(),
        'client_secret': clientSecret,
        'confirmation_method': confirmationMethod,
        'created': created,
        'currency': currency,
        'customer': customer,
        'description': description,
        'invoice': invoice,
        'last_payment_error': lastPaymentError,
        'livemode': livemode,
        'next_action': nextAction,
        'on_behalf_of': onBehalfOf,
        'payment_method': paymentMethod,
        'payment_method_options': paymentMethodOptions?.toMap(),
        'processing': processing,
        'receipt_email': receiptEmail,
        'review': review,
        'setup_future_usage': setupFutureUsage,
        'shipping': shipping,
        'source': source,
        'statement_descriptor': statementDescriptor,
        'statement_descriptor_suffix': statementDescriptorSuffix,
        'status': status,
        'transfer_data': transferData,
        'transfer_group': transferGroup,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StripePaymentData].
  factory StripePaymentData.fromJson(String data) {
    return StripePaymentData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [StripePaymentData] to a JSON string.
  String toJson() => json.encode(toMap());
}
