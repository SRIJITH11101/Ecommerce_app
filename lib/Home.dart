import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ondc/Search/Itemsearch.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ONDC",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                  ),
                  Text(
                    "Welcomes you..",
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  )
                ],
              ),
              SizedBox(
                width: 100,
              ),
              Expanded(
                child: Image(
                  image: AssetImage('assets/images/profile1.png'),
                ),
              ),
            ],
          ),
          toolbarHeight: 150,
          //backgroundColor: Color.fromARGB(179, 176, 176, 176),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextButton(
                style: ButtonStyle(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Itemsearch(
                        showFloatingButton: false,
                        cat: 0,
                      ),
                    ),
                  );
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                    child: Text("Search..",
                        style: TextStyle(fontSize: 16, color: Colors.black54)),
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFEAD1FF),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: <Widget>[
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Itemsearch(
                                    showFloatingButton: true,
                                    cat: 1,
                                  ),
                                ),
                              );
                            },
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0)),
                            child: Container(
                              height: 70,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF9772F),
                                  borderRadius:
                                      BorderRadiusDirectional.circular(17)),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex:1,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/phone.png")),
                                  ),
                                  Expanded(
                                    flex:2,
                                    child: Text("Smartphones",style:TextStyle(color:Colors.white)))
                                ],
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Itemsearch(
                                    showFloatingButton: true,
                                    cat: 2,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 70,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Color(0xFFB6FF7C),
                                  borderRadius:
                                      BorderRadiusDirectional.circular(17)),
                              child: Row(
                                children: <Widget>[
                                  //Image(image: AssetImage("")),
                                  Text("Laptops")
                                ],
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Itemsearch(
                                    showFloatingButton: true,
                                    cat: 3,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 70,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF95689),
                                  borderRadius:
                                      BorderRadiusDirectional.circular(17)),
                              child: Row(
                                children: <Widget>[
                                  // Image(image: AssetImage("")),
                                  Text("Smartwatches")
                                ],
                              ),
                            ),
                          ),
                          // TextButton(
                          //   onPressed: () {},
                          //   child: Container(
                          //     height: 70,
                          //     width: 150,
                          //     decoration: BoxDecoration(
                          //         color: Color(0xFF13D4FF),
                          //         borderRadius:
                          //             BorderRadiusDirectional.circular(17)),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    //SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Itemsearch(
                              showFloatingButton: true,
                              cat: 0,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 150,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Color(0xFFEAD1FF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: <Widget>[
                            // Expanded(
                            //   child: Image(
                            //       image: AssetImage('assets/images/spnbtn.png')),
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Icon(
                                Icons.mic_sharp,
                                size: 95,
                                color: Color(0xFFBC68FF),
                              ),
                            ),
                            Text(
                              "Start shopping",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //SizedBox(height: 5),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(15),
                            color: Colors.grey),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            width: 85
                            ,
                            height: 120,
                            child:Column(
                              mainAxisAlignment:MainAxisAlignment.end,
                              children:[
                                Text("ORDERS",style:TextStyle(color:Colors.black)),
                                SizedBox(
                                  height:5
                                ),
                              ]
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(15),
                              color: Colors.greenAccent,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            width: 85,
                            height: 120,
                            child:Column(
                              mainAxisAlignment:MainAxisAlignment.end,
                              children:[
                                
                                Text("TRACK",style:TextStyle(color:Colors.black)),
                                SizedBox(
                                  height:5
                                ),
                              ]
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(15),
                              color: Colors.greenAccent,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            width: 85,
                            height: 120,
                            child:Column(
                              mainAxisAlignment:MainAxisAlignment.end,
                              children:[
                                Text("ACCOUNT",style:TextStyle(color:Colors.black)),
                                SizedBox(
                                  height:5
                                ),
                              ]
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(15),
                              color: Colors.greenAccent,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
