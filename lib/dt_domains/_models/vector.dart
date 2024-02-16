part of '_index.dart';

class Vector {
  final String id;
  final String latlngs;
  Vector({
    this.id = '',
    this.latlngs = '',
  });

  Vector copyWith({
    String? id,
    String? latlngs,
  }) {
    return Vector(
      id: id ?? this.id,
      latlngs: latlngs ?? this.latlngs,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'latlngs': latlngs});

    return result;
  }

  factory Vector.fromMap(Map<String, dynamic> map) {
    return Vector(
      id: map['id'] ?? '',
      latlngs: map['latlngs'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Vector.fromJson(String source) => Vector.fromMap(json.decode(source));

  @override
  String toString() => 'Vector(id: $id, latlngs: $latlngs)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Vector && other.id == id && other.latlngs == latlngs;
  }

  @override
  int get hashCode => id.hashCode ^ latlngs.hashCode;
}
