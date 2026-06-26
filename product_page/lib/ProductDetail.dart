import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int qty=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
        
          children: [
            Container(
              height: 350,
              width: double.infinity,
        
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(0),bottom: Radius.circular(15)),
                color: Colors.grey[200],
        
              ),
              child: Column(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
        
                        Icon(Icons.arrow_back_ios_new_rounded),
                        Icon(Icons.ios_share)
                      ],
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 250,
                    child:
                    Image(image: AssetImage("assets/download-apples-png-image-red-apple-fruit-10.png",))
                    ,
                  )
                ],
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text("Natural Red Apple",style: GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold)),
                          Text("1kg, Price",style: GoogleFonts.ubuntu(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey)),
        
                        ],
                      ),
                      Icon(Icons.favorite_border_rounded,size: 20,)
                    ],
        
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){
                            setState(() {
                              if(qty>1){
                                qty--;
                            }
                            });
                          }, icon: Icon(Icons.remove,color: qty<=1? Colors.grey : Colors.orangeAccent)),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Column(
                              mainAxisAlignment: .center,
                              children: [
                                Text("$qty",style: TextStyle(fontSize: 14),),
                              ],
                            )
                          ),
                          IconButton(onPressed: (){
                            setState(() {
                              qty++;
                            });
                          }, icon: Icon(Icons.add,color: Colors.orangeAccent,)),
                        ],
                      ),
                      Text("\$4.99",style:GoogleFonts.ubuntu(fontSize: 20,fontWeight: .bold) ,)
                    ],
                  ),
                  Divider(
                    color: Colors.grey[400],
                    height: 20,
                    thickness: 1,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text("Product Detail",style:GoogleFonts.ubuntu(fontSize: 14,fontWeight: .bold) ,),
                          Icon(Icons.keyboard_arrow_down_rounded,size: 30,)
                        ],
                      ),
                      Text("Apples Are Nutritious. Apples May Be Good For Weight Loss. Apples May Be Good For Your Heart. As Part Of A Healthful And Varied Diet",
                          style:GoogleFonts.ubuntu(fontSize: 12,color: Colors.grey))
                    ],
                  ),
                  Divider(
                    color: Colors.grey[400],
                    height: 20,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text("Nutrition",style:GoogleFonts.ubuntu(fontSize: 14,fontWeight: .bold) ,),
                      Row(
                        children: [
                          Container(
                            width: 25,
                            height: 12.5,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Column(
                              mainAxisAlignment: .center,
                              children: [
                                Text("100gr",style: TextStyle(fontSize: 7,fontWeight: .bold,color: Colors.grey[700]),),
                              ],
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded,size: 20,)

                        ],
                      ),

                    ],
                  ),
                  Divider(
                    color: Colors.grey[400],
                    height: 20,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text("Reviews",style:GoogleFonts.ubuntu(fontSize: 14,fontWeight: .bold) ,),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star,color: Colors.orange,size: 15,),
                              Icon(Icons.star,color: Colors.orange,size: 15,),
                              Icon(Icons.star,color: Colors.orange,size: 15,),
                              Icon(Icons.star,color: Colors.orange,size: 15,),
                              Icon(Icons.star,color: Colors.orange,size: 15,),
                              Icon(Icons.arrow_forward_ios_rounded,size: 20,)

                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,

                        shape: RoundedRectangleBorder(
                          borderRadius: .circular(15)
                        )
                      ),

                        onPressed: (){

                        },
                        child:Text("Add To Basket",style: GoogleFonts.ubuntu(fontSize: 20,color: Colors.white),)
                    ),
                  ),
        
        
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
