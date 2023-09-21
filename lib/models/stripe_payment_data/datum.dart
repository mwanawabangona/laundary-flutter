import 'dart:convert';

import 'package:dry_cleaners/models/stripe_payment_data/billing_details.dart';
import 'package:dry_cleaners/models/stripe_payment_data/outcome.dart';
import 'package:dry_cleaners/models/stripe_payment_data/payment_method_details.dart';
import 'package:dry_cleaners/models/stripe_payment_data/refunds.dart';

class Datum {
  String? id;
  String? object;
  int? amount;
  int? amountCaptured;
  int? amountRefunded;
  dynamic application;
  dynamic applicationFee;
  dynamic applicationFeeAmount;
  String? balanceTransaction;
  BillingDetails? billingDetails;
  String? calculatedStatementDescriptor;
  bool? captured;
  int? created;
  String? currency;
  dynamic customer;
  dynamic description;
  dynamic destination;
  dynamic dispute;
  bool? disputed;
  dynamic failureBalanceTransaction;
  dynamic failureCode;
  dynamic failureMessage;

  dynamic invoice;
  bool? livemode;
  dynamic onBehalfOf;
  dynamic order;
  Outcome? outcome;
  bool? paid;
  String? paymentIntent;
  String? paymentMethod;
  PaymentMethodDetails? paymentMethodDetails;
  dynamic receiptEmail;
  dynamic receiptNumber;
  String? receiptUrl;
  bool? refunded;
  Refunds? refunds;
  dynamic review;
  dynamic shipping;
  dynamic source;
  dynamic sourceTransfer;
  dynamic statementDescriptor;
  dynamic statementDescriptorSuffix;
  String? status;
  dynamic transferData;
  dynamic transferGroup;

  Datum({
    this.id,
    this.object,
    this.amount,
    this.amountCaptured,
    this.amountRefunded,
    this.application,
    this.applicationFee,
    this.applicationFeeAmount,
    this.balanceTransaction,
    this.billingDetails,
    this.calculatedStatementDescriptor,
    this.captured,
    this.created,
    this.currency,
    this.customer,
    this.description,
    this.destination,
    this.dispute,
    this.disputed,
    this.failureBalanceTransaction,
    this.failureCode,
    this.failureMessage,
    this.invoice,
    this.livemode,
    this.onBehalfOf,
    this.order,
    this.outcome,
    this.paid,
    this.paymentIntent,
    this.paymentMethod,
    this.paymentMethodDetails,
    this.receiptEmail,
    this.receiptNumber,
    this.receiptUrl,
    this.refunded,
    this.refunds,
    this.review,
    this.shipping,
    this.source,
    this.sourceTransfer,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    this.status,
    this.transferData,
    this.transferGroup,
  });

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        id: data['id'] as String?,
        object: data['object'] as String?,
        amount: data['amount'] as int?,
        amountCaptured: data['amount_captured'] as int?,
        amountRefunded: data['amount_refunded'] as int?,
        application: data['application'] as dynamic,
        applicationFee: data['application_fee'] as dynamic,
        applicationFeeAmount: data['application_fee_amount'] as dynamic,
        balanceTransaction: data['balance_transaction'] as String?,
        billingDetails: data['billing_details'] == null
            ? null
            : BillingDetails.fromMap(
                data['billing_details'] as Map<String, dynamic>,
              ),
        calculatedStatementDescriptor:
            data['calculated_statement_descriptor'] as String?,
        captured: data['captured'] as bool?,
        created: data['created'] as int?,
        currency: data['currency'] as String?,
        customer: data['customer'] as dynamic,
        description: data['description'] as dynamic,
        destination: data['destination'] as dynamic,
        dispute: data['dispute'] as dynamic,
        disputed: data['disputed'] as bool?,
        failureBalanceTransaction:
            data['failure_balance_transaction'] as dynamic,
        failureCode: data['failure_code'] as dynamic,
        failureMessage: data['failure_message'] as dynamic,
        invoice: data['invoice'] as dynamic,
        livemode: data['livemode'] as bool?,
        onBehalfOf: data['on_behalf_of'] as dynamic,
        order: data['order'] as dynamic,
        outcome: data['outcome'] == null
            ? null
            : Outcome.fromMap(data['outcome'] as Map<String, dynamic>),
        paid: data['paid'] as bool?,
        paymentIntent: data['payment_intent'] as String?,
        paymentMethod: data['payment_method'] as String?,
        paymentMethodDetails: data['payment_method_details'] == null
            ? null
            : PaymentMethodDetails.fromMap(
                data['payment_method_details'] as Map<String, dynamic>,
              ),
        receiptEmail: data['receipt_email'] as dynamic,
        receiptNumber: data['receipt_number'] as dynamic,
        receiptUrl: data['receipt_url'] as String?,
        refunded: data['refunded'] as bool?,
        refunds: data['refunds'] == null
            ? null
            : Refunds.fromMap(data['refunds'] as Map<String, dynamic>),
        review: data['review'] as dynamic,
        shipping: data['shipping'] as dynamic,
        source: data['source'] as dynamic,
        sourceTransfer: data['source_transfer'] as dynamic,
        statementDescriptor: data['statement_descriptor'] as dynamic,
        statementDescriptorSuffix:
            data['statement_descriptor_suffix'] as dynamic,
        status: data['status'] as String?,
        transferData: data['transfer_data'] as dynamic,
        transferGroup: data['transfer_group'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'object': object,
        'amount': amount,
        'amount_captured': amountCaptured,
        'amount_refunded': amountRefunded,
        'application': application,
        'application_fee': applicationFee,
        'application_fee_amount': applicationFeeAmount,
        'balance_transaction': balanceTransaction,
        'billing_details': billingDetails?.toMap(),
        'calculated_statement_descriptor': calculatedStatementDescriptor,
        'captured': captured,
        'created': created,
        'currency': currency,
        'customer': customer,
        'description': description,
        'destination': destination,
        'dispute': dispute,
        'disputed': disputed,
        'failure_balance_transaction': failureBalanceTransaction,
        'failure_code': failureCode,
        'failure_message': failureMessage,
        'invoice': invoice,
        'livemode': livemode,
        'on_behalf_of': onBehalfOf,
        'order': order,
        'outcome': outcome?.toMap(),
        'paid': paid,
        'payment_intent': paymentIntent,
        'payment_method': paymentMethod,
        'payment_method_details': paymentMethodDetails?.toMap(),
        'receipt_email': receiptEmail,
        'receipt_number': receiptNumber,
        'receipt_url': receiptUrl,
        'refunded': refunded,
        'refunds': refunds?.toMap(),
        'review': review,
        'shipping': shipping,
        'source': source,
        'source_transfer': sourceTransfer,
        'statement_descriptor': statementDescriptor,
        'statement_descriptor_suffix': statementDescriptorSuffix,
        'status': status,
        'transfer_data': transferData,
        'transfer_group': transferGroup,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());
}
