import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class MyPay extends StatefulWidget {
  @override
  _PayMethod createState() => _PayMethod();
}

class _PayMethod extends State<MyPay> {
  int saldo = 10000;
  int valor = 0;
  List<String> texArray = ['', ''];
  List<String> urlImagenes=[''];
  List<int> listPrecios=[];
  String texto ="";
  var ban = 1;


  Widget build(BuildContext context) {
    int con = 0;

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
                child: Text("\n"'$saldo MXM',style: TextStyle(fontSize: 45, color: Colors.black),textAlign: TextAlign.center, ),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),

                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
              
            ),
            Text("Historial de compras\n", style: TextStyle(color: Colors.white,fontSize: 15)),
            
            if(urlImagenes.length != 1)
              for (var i = 1; i < urlImagenes.length; i++)
                Row(
                  children:<Widget>[
                    Expanded(child: Image.network(urlImagenes[i],width: 55,height: 55,),),
                    Expanded(child: Text('${listPrecios[i-1]} MXM', textAlign: TextAlign.center),)
                  ]
                  
                ),
              
            Padding(padding: EdgeInsets.symmetric(vertical: 50)),
            RaisedButton(
              elevation: 50,
              padding: EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.white),
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [Icon(Icons.camera),Text("scanner")],), 
              onPressed: () async {
                String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#A03131','Cancelar',false,ScanMode.QR,);

                texArray = barcodeScanRes.split(" ");
                texto=texArray[0];
                valor = int.parse(texto); 

                if(saldo < valor){ 
                }else{
                  setState(() { 
                    saldo = saldo-valor;
                    listPrecios.add(valor);
                    urlImagenes.add(texArray[1]);
                    con = con+1;
                  });
                }              
              },
            ),
          ],
        ), 
      ),
    );
    
  }
}
