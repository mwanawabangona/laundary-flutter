import 'dart:convert';

class Result {
  String? postcode;
  String? postcodeInward;
  String? postcodeOutward;
  String? postTown;
  String? dependantLocality;
  String? doubleDependantLocality;
  String? thoroughfare;
  String? dependantThoroughfare;
  String? buildingNumber;
  String? buildingName;
  String? subBuildingName;
  String? poBox;
  String? departmentName;
  String? organisationName;
  int? udprn;
  String? umprn;
  String? postcodeType;
  String? suOrganisationIndicator;
  String? deliveryPointSuffix;
  String? line1;
  String? line2;
  String? line3;
  String? premise;
  double? longitude;
  double? latitude;
  int? eastings;
  int? northings;
  String? country;
  String? traditionalCounty;
  String? administrativeCounty;
  String? postalCounty;
  String? county;
  String? district;
  String? ward;
  String? uprn;
  String? dataset;
  String? id;
  String? countryIso;

  Result({
    this.postcode,
    this.postcodeInward,
    this.postcodeOutward,
    this.postTown,
    this.dependantLocality,
    this.doubleDependantLocality,
    this.thoroughfare,
    this.dependantThoroughfare,
    this.buildingNumber,
    this.buildingName,
    this.subBuildingName,
    this.poBox,
    this.departmentName,
    this.organisationName,
    this.udprn,
    this.umprn,
    this.postcodeType,
    this.suOrganisationIndicator,
    this.deliveryPointSuffix,
    this.line1,
    this.line2,
    this.line3,
    this.premise,
    this.longitude,
    this.latitude,
    this.eastings,
    this.northings,
    this.country,
    this.traditionalCounty,
    this.administrativeCounty,
    this.postalCounty,
    this.county,
    this.district,
    this.ward,
    this.uprn,
    this.dataset,
    this.id,
    this.countryIso,
  });

