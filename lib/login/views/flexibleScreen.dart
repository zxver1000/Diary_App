


import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:tripdiary/constants/constants.dart';
import 'package:tripdiary/login/logInVeiwModel.dart';
import 'package:tripdiary/login/views/testScreen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class flexsibleLoginScreen extends StatefulWidget {
  const flexsibleLoginScreen({Key? key}) : super(key: key);

  @override
  State<flexsibleLoginScreen> createState() => _flexsibleLoginScreenState();
}

class _flexsibleLoginScreenState extends State<flexsibleLoginScreen> {
  @override
  Widget build(BuildContext context) {
    var phoneHeight=MediaQuery.of(context).size.height;
    var phoneWidth=MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(

        child:
        Container(
          color: DiaryMainColor,
          width: phoneWidth,
          height: phoneHeight,
          child: Column(
            children: [
              Column(

  mainAxisAlignment: MainAxisAlignment.start,

  children: [
    
    
    Padding(padding: EdgeInsets.only(top: 100.h)),

        

        Container(
      child: Image.asset('assets/logo.png',
        color: Colors.black45,

        height: 200.h,
        
      ),


    ),
          Padding(padding: EdgeInsets.only(top: 15.h))
          ,Text("Trip Diary",
      style: TextStyle(
          fontSize:60.h,
          color: Colors.white,
          fontWeight:FontWeight.w900
      ),)
    


  ],
),

           Padding(padding: EdgeInsets.only(top: 50.h)),


           Column(
                children: [Container(
                  width: 1800.w,
                  height: 50.h,

                  child: TextFormField(

                    style: TextStyle(
                      fontSize: 72.sp,

                    ),
                    decoration:InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Colors.white,size:100.sp,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: skyblue),
                          borderRadius: BorderRadius.all(
                            Radius.circular(100.w),

                          ),

                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: skyblue),
                          borderRadius: BorderRadius.all(
                            Radius.circular(100.w),
                          ),
                        ),
                        fillColor: Colors.white38,
                        filled: true,
                        hintText: 'Email',
                        hintStyle: TextStyle(
                            fontSize: 72.sp,
                            color: Colors.white
                        ),
                        contentPadding: EdgeInsets.all(10)
                    ),
                  ),
                ),

                  Padding(padding: EdgeInsets.only(top: 10.h)),



                  Container(
                    width: 1800.w,
                    height:200.w,
                    child: SizedBox(

                      child: TextFormField(

                        obscureText: true,
                        key: ValueKey(3),
                        validator: (value){
                          if(value!.isEmpty || value.length < 5){
                            return 'Please enter at least 6 characters';
                          }
                          return null;
                        },

                        style: TextStyle(
                          fontSize: 72.sp,

                        ),


                        decoration:InputDecoration(
                            prefixIcon: Icon(
                              Icons.key,
                              color: Colors.white,size:130.w,
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: skyblue),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25.0),

                              ),

                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: skyblue),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25.0),
                              ),
                            ),

                            fillColor: Colors.white38,
                            filled: true,
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                fontSize: 72.sp,
                                color: Colors.white
                            ),
                            contentPadding: EdgeInsets.all(10)
                        ),
                      ),
                    ),
                  ),

                  Padding(padding: EdgeInsets.only(top: 10.h)),


                  SizedBox(
                    width: 1800.w,
                    height:40.h,

                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Log in",style: TextStyle(
                        fontSize: 70.w
                            ,color: Colors.white
                      ),),
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.0),
                              //side: BorderSide(color: Colors.red) // border line color
                            )),
                      ),
                    ),
                  ),
Padding(padding: EdgeInsets.only(top: 50.w)),
                  SizedBox(
                    width: 1700.w,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                      children: [


                        
                        TextButton(onPressed: (){}, child: Text("회원 가입",
                          style: TextStyle(
                              fontSize: 50.w,
                              color: Colors.white
                          ),) ),
                        
                        Padding(padding: EdgeInsets.only(left: 10.w)),
                        Text("/"
                            ,style: TextStyle(
                            fontSize: 50.w,
                            color: Colors.white
                        ),),
                        Padding(padding: EdgeInsets.only(left: 10.w)),



                        TextButton(onPressed: (){}, child: Text("비밀번호 찾기",
                          style: TextStyle(
                              fontSize: 50.w,
                              color: Colors.white
                          ),) ),


                      ],
                    ),
                  )

                ],
              ),




            ],
          ),
        ),
      ),
    );
  }
}
