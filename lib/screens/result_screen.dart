import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.isMale, required this.result, required this.age});

  final bool isMale;
  final double result;
  final int age;
  String get resultPhrase{
   String resultText='';
   if(result>=30) resultText='Obese';
   else if(result<30&&result>25) resultText='Overweight';
   else if(result>=18.5&&result<=24.9) resultText='Normal';
   else resultText='Thin';

   return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Result',
          style: TextStyle(
            color: Colors.white,

          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Gender : ${isMale?'Male':'Female'}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'result : ${result.toStringAsFixed(1)}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
                'Healthiness : ${resultPhrase}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,

              ),
            ),
            Text(
              'Age : ${age}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,

              ),
            ),

          ],
        ),
      ),
    );
  }
}
