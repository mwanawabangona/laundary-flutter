import 'package:dry_cleaners/models/hive_cart_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculateTotal extends StateNotifier<double> {
  CalculateTotal() : super(0.00);
  void calculateTotal(
    List<CarItemHiveModel> cartItems,
  ) {
    double amount = 0;
    for (final element in cartItems) {
      if (element.subProduct != null) {
        amount += element.productsQTY *
            (element.unitPrice + element.subProduct!.price!);
      } else {
        amount += element.productsQTY * element.unitPrice;
      }
    }
    state = amount;
  }
}
