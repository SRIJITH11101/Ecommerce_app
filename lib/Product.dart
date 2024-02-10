import 'package:flutter/material.dart';
import 'Home.dart';

class Productpage extends StatefulWidget {
  final String name;
  final String desc;
  final String brand;
  final String price;
  final String category;

  Productpage({required this.name, required this.desc, required this.brand, required this.price,required this.category });

  @override
  State<Productpage> createState() => _ProductpageState(name: name, price: price, desc: desc, brand: brand, category: category);
}


class _ProductpageState extends State<Productpage> {
  late String name;
  late String desc;
  late String brand;
  late String price;
  late String category;

  _ProductpageState({required this.name, required this.desc, required this.brand, required this.price, required this.category});

  @override
  Widget build(BuildContext context) {
    return  
     Scaffold(
      
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (category == "Smartphones")
              Icon(Icons.phone_android_sharp,size:300),
            if (category == "Laptops")
              Icon(Icons.laptop,size:300),
            if(category == 'SmartWatches')
              Icon(Icons.watch_outlined,size:300),
            Text(name, style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold)),
            Text(price, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 45)),
            SizedBox(height: 15),
            Text("Description", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
            Text(desc, style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
              ),
              child: Text("Buy"),
            ),
          ],
        ),
      ),
    );
  }
}
