import 'dart:convert';

class Outcome {
  String? networkStatus;
  dynamic reason;
  String? riskLevel;
  int? riskScore;
  String? sellerMessage;
  String? type;

  Outcome({
    this.networkStatus,
    this.reason,
    this.riskLevel,
    this.riskScore,
    this.sellerMessage,
    this.type,
  });

  factory Outcome.fromMap(Map<String, dynamic> data) => Outcome(
        networkStatus: data['network_status'] as String?,
        reason: data['reason'] as dynamic,
        riskLevel: data['risk_level'] as String?,
        riskScore: data['risk_score'] as int?,
        sellerMessage: data['seller_message'] as String?,
        type: data['type'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'network_status': networkStatus,
        'reason': reason,
        'risk_level': riskLevel,
        'risk_score': riskScore,
        'seller_message': sellerMessage,
        'type': type,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Outcome].
  factory Outcome.fromJson(String data) {
    return Outcome.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Outcome] to a JSON string.
  String toJson() => json.encode(toMap());
}
