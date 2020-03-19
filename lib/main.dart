import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(
      new MaterialApp(debugShowCheckedModeBanner: false, home: Mycalculator()));
}

class Mycalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SIFormState();
  }
}

class SIFormState extends State<Mycalculator> {
  final minimupadding = 5.0;
  var currency = ['Rupees', 'Dollar', 'Pound'];
  var currencyvalue = 'Rupees';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Simple Interest Calculator'),
      ),
      body: Container(
        margin: EdgeInsets.all(minimupadding * 2),
        child: ListView(
          // child: Column(
          children: <Widget>[
            getMyImage(),
            Padding(
                padding:
                    EdgeInsets.only(top: minimupadding, bottom: minimupadding),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Principal',
                      hintText: 'Enter Principal',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),
            Padding(
                padding:
                    EdgeInsets.only(top: minimupadding, bottom: minimupadding),
                child: TextField(
                  // keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Interest',
                      hintText: 'Enter Interest',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),
            Padding(
              padding:
                  EdgeInsets.only(top: minimupadding, bottom: minimupadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Interest',
                        hintText: 'Enter Interest',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
                  Container(width: minimupadding * 5),
                  Expanded(
                      child: DropdownButton<String>(
                    items: currency.map((String newvalue) {
                      return DropdownMenuItem<String>(
                        value: newvalue,
                        child: Text(newvalue),
                      );
                    }).toList(),
                    value: currencyvalue,
                    onChanged: (String newvalue) {
                      setState(() {
                        this.currencyvalue = newvalue;
                      });
                    },
                  )),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: minimupadding, bottom: minimupadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: RaisedButton(
                    child: Text('Calculate'),
                    onPressed: () {},
                  )),
                  Container(width: minimupadding * 5),
                  Expanded(
                      child: RaisedButton(
                    child: Text('Reset'),
                    onPressed: () {},
                  ))
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: minimupadding, bottom: minimupadding),
              child: Text('Hello Text'),
            )
          ],
        ),
      ),
    );
  }

  Widget getMyImage() {
    // TODO: implement build
    AssetImage imageasset = AssetImage('images/apple.jpeg');
    Image image = Image(image: imageasset, width: 100.0, height: 100.0);
    return Container(
      child: image,
      margin: EdgeInsets.all(minimupadding * 10),
    );
  }
}
