import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants/constants.dart';
import 'package:provider/provider.dart';
import '../../constants/constants.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {

  bool isSignupScreen = false;
  final _formKey = GlobalKey<FormState>();
  String userName = '';
  String userEmail = '';
  String userPassword = '';
  bool showSpinner = false;


  void _tryValidation(){
    final isValid = _formKey.currentState!.validate();
    if(isValid){
      _formKey.currentState!.save();
    }
  }

  void showdialog(){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0))
        ,
        title: Text("Alert"),
        content: SizedBox(
          height: 50,
          child:Column(
            children: [
              Text("등록되지 않은 아이디거나\n비밀번호가 일치하지 않습니다")
            ],
          ) ,
        ),

        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("OK"))
        ],
      );
    });


  }

  @override
  Widget build(BuildContext context) {
    var phoneHeight=MediaQuery.of(context).size.height;
    var phoneWidth=MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: DiaryMainColor,
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [

            //배경
            Positioned(
              top: -(phoneHeight*0.1),
              right: 0,
              left: 0,
              child:
              Container(
                width:10,

        

                child: Image.asset('assets/logo.png',
                color: Colors.black45,
                scale: phoneWidth*0.004,),
                height: phoneHeight*0.7,
              )

            ),
            Positioned(
            top: phoneHeight/2.8,
            right: phoneWidth/3.8
            ,child: Text("Trip Diary",
            style: TextStyle(
              fontSize:phoneWidth/10,
               color: Colors.white,
              fontWeight:FontWeight.w900
            ),)),
            
            Positioned(
              top: phoneHeight/1.8,
             left: phoneWidth/9,
              child: Container(
                width: phoneWidth*0.8,

                child: SizedBox(
                  height: 150,
                  child: TextFormField(

                    obscureText: true,
                    key: ValueKey(3),
                    validator: (value){
                      if(value!.isEmpty || value.length < 5){
                        return 'Please enter at least 6 characters';
                      }
                      return null;
                    },
                    onSaved: (value){
                      userPassword = value!;
                    },
                    onChanged: (value){
                      userPassword = value;
                    },
style: TextStyle(
    fontSize: phoneWidth/30,

),

                    decoration:InputDecoration(
                        prefixIcon: Icon(
                          Icons.key,
                          color: Colors.white,size:phoneWidth/15,
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
                            fontSize: phoneWidth/30,
                            color: Colors.white
                        ),
                        contentPadding: EdgeInsets.all(10)
                    ),
                  ),
                ),
              ),


            ),

            Positioned(
              top: phoneHeight/2.1,
              left: phoneWidth/9,
              child: Container(
                width: phoneWidth*0.8,

                child: TextFormField(

                  style: TextStyle(
                      fontSize: phoneWidth/30,

                  ),
                  decoration:InputDecoration(
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Colors.white,size:phoneWidth/15,
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
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          fontSize: phoneWidth/30,
                          color: Colors.white
                      ),
                      contentPadding: EdgeInsets.all(10)
                  ),
                ),
              ),


            ),




            //여기까지


            //텍스트 폼 필트


            //전송버튼
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: isSignupScreen ? 450 : phoneHeight*0.68,
              right: 0,
              left: 0,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(12),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(150)
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      if (isSignupScreen) {
                        _tryValidation();
                      }
                      if (!isSignupScreen) {
                        _tryValidation();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.amberAccent ,Colors.white70],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight
                        ),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0,1)
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward),
                        color: Colors.white,
                        onPressed: ()async{

                    print("hihi");
                        },
                      ),

                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}