import 'package:hydra_sip/base/local_db/as_sqlite/base_sqlite_model.dart';

class CalcDm extends BaseSqliteModel {
  CalcDm({
    Height? height,
    Weight? weight,
    int? activity,
    int? climate,
  }) {
    _height = height;
    _weight = weight;
    _activity = activity;
    _climate = climate;
  }

  CalcDm.fromJson(dynamic json) {
    _height = json['height'] != null ? Height.fromJson(json['height']) : null;
    _weight = json['weight'] != null ? Weight.fromJson(json['weight']) : null;
    _activity = json['activity'];
    _climate = json['climate'];
  }

  Height? _height;
  Weight? _weight;
  int? _activity;
  int? _climate;

  CalcDm copyWith({
    Height? height,
    Weight? weight,
    int? activity,
    int? climate,
  }) =>
      CalcDm(
        height: height ?? _height,
        weight: weight ?? _weight,
        activity: activity ?? _activity,
        climate: climate ?? _climate,
      );

  Height? get height => _height;

  Weight? get weight => _weight;

  int? get activity => _activity;

  int? get climate => _climate;

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_height != null) {
      map['height'] = _height?.toJson();
    }
    if (_weight != null) {
      map['weight'] = _weight?.toJson();
    }
    map['activity'] = _activity;
    map['climate'] = _climate;
    return map;
  }
}

class Weight {
  Weight({
    String? kg,
    String? lbs,
    bool? innit,
  }) {
    _kg = kg;
    _lbs = lbs;
    _innit = innit;
  }

  Weight.fromJson(dynamic json) {
    _kg = json['kg'];
    _lbs = json['lbs'];
    _innit = json['innit'];
  }

  String? _kg;
  String? _lbs;
  bool? _innit;

  Weight copyWith({
    String? kg,
    String? lbs,
    bool? innit,
  }) =>
      Weight(
        kg: kg ?? _kg,
        lbs: lbs ?? _lbs,
        innit: innit ?? _innit,
      );

  String? get kg => _kg;

  String? get lbs => _lbs;

  bool? get innit => _innit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kg'] = _kg;
    map['lbs'] = _lbs;
    map['innit'] = _innit;
    return map;
  }
}

class Height {
  Height({
    String? cm,
    String? foot,
    String? inch,
    bool? murican,
  }) {
    _cm = cm;
    _foot = foot;
    _inch = inch;
    _murican = murican;
  }

  Height.fromJson(dynamic json) {
    _cm = json['cm'];
    _foot = json['foot'];
    _inch = json['inch'];
    _murican = json['murican'];
  }

  String? _cm;
  String? _foot;
  String? _inch;
  bool? _murican;

  Height copyWith({
    String? cm,
    String? foot,
    String? inch,
    bool? murican,
  }) =>
      Height(
        cm: cm ?? _cm,
        foot: foot ?? _foot,
        inch: inch ?? _inch,
        murican: murican ?? _murican,
      );

  String? get cm => _cm;

  String? get foot => _foot;

  String? get inch => _inch;

  bool? get murican => _murican;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cm'] = _cm;
    map['foot'] = _foot;
    map['inch'] = _inch;
    map['murican'] = _murican;
    return map;
  }
}
