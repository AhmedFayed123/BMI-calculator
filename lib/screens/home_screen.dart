import 'dart:math';

import 'package:bmi_calc/screens/result_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isMale=true;
  double heightVal=170;
  int weight=55;
  int age=18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Body Mass Index',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                    children: [
                      genderWidget('male'),
                      SizedBox(width: 30,),
                      genderWidget('female'),
                    ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${heightVal.toStringAsFixed(1)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Colors.white
                            ),
                          ),
                          Text(
                            'CM',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black
                            ),
                          ),
                        ],
                      ),
                      Slider(
                          max: 220,
                          min: 90,
                          value: heightVal,
                          onChanged: (newVal){
                            setState(() {
                              heightVal=newVal;
                            });
                            },
                        activeColor: Colors.teal,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    waWidget('weight'),
                    SizedBox(width: 30,),
                    waWidget('age'),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height/16,
              child: TextButton(
                onPressed: () {
                 var result = weight/pow(heightVal/100, 2);
                 Navigator.of(context).push(
                   MaterialPageRoute(
                       builder:(context)=> ResultScreen(isMale: isMale, result: result, age: age),
                   ),
                 );
                },
                child: Text(
                    'Calculator',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white
                  ),
                ),

              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded genderWidget(String type) {
    return Expanded(
        child: GestureDetector(
          onTap: (){
            setState(() {
              isMale = type=='male'?true:false;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color:(isMale&&type=='male')||(!isMale&&type=='female')? Colors.teal:Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  type=='male'?Icons.male:Icons.female,
                  size: 90,
                  color: Colors.white,
                ),
                SizedBox(height: 15,),
                Text(
                    type=='male'?'Male':'Female',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
  Expanded waWidget(String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type=='weight'?'weight':'age',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black
              ),
            ),
            SizedBox(height: 15,),
            Text(
              type=='weight'?'$weight':'$age',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag:type=='weight' ?'weight--':'age--',
                    onPressed: (){
                    setState(() {
                      type=='weight' ?weight++:age++;
                    });
                    },
                  child: Icon(Icons.add,color: Colors.white,),
                  mini: true,
                  backgroundColor: Colors.teal,
                ),
                SizedBox(width: 8,),
                FloatingActionButton(
                  heroTag:type=='weight' ?'weight--':'age--',
                  onPressed: (){
                    setState(() {
                      type=='weight' ?weight++:age++;
                    });
                  },
                  child: Icon(Icons.remove,color: Colors.white,),
                  mini: true,
                  backgroundColor: Colors.teal,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}
