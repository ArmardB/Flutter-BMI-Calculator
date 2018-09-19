import 'package:flutter/material.dart';

class BmiHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BMIState();
  }


}

class BMIState extends State<BmiHome> {

  double _calc;
  String _bmiResult;
  String _status;

  TextEditingController _ageFieldController = new TextEditingController();
  TextEditingController _heightFieldController = new TextEditingController();
  TextEditingController _weightFieldController = new TextEditingController();

  void _calculateBMI() {

    double height = double.parse(_heightFieldController.text);
    double weight = double.parse(_weightFieldController.text);

    if(height != null && weight != null) {
      setState(() {
        height = height * 12;
        _calc = (weight / (height * height)) * 703;
        _bmiResult = _calc.toStringAsFixed(2);
        if (_calc < 18.5) {
          _status = 'UNDERWEIGHT';
        }
        else if (_calc >= 18.5 && _calc <= 24.9) {
          _status = 'NORMAL';
        }
        else if (_calc >= 25.0 && _calc <= 29.9) {
          _status = 'OVERWEIGHT';
        }
        else {
          _status = 'OBESE';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.pink,
        title: new Text('BMI'),
      ),
      body: new ListView(
        padding: const EdgeInsets.all(2.5),
        children: <Widget>[
          new Image.asset("images/bmilogo.png",
          height: 120.0,
          width: 150.0,
          ) ,
          new Container(
            color: Colors.grey.shade300,
            padding: const EdgeInsets.all(5.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new TextField(
                  controller: _ageFieldController,
                  decoration:  new InputDecoration(
                    labelText: 'Age',
                    icon: new Icon(Icons.person)
                  ),
                ),
                new TextField(
                  controller: _heightFieldController,
                  decoration:  new InputDecoration(
                      labelText: 'Height in ft',
                      icon: new Icon(Icons.linear_scale)
                  ),
                ),
                new TextField(
                  controller: _weightFieldController,
                  decoration:  new InputDecoration(
                      labelText: 'Weight in lbs',
                      icon: new Icon(Icons.arrow_upward)
                  ),
                ),
                new Padding(padding: const EdgeInsets.all(5.5)),
                new RaisedButton(onPressed: _calculateBMI,
                  child: new Text('CALCULATE',
                    style: new TextStyle(fontWeight: FontWeight.bold),),
                  color: Colors.pink,
                  textColor: Colors.white,)
              ],
            ),
          ),
          new Padding(padding: const EdgeInsets.all(5.5)),
          new Container(
            alignment: Alignment.topCenter,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(_bmiResult != null ? 'BMI: $_bmiResult' : 'Enter your stats above',
                  style: new TextStyle(
                    color: Colors.green,
                    fontSize: 24.5,
//            fontWeight: FontWeight.a
                  ),
                ),
                new Text(_status != null ? _status : '',
                style: new TextStyle(
                  fontSize: 28.0
                ),)
              ],
            ),
          ),

        ],
      ),
    );
  }

}
