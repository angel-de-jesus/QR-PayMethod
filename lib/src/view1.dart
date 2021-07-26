import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class MyPay extends StatefulWidget {
  @override
  _PayMethod createState() => _PayMethod();
}

class _PayMethod extends State<MyPay> {
  int saldo = 10200;
  int valor = 0;
  String texto ="";

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
            Text("\nSALDO:", textAlign: TextAlign.right, style: TextStyle(fontSize: 20),),

            Container(
              height: 200,
              width: 400,

              child:Card(
                color: Colors.white,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Text("\n"'$saldo', style: TextStyle(fontSize: 45, color: Colors.black),textAlign: TextAlign.center, ),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),

                elevation: 5,
                margin: EdgeInsets.all(10),
              )
            ),
            
            Padding(padding: EdgeInsets.symmetric(vertical: 170)),
            RaisedButton(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [Icon(Icons.camera),Text("scanner")],), 
              onPressed: () async {
                String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#A03131','Cancelar',false,ScanMode.QR,);
                texto=barcodeScanRes;
                valor = int.parse(texto);               
                setState(() { 
                  saldo = saldo-valor;
                });
              },
            ),
          ],
        ),
          
          
      ),
    );
  }
}