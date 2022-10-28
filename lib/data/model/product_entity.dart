import 'package:objectbox/objectbox.dart';

@Entity()
class ProductEntity {
  @Id(assignable: true)
  int id = 0;
  @Index()
  final String code;
  final String name;
  final String description;

  ProductEntity({
    required this.code,
    required this.name,
    required this.description,
  });
}
