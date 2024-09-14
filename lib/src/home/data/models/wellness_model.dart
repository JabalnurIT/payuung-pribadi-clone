import '../../../../core/utils/typedef.dart';
import '../../domain/entities/wellness.dart';

// Wellness.empty({String? id})
//     : id = id ?? "1",
//       title = 'Wellness',
//       category = 'Health',
//       price = 100000,
//       discount = 0,
//       stock = 10,
//       minimumPurchase = 1,
//       maximumPurchase = 5,
//       description = 'Wellness product',
//       termAndCondition = ['Term and Condition'],
//       outlet = ['Outlet'];

// final String id;
// final String title;
// final String category;
// final double price;
// final double? discount;
// final int stock;
// final int minimumPurchase;
// final int maximumPurchase;
// final String description;
// final List<String>? termAndCondition;
// final List<String>? outlet;

class WellnessModel extends Wellness {
  const WellnessModel({
    required super.id,
    required super.title,
    required super.category,
    required super.price,
    super.discount,
    required super.stock,
    required super.minimumPurchase,
    required super.maximumPurchase,
    required super.description,
    super.termAndCondition,
    super.outlet,
  });

  WellnessModel.empty({String? id})
      : this(
          id: id ?? '1',
          title: 'Wellness',
          category: 'Health',
          price: 100000,
          discount: 0,
          stock: 10,
          minimumPurchase: 1,
          maximumPurchase: 5,
          description: 'Wellness product',
          termAndCondition: ['Term and Condition'],
          outlet: ['Outlet'],
        );

  WellnessModel copyWith({
    String? id,
    String? title,
    String? category,
    double? price,
    double? discount,
    int? stock,
    int? minimumPurchase,
    int? maximumPurchase,
    String? description,
    List<String>? termAndCondition,
    List<String>? outlet,
  }) {
    return WellnessModel(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      stock: stock ?? this.stock,
      minimumPurchase: minimumPurchase ?? this.minimumPurchase,
      maximumPurchase: maximumPurchase ?? this.maximumPurchase,
      description: description ?? this.description,
      termAndCondition: termAndCondition ?? this.termAndCondition,
      outlet: outlet ?? this.outlet,
    );
  }

  WellnessModel.fromMap(DataMap map)
      : super(
          id: map['id'] as String,
          title: map['title'] as String,
          category: map['category'] as String,
          price: map['price'].runtimeType == double
              ? map['price'] as double
              : map['price'].toDouble() as double,
          discount: map['discount'].runtimeType == double
              ? map['discount'] as double?
              : map['discount'].toDouble() as double?,
          stock: map['stock'] as int,
          minimumPurchase: map['minimumPurchase'] as int,
          maximumPurchase: map['maximumPurchase'] as int,
          description: map['description'] as String,
          termAndCondition: (map['termAndCondition'] as List?) == null
              ? null
              : (map['termAndCondition'] as List)
                  .map((e) => e as String)
                  .toList(),
          outlet: (map['outlet'] as List?) == null
              ? null
              : (map['outlet'] as List).map((e) => e as String).toList(),
        );

  WellnessModel.fromEntity(Wellness address)
      : super(
          id: address.id,
          title: address.title,
          category: address.category,
          price: address.price,
          discount: address.discount,
          stock: address.stock,
          minimumPurchase: address.minimumPurchase,
          maximumPurchase: address.maximumPurchase,
          description: address.description,
          termAndCondition: address.termAndCondition,
          outlet: address.outlet,
        );

  DataMap toMap() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'price': price,
      'discount': discount,
      'stock': stock,
      'minimumPurchase': minimumPurchase,
      'maximumPurchase': maximumPurchase,
      'description': description,
      'termAndCondition': termAndCondition,
      'outlet': outlet,
    };
  }
}
