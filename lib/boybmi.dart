import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import 'main.dart';
import 'dart:ffi';

import 'package:flutter/material.dart';
class boyhomepage extends StatelessWidget {
  const boyhomepage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI CALCULATE',
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATE')),
          backgroundColor: Colors.blue[200],
        ),
        body: bmicalculate(),
      ),
    );
  }
}
class bmicalculate extends StatefulWidget {
  const bmicalculate({Key? key}) : super(key: key);

  @override
  State<bmicalculate> createState() => _bmicalculateState();
}

class _bmicalculateState extends State<bmicalculate> {
  String pgst="0";
  TextEditingController height=TextEditingController();
  TextEditingController weight=TextEditingController();
  TextEditingController Age=TextEditingController();
  String message="";
  bool first=false;
  bool second=false;
  bool third=false;
  bool _isFinished=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Row(
          //
          //
          //   children: [
          //     Text('BOY'),
          //     Checkbox(
          //         checkColor: Colors.black,
          //         value: second,
          //         onChanged: (bool? value){
          //           setState((){
          //             second=value!;
          //           }
          //           );
          //         }
          //     ),
          //     Text('GIRL'),
          //     Checkbox(
          //         checkColor: Colors.black,
          //         value: third,
          //         onChanged: (bool? value){
          //           setState((){
          //             third=value!;
          //           }
          //           );
          //         }
          //     ),
          //   ],
          // ),
          TextField(
            decoration: InputDecoration(
              label: Text("Enter your age"),
              prefixIcon: Icon(Icons.boy_outlined),
            ),
            keyboardType: TextInputType.number,
            controller: Age,
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: height,
            decoration: InputDecoration(
              label: Text("Enter your height in cm"),
              prefixIcon: Icon(Icons.height),
            ),

          ),
          TextField(

            keyboardType: TextInputType.number,
            controller: weight,
            decoration: InputDecoration(
              label: Text("Enter your weight in KG"),
              prefixIcon: Icon(Icons.line_weight),
            ),
          ),
          SizedBox(
            width: 100,
            height: 30,
          ),
          // Padding(padding: EdgeInsets.symmetric(vertical: 20,horizontal: 60),
          //   child: SwipeableButtonView(
          //     isFinished: _isFinished,
          //     onFinish: (){
          //       setState((){
          //         _isFinished=false;
          //       });
          //     },
          //     onWaitingProcess: (){
          //       Future.delayed(Duration(seconds: 1),(){
          //         setState((){
          //           _isFinished=true;
          //         });
          //       });
          //     },
          //     activeColor: Colors.black,
          //     buttonWidget: Icon(
          //       Icons.arrow_forward_ios_rounded,
          //       color: Colors.black,
          //     ),
          //     buttonText: "CALCULATE",
          //   ),
          // ),
          Row(
            children: [
              Expanded(child: TextButton(
                child: Container(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Calculate',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                onPressed: (){
                  setState((){
                    if(weight.text=="" || height.text==""){
                      pgst="Please enter all details";
                    }
                    else {
                      double sum = (int.parse(weight.text)) / ((double.parse(
                          height.text) / 100) *
                          (double.parse(height.text) / 100));
                      if(sum>25){
                        message="You are Overweight.";
                      }
                      else if(sum<18){
                        message="You are underweight.";
                      }
                      else{
                        message="You are Healthy.";
                      }
                      pgst = sum.toStringAsFixed(1);
                    }
                  });
                },
              )
              )
            ],
          ),
          // Text('Your BMI is $pgst.',
          //   style: TextStyle(
          //     fontSize: 30,
          //   ),
          // ),
          SizedBox(
            height: 20,
          ),
          Text('$message',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          PrettyGauge(
            gaugeSize: 250,
            minValue: 0,
            maxValue: 40,
            segments: [
              GaugeSegment('Underweight', 18.5, Colors.blue),
              GaugeSegment('Healthy', 6.4, Colors.green),
              GaugeSegment('Healthy', 5, Colors.orange),

              GaugeSegment('Overweight', 10.1, Colors.red),
            ],
            valueWidget: Text('$pgst',
              style: TextStyle(fontSize: 30),
            ),
            currentValue: double.parse(pgst),
          )
        ],
      ),
    );
  }
}
