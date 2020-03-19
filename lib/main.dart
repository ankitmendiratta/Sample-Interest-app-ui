import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Mycalculator(),
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.indigo)));
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

  // var currencyvalue = 'Rupees';
  var currencyvalue = '';
  @override
  void initState() {
    super.initState();
    currencyvalue = currency[0];
  }

  var displayresult = '';
  TextEditingController interestcont = TextEditingController();
  TextEditingController roicont = TextEditingController();
  TextEditingController termcont = TextEditingController();

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
                  controller: interestcont,
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
                  controller: roicont,
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
                    controller: termcont,
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Terms',
                        hintText: 'Terms in year',
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
                    child: Text(
                      'Calculate',
                      textScaleFactor: 1.5,
                    ),
                    color: Theme.of(context).accentColor,
                    textColor: Theme.of(context).primaryColorDark,
                    onPressed: () {
                      setState(() {
                        this.displayresult = calculatereturn();
                      });
                    },
                  )),
                  Container(width: minimupadding * 5),
                  Expanded(
                      child: RaisedButton(
                    color: Theme.of(context).primaryColorDark,
                    textColor: Theme.of(context).primaryColorLight,
                    child: Text(
                      'Reset',
                      textScaleFactor: 1.5,
                    ),
                    onPressed: () {
                      setState(() {
                        interestcont.text = '';
                        roicont.text = '';
                        termcont.text = '';
                        currencyvalue = currency[0];
                        displayresult = '';
                      });
                    },
                  ))
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: minimupadding, bottom: minimupadding),
              child: Text(this.displayresult),
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

  String calculatereturn() {
    double princial = double.parse(interestcont.text);
    double roi = double.parse(roicont.text);
    double temr = double.parse(termcont.text);

    double totalamount = princial + (princial * roi * temr) / 100;
    String valustring =
        'After $temr year, interest is $totalamount $currencyvalue';
    return valustring;
  }
}
