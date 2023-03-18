import 'package:flutter/material.dart';
import 'boybmi.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      theme: ThemeData(
      ),
      home: const homepage(),
    );
  }
}

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
        backgroundColor: Colors.blue[200],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  image:DecorationImage(image: AssetImage('images/male.jpg'))
                ),
                width: 1000,
                height: 1000,

                child: TextButton(
                  child: Text('',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const boyhomepage()),
                    );
                  },
                ),
              ),
            ),
          ),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image:DecorationImage(image: AssetImage('images/female.jpg'))
              ),
              width: 1000,
              height: 1000,
              child: TextButton(
                child: Text('',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const boyhomepage()),
                  );
                },
              ),
            ),
          ),

        ],
      ),
    );


  }
}

