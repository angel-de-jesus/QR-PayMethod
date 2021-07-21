import 'package:flutter/material.dart';

class MyPay extends StatefulWidget {
  @override
  _PayMethod createState() => _PayMethod();
}

class _PayMethod extends State<MyPay> {
  int saldo = 1000;
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          actions: [],
          title: Text("Pay Method QR"),
        ),

        body: Column(
          children: [
            // Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            Text("\nSALDO:", textAlign: TextAlign.right, style: TextStyle(fontSize: 20),),
            Container(
              height: 200,
              width: 400,
              child:Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Text("$saldo", style: TextStyle(fontSize: 25),textAlign: TextAlign.center, ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              )
            ),
          ],
        ),
          
          
      ),
    );
  }
}