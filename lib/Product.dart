import 'package:flutter/material.dart';

class Productpage extends StatefulWidget {
  final String name;
  final String desc;
  final String brand;
  final String price;
  final String category;

  Productpage({required this.name, required this.desc, required this.brand, required this.price, required this.category });

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

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 100,
          color: Colors.green,
          child: Center(
            child: Text(
              'Listening',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (category == "Smartphones")
                Icon(Icons.phone_android_sharp,size:300),
              if (category == "Laptops")
                Icon(Icons.laptop,size:300),
              if(category == 'SmartWatches')
                Icon(Icons.watch_outlined,size:300),
              Text(name, style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold)),
              Text("\$ ${price}", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 35,color:Colors.green)),
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          _showBottomSheet(context);
        },
        child: Icon(Icons.mic),
      ),
    );
  }
}
