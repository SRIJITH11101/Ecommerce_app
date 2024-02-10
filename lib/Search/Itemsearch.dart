import 'dart:async';
import 'dart:convert';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ondc/Search/Item.dart';
import 'package:ondc/Search/Item_api.dart';
import 'package:ondc/Search/SearchWidget.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:ondc/Product.dart';

class Itemsearch extends StatefulWidget {
  final bool showFloatingButton;
  final int cat;
  const Itemsearch(
      {Key? key, required this.showFloatingButton, required this.cat})
      : super(key: key);

  @override
  State<Itemsearch> createState() => _ItemsearchState();
}

class _ItemsearchState extends State<Itemsearch> {
  SpeechToText StoT = SpeechToText();
  var isListening = false;
  //late int cat ;
  List<Item> items = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final items = await ItemApi.getBooks(query, widget.cat);

    setState(() => this.items = items);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("ONDC Item Search"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];

                  return buildBook(item);
                },
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: widget.showFloatingButton
            ? AvatarGlow(
                animate: isListening,
                duration: Duration(seconds: 2),
                repeat: true,
                child: GestureDetector(
                  onTapDown: (details) async {
                    if (!isListening) {
                      var available = await StoT.initialize();
                      if (available) {
                        setState(() {
                          isListening = true;
                          StoT.listen(
                            onResult: (result) {
                              setState(() {
                                query = result.recognizedWords;
                                searchItem(query);
                                print(query);
                              });
                            },
                          );
                        });
                      }
                    }
                  },
                  onTapUp: (details) {
                    setState(() {
                      isListening = false;
                    });
                    StoT.stop();
                  },
                  child: CircleAvatar(
                    radius: 40,
                    child: Icon(Icons.mic, size: 35),
                  ),
                ),
              )
            : null,
      );

  Widget buildSearch() => SearchWidget(
        text: query, // Populate search bar with query
        hintText: 'Item name',
        onChanged: (value) {
          setState(() {
            query = value;
          });
          searchItem(value);
        },
      );

  Future searchItem(String query) async => debounce(() async {
        final items = await ItemApi.getBooks(query, widget.cat);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.items = items;
        });
      });

  Widget buildBook(Item item) {
    IconData iconData;
    switch (item.category) {
      case 'Smartphones':
        iconData = Icons.phone_android_sharp;
        break;
      case 'Laptops':
        iconData = Icons.laptop_sharp;
        break;
      case 'Smartwatches':
        iconData = Icons.watch_sharp;
        break;
      default:
        iconData = Icons.category;
        break;
    }

    return ElevatedButton (
      onPressed:(){
        print("hello");
        //print(name secription brand price and category
        //)
        print(item.category);
         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Productpage(
                              name:item.name,
                              desc:item.description,
                              brand:item.brand,
                              price:item.price,
                              category:item.category,
                              
                            ),
                          ),
                        );
      },
      child:ListTile(
      
      leading: Icon(iconData, size: 40),
      title: Text(item.name),
      subtitle: Text(item.brand),
    ),
    );
  }
}
