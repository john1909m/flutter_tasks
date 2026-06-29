import 'package:flutter/material.dart';
import 'result.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color colorM=Color(0xff111328);
  Color colorF=Color(0xff111328);
  double height=120;
  int weight=50;
  int age=16;
  double bmi =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff050e2b),
      appBar: AppBar(
        title: Text("BMI Calculator", style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff0a0e21),
        centerTitle: true,
        

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          colorM=Colors.blueAccent;
                          colorF=Color(0xff111328);
                        });
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                        color: colorM,
                        borderRadius: BorderRadius.circular(10)
                      ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.male,size: 80,color: Colors.white,),
                          Text("Male",style: TextStyle(fontSize: 25,color: Colors.grey[400]),)
                      ],
                      ),

                      ),
                    ),
                    SizedBox(height: 15,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          colorM=Color(0xff111328);
                          colorF=Colors.pinkAccent;
                        });
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            color: colorF,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.female,size: 80,color: Colors.white,),
                            Text("Female",style: TextStyle(fontSize: 25,color: Colors.grey[400]),)
                          ],
                        ),

                      ),
                    )

                  ],
                ),
                SizedBox(height: 15,),

                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Color(0xff111328),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Height",style: TextStyle(fontSize: 20
                          ,fontWeight: FontWeight.bold,color: Colors.grey[400]),),
                      Text("${height.toInt()} cm",style: TextStyle(color: Colors.white
                          ,fontSize: 30,fontWeight: FontWeight.bold),),
                      Slider(
                      activeColor: Colors.white,
                      thumbColor: Colors.redAccent,
                      inactiveColor: Colors.grey[600],

                      value: height, onChanged:(double value){
                        setState(() {
                          height=value;
                        });
                      },
                      max: 210,
                      min: 100,)
                    ],
                  ),
                ),
                SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Color(0xff111328),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        mainAxisAlignment: .center,
                        children: [
                          Text("Weight",style: TextStyle(fontSize: 18,color: Colors.grey[400]),),
                          Text("$weight",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),

                          Text("kg",style: TextStyle(fontSize: 15,color: Colors.grey[400]),),
                          Row(
                            mainAxisAlignment: .center,
                            children: [
                              IconButton(onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              }, icon: Icon(Icons.add_circle_outlined,color: Colors.white,size: 40),),
                              IconButton(onPressed: (){
                                setState(() {
                                  if(weight>0){
                                    weight--;
                                  }
                                });
                              }, icon: Icon(Icons.remove_circle,color: Colors.white,size: 40)),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Color(0xff111328),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        mainAxisAlignment: .center,
                        children: [
                          Text("Age",style: TextStyle(fontSize: 18,fontWeight: .bold,color: Colors.grey[400]),),
                          Text("$age",style: TextStyle(fontSize: 30,color: Colors.white),),
                          Text("yrs",style: TextStyle(fontSize: 15,color: Colors.grey[400]),),
                          Row(
                            mainAxisAlignment: .center,
                            children: [
                              IconButton(onPressed: (){
                                setState(() {
                                  age++;
                                });
                              } , icon: Icon(Icons.add_circle_outlined,color: Colors.white,size: 40),),
                              IconButton(onPressed: (){
                                setState(() {
                                  if(age>0){
                                    age--;
                                  }
                                });
                              }, icon: Icon(Icons.remove_circle,color: Colors.white
                                ,size: 40 ,)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
          Spacer(),
          ElevatedButton(
              style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  fixedSize: Size(MediaQuery.of(context).size.width, 70),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
              )

              ,onPressed: (){
              bmi=weight/((height/100)*(height/100));
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Result(bmi:bmi)));
          },
              child: const Text("Calculate",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),) )
        ],
      ),
    );
  }
}
//sizer w screen utin