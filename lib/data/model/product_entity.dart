class ProductEntity {

  static const String tableName = "Product";
  static const String columCode = "code";
  static const String columnName = "name";
  static const String columnDescription = "description";

  final String code;
  final String name;
  final String description;

  ProductEntity({
    required this.code,
    required this.name,
    required this.description,
  });

  Map<String, Object?> toMap() {
    return {
      columCode: code,
      columnName: name,
      columnDescription: description,
    };
  }

  factory ProductEntity.fromMap(Map<dynamic, dynamic> map) {
    return ProductEntity(
      code: map[columCode] as String,
      name: map[columnName] as String,
      description: map[columnDescription] as String,
    );
  }
}