  factory Result.fromMap(Map<String, dynamic> data) => Result(
        postcode: data['postcode'] as String?,
        postcodeInward: data['postcode_inward'] as String?,
        postcodeOutward: data['postcode_outward'] as String?,
        postTown: data['post_town'] as String?,
        dependantLocality: data['dependant_locality'] as String?,
        doubleDependantLocality: data['double_dependant_locality'] as String?,
        thoroughfare: data['thoroughfare'] as String?,
        dependantThoroughfare: data['dependant_thoroughfare'] as String?,
        buildingNumber: data['building_number'] as String?,
        buildingName: data['building_name'] as String?,
        subBuildingName: data['sub_building_name'] as String?,
        poBox: data['po_box'] as String?,
        departmentName: data['department_name'] as String?,
        organisationName: data['organisation_name'] as String?,
        udprn: data['udprn'] as int?,
        umprn: data['umprn'] as String?,
        postcodeType: data['postcode_type'] as String?,
        suOrganisationIndicator: data['su_organisation_indicator'] as String?,
        deliveryPointSuffix: data['delivery_point_suffix'] as String?,
        line1: data['line_1'] as String?,
        line2: data['line_2'] as String?,
        line3: data['line_3'] as String?,
        premise: data['premise'] as String?,
        longitude: (data['longitude'] as num?)?.toDouble(),
        latitude: (data['latitude'] as num?)?.toDouble(),
        eastings: data['eastings'] as int?,
        northings: data['northings'] as int?,
        country: data['country'] as String?,
        traditionalCounty: data['traditional_county'] as String?,
        administrativeCounty: data['administrative_county'] as String?,
        postalCounty: data['postal_county'] as String?,
        county: data['county'] as String?,
        district: data['district'] as String?,
        ward: data['ward'] as String?,
        uprn: data['uprn'] as String?,
        dataset: data['dataset'] as String?,
        id: data['id'] as String?,
        countryIso: data['country_iso'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'postcode': postcode,
        'postcode_inward': postcodeInward,
        'postcode_outward': postcodeOutward,
        'post_town': postTown,
        'dependant_locality': dependantLocality,
        'double_dependant_locality': doubleDependantLocality,
        'thoroughfare': thoroughfare,
        'dependant_thoroughfare': dependantThoroughfare,
        'building_number': buildingNumber,
        'building_name': buildingName,
        'sub_building_name': subBuildingName,
        'po_box': poBox,
        'department_name': departmentName,
        'organisation_name': organisationName,
        'udprn': udprn,
        'umprn': umprn,
        'postcode_type': postcodeType,
        'su_organisation_indicator': suOrganisationIndicator,
        'delivery_point_suffix': deliveryPointSuffix,
        'line_1': line1,
        'line_2': line2,
        'line_3': line3,
        'premise': premise,
        'longitude': longitude,
        'latitude': latitude,
        'eastings': eastings,
        'northings': northings,
        'country': country,
        'traditional_county': traditionalCounty,
        'administrative_county': administrativeCounty,
        'postal_county': postalCounty,
        'county': county,
        'district': district,
        'ward': ward,
        'uprn': uprn,
        'dataset': dataset,
        'id': id,
        'country_iso': countryIso,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Result].
  factory Result.fromJson(String data) {
    return Result.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Result] to a JSON string.
  String toJson() => json.encode(toMap());

  Result copyWith({
    String? postcode,
    String? postcodeInward,
    String? postcodeOutward,
    String? postTown,
    String? dependantLocality,
    String? doubleDependantLocality,
    String? thoroughfare,
    String? dependantThoroughfare,
    String? buildingNumber,
    String? buildingName,
    String? subBuildingName,
    String? poBox,
    String? departmentName,
    String? organisationName,
    int? udprn,
    String? umprn,
    String? postcodeType,
    String? suOrganisationIndicator,
    String? deliveryPointSuffix,
    String? line1,
    String? line2,
    String? line3,
    String? premise,
    double? longitude,
    double? latitude,
    int? eastings,
    int? northings,
    String? country,
    String? traditionalCounty,
    String? administrativeCounty,
    String? postalCounty,
    String? county,
    String? district,
    String? ward,
    String? uprn,
    String? dataset,
    String? id,
    String? countryIso,
  }) {
    return Result(
      postcode: postcode ?? this.postcode,
      postcodeInward: postcodeInward ?? this.postcodeInward,
      postcodeOutward: postcodeOutward ?? this.postcodeOutward,
      postTown: postTown ?? this.postTown,
      dependantLocality: dependantLocality ?? this.dependantLocality,
      doubleDependantLocality:
          doubleDependantLocality ?? this.doubleDependantLocality,
      thoroughfare: thoroughfare ?? this.thoroughfare,
      dependantThoroughfare:
          dependantThoroughfare ?? this.dependantThoroughfare,
      buildingNumber: buildingNumber ?? this.buildingNumber,
      buildingName: buildingName ?? this.buildingName,
      subBuildingName: subBuildingName ?? this.subBuildingName,
      poBox: poBox ?? this.poBox,
      departmentName: departmentName ?? this.departmentName,
      organisationName: organisationName ?? this.organisationName,
      udprn: udprn ?? this.udprn,
      umprn: umprn ?? this.umprn,
      postcodeType: postcodeType ?? this.postcodeType,
      suOrganisationIndicator:
          suOrganisationIndicator ?? this.suOrganisationIndicator,
      deliveryPointSuffix: deliveryPointSuffix ?? this.deliveryPointSuffix,
      line1: line1 ?? this.line1,
      line2: line2 ?? this.line2,
      line3: line3 ?? this.line3,
      premise: premise ?? this.premise,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      eastings: eastings ?? this.eastings,
      northings: northings ?? this.northings,
      country: country ?? this.country,
      traditionalCounty: traditionalCounty ?? this.traditionalCounty,
      administrativeCounty: administrativeCounty ?? this.administrativeCounty,
      postalCounty: postalCounty ?? this.postalCounty,
      county: county ?? this.county,
      district: district ?? this.district,
      ward: ward ?? this.ward,
      uprn: uprn ?? this.uprn,
      dataset: dataset ?? this.dataset,
      id: id ?? this.id,
      countryIso: countryIso ?? this.countryIso,
    );
  }
}
