part of '_index.dart';

class PegatBatumbuk {
  final String type;
  final Properties properties;
  final Geometry geometry;
  PegatBatumbuk({
    this.type = '',
    required this.properties,
    required this.geometry,
  });

  PegatBatumbuk copyWith({
    String? type,
    Properties? properties,
    Geometry? geometry,
  }) {
    return PegatBatumbuk(
      type: type ?? this.type,
      properties: properties ?? this.properties,
      geometry: geometry ?? this.geometry,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'type': type});
    result.addAll({'properties': properties.toMap()});
    result.addAll({'geometry': geometry.toMap()});

    return result;
  }

  factory PegatBatumbuk.fromMap(Map<String, dynamic> map) {
    return PegatBatumbuk(
      type: map['type'] ?? '',
      properties: Properties.fromMap(map['properties']),
      geometry: Geometry.fromMap(map['geometry']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PegatBatumbuk.fromJson(String source) => PegatBatumbuk.fromMap(json.decode(source));

  @override
  String toString() => 'PegatBatumbuk(type: $type, properties: $properties, geometry: $geometry)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PegatBatumbuk && other.type == type && other.properties == properties && other.geometry == geometry;
  }

  @override
  int get hashCode => type.hashCode ^ properties.hashCode ^ geometry.hashCode;
}
