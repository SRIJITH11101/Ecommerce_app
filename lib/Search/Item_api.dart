import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:ondc/Search/Item.dart';

class ItemApi {
  static Future<List<Item>> getBooks(String query, int cat) async {
    //final List<Item> ritems;
    final jsonString = await rootBundle.loadString('assets/products.json');
    final List<dynamic> jsonList = json.decode(jsonString);

    List<Item> items = jsonList.map((json) => Item.fromJson(json)).toList();

    if (query.isNotEmpty) {
      return items
          .where(
              (item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      if (cat == 1) {
        return items
            .where((item) => item.category.contains("Smartphones"))
            .toList();
      } else if (cat == 2) {
        return items
            .where((item) => item.category.contains("Laptops"))
            .toList();
      } else if (cat == 3) {
        return items
            .where((item) => item.category.contains("Smartwatches"))
            .toList();
      } else {
        return items;
      }
    }
  }
}
