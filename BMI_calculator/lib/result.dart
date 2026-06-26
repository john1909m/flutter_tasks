import 'package:flutter/material.dart';
import 'home.dart';

class Result extends StatelessWidget {
  const Result({super.key,required this.bmi});
  final double bmi;


  @override
  Widget build(BuildContext context) {
    Color underWeightColor=Color(0xff748aff);
    Color normalColor=Color(0xff00ff37);
    Color overWeightColor=Color(0xffdf7500);
    Color obeseColor=Color(0xffc10000);


    return Scaffold(
      backgroundColor: Color(0xff050e2b),
      appBar: AppBar(
        backgroundColor: Color(0xff111328),
        title: Text("BMI Result",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding:const EdgeInsets.all(15.0),
                  child:
                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff111328)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${bmi.toInt()}",style: TextStyle(fontSize: 40,color: Colors.white,
                              fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff111328)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if(bmi<18.5)
                                Text("You are Under Weight",style: TextStyle(fontSize: 35,color: underWeightColor,
                                    fontWeight: FontWeight.bold),),
                              if(bmi>=18.5 && bmi<25)
                                Text("You are Normal",style: TextStyle(fontSize: 35,color: normalColor,
                                    fontWeight: FontWeight.bold),),
                              if(bmi>=25 && bmi<30)
                                Text("You are Over Weight",style: TextStyle(fontSize: 35,color: overWeightColor,
                                    fontWeight: FontWeight.bold),),
                              if(bmi>=30)
                                Text("You are Obese",style: TextStyle(fontSize: 35,color: obeseColor,
                                    fontWeight: FontWeight.bold),),
                              Divider(
                                color: Colors.white,
                                height: 30,
                                indent: 70,
                                endIndent: 70,
                              ),
                              if(bmi<18.5)
                                Text("Eat a balanced, nutrient-rich diet and consider strength training to reach a healthy weight.",style: TextStyle(fontSize: 16,color: Colors.white,
                                    fontWeight: FontWeight.bold),),
                              if(bmi>=18.5 && bmi<25)
                                Text("Excellent! Keep maintaining your healthy lifestyle with regular exercise and balanced nutrition.",style: TextStyle(fontSize: 16,color: Colors.white,
                                    fontWeight: FontWeight.bold),),
                              if(bmi>=25 && bmi<30)
                                Text("Increase your physical activity and choose healthier foods to gradually reach a healthier weight.",style: TextStyle(fontSize: 16,color: Colors.white,
                                    fontWeight: FontWeight.bold),),
                              if(bmi>=30)
                                Text("Consider making long-term lifestyle changes and consult a healthcare professional for personalized guide.",style: TextStyle(fontSize: 16,color: Colors.white,
                                    fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                            ],
                          ),
                        )
                      ],
                    ),
                ),



              ],
            ),
          ),
          Spacer(),
          ElevatedButton(
              style:ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                fixedSize: Size(MediaQuery.of(context).size.width, 90),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              )

              ,onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
          },
              child: const Text("Calculate Again",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),) )
        ],
      ),

    );
  }
}
