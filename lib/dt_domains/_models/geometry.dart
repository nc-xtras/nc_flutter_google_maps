part of '_index.dart';

class Geometry {
  final String type;
  // final List<List<List<List<double>>>> coordinates;
  final List<dynamic> coordinates;
  Geometry({
    this.type = '',
    this.coordinates = const [],
  });

  Geometry copyWith({
    String? type,
    List<dynamic>? coordinates,
  }) {
    return Geometry(
      type: type ?? this.type,
      coordinates: coordinates ?? this.coordinates,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'type': type});
    result.addAll({'coordinates': coordinates});

    return result;
  }

  factory Geometry.fromMap(Map<String, dynamic> map) {
    return Geometry(
      type: map['type'] ?? '',
      coordinates: List<dynamic>.from(map['coordinates'] ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory Geometry.fromJson(String source) => Geometry.fromMap(json.decode(source));

  @override
  String toString() => 'Geometry(type: $type, coordinates: $coordinates)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Geometry && other.type == type && listEquals(other.coordinates, coordinates);
  }

  @override
  int get hashCode => type.hashCode ^ coordinates.hashCode;
}
