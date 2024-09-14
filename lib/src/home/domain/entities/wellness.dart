import 'package:equatable/equatable.dart';

class Wellness extends Equatable {
  const Wellness({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    this.discount,
    required this.stock,
    required this.minimumPurchase,
    required this.maximumPurchase,
    required this.description,
    this.termAndCondition,
    this.outlet,
  });

  Wellness.empty({String? id})
      : id = id ?? "1",
        title = 'Wellness',
        category = 'Health',
        price = 100000,
        discount = 0,
        stock = 10,
        minimumPurchase = 1,
        maximumPurchase = 5,
        description = 'Wellness product',
        termAndCondition = ['Term and Condition'],
        outlet = ['Outlet'];

  final String id;
  final String title;
  final String category;
  final double price;
  final double? discount;
  final int stock;
  final int minimumPurchase;
  final int maximumPurchase;
  final String description;
  final List<String>? termAndCondition;
  final List<String>? outlet;

  @override
  List<Object?> get props => [
        id,
        title,
        category,
        price,
        discount,
        stock,
        minimumPurchase,
        maximumPurchase,
        description,
        termAndCondition,
        outlet,
      ];

  @override
  String toString() {
    return 'Item{id: $id, title: $title, category: $category, '
        'price: $price, discount: $discount, stock: $stock, '
        'minimumPurchase: $minimumPurchase, maximumPurchase: $maximumPurchase, '
        'description: $description, termAndCondition: $termAndCondition, '
        'outlet: $outlet}';
  }
}
