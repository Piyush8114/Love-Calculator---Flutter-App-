import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController MynameController = TextEditingController();
  TextEditingController CrushnameController = TextEditingController();
  String lovePersentage = "";
  bool visivlity = false;
  bool isDesable = false;
  final _formkey = GlobalKey<FormState>();

  void LoveCalculate() {
    setState(() {
      Random random = new Random();
      int persentage = random.nextInt(51) + 50;
      lovePersentage = persentage.toString();
      visivlity = true;
      isDesable = true;
    });
  }

  void AgainTry() {
    setState(() {
      visivlity = false;
      isDesable = false;
      MynameController.clear();
      CrushnameController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/love.jpg"),
                fit: BoxFit.cover,
              ),
            ),
                child: Stack(
                  children: [

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child:
                          Center(
                            child: Form(
                              key: _formkey,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    SizedBox(
                                      height: 200,
                                      child: Image.asset(
                                        "assets/lovers.png",
                                      ),
                                    ),


                                    SizedBox(height: 30,),

                                    TextFormField(
                                        controller: MynameController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white.withOpacity(0.8),
                                          prefixIcon: Icon(CupertinoIcons.suit_heart_fill,color: Colors.pink,),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          hintText: 'Enter Your Name',
                                          errorStyle: TextStyle(
                                            color: Colors.red, // Error message color
                                            fontSize: 14,            // Optional: change font size
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Enter Your Crush Name";
                                          }
                                          return null;
                                        }
                                    ),
                                    // SizedBox(height: 50,
                                    //   child: Icon(Icons.favorite,color: Colors.red,size: 40,),
                                    // ),
                                    SizedBox(height: 20,),
                                // Second Text Field
                                    TextFormField(
                                      controller: CrushnameController,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white.withOpacity(0.8),
                                        prefixIcon: Icon(CupertinoIcons.suit_heart_fill,color: Colors.pink,),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        hintText: 'Enter Crush Name',
                                        errorStyle: TextStyle(
                                          color: Colors.red, // Error message color
                                          fontSize: 14,            // Optional: change font size
                                        ),
                                      ),

                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Enter Your Crush Name";
                                        }
                                        return null;
                                      },
                                    ),

                                    SizedBox(height: 35,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          onPressed: isDesable
                                              ? null
                                              : () {
                                            if (_formkey.currentState?.validate() == true) {
                                              LoveCalculate();
                                            }
                                          },
                                          child: Text("Calculate"),
                                        ),


                                        ElevatedButton(onPressed: (){
                                          AgainTry();
                                        }, child: Text("Try Again")),

                                      ],
                                    ),
                                    Visibility(
                                      visible: visivlity,
                                      child: Stack(
                                        children: [
                                          Icon(CupertinoIcons.heart_solid,size: 100,color: Colors.pink,),
                                          Positioned(
                                              top: 35,
                                              left: 35,
                                              child: Text("${lovePersentage}%",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 18),))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                    ),
                  ],
                ),
        )

    );
  }
}