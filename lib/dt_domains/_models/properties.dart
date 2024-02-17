part of '_index.dart';

class Properties {
  final String name;
  final String description;
  Properties({
    this.name = '',
    this.description = '',
  });

  Properties copyWith({
    String? name,
    String? description,
  }) {
    return Properties(
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'description': description});

    return result;
  }

  factory Properties.fromMap(Map<String, dynamic> map) {
    return Properties(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Properties.fromJson(String source) => Properties.fromMap(json.decode(source));

  @override
  String toString() => 'Properties(name: $name, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Properties && other.name == name && other.description == description;
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode;
}
