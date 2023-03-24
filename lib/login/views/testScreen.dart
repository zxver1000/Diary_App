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
              top: -300,
              right: 0,
              left: 0,
              child:
              Container(
                width:10,

        

                child: Image.asset('assets/logo.png',
                color: Colors.black45,
                scale: 0.5,),
                height: MediaQuery.of(context).size.height*0.7,
              )

            ),
            Positioned(
            top: MediaQuery.of(context).size.height/2.95,
            right: MediaQuery.of(context).size.width/3.2
            ,child: Text("Trip Diary",
            style: TextStyle(
              fontSize: 90,
               color: Colors.white,
              fontWeight:FontWeight.w900
            ),)),
            
            Positioned(
              top: MediaQuery.of(context).size.height/1.38,
             left: MediaQuery.of(context).size.width/9,
              child: Container(
                width: MediaQuery.of(context).size.width*0.8,

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
  fontSize: 25,
  height: 2
),cursorHeight: 50,

                    decoration:InputDecoration(
                        prefixIcon: Icon(
                          Icons.key,
                          color: Colors.white,size:45,
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
                            fontSize: 30,
                            color: Colors.white
                        ),
                        contentPadding: EdgeInsets.all(10)
                    ),
                  ),
                ),
              ),


            ),

            Positioned(
              top: MediaQuery.of(context).size.height/1.5,
              left: MediaQuery.of(context).size.width/9,
              child: Container(
                width: MediaQuery.of(context).size.width*0.8,

                child: TextFormField(

                  style: TextStyle(
                      fontSize: 25,
                    height: 2
                  ),cursorHeight: 20,
                  decoration:InputDecoration(
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Colors.white,size:45,
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
                          fontSize: 30,
                          color: Colors.white
                      ),
                      contentPadding: EdgeInsets.all(10)
                  ),
                ),
              ),


            ),




            //여기까지


            //텍스트 폼 필트

            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: MediaQuery.of(context).size.height*0.4,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                padding: EdgeInsets.all(20.0),
                height: isSignupScreen ? 500.0 : 320.0,
                width: MediaQuery.of(context).size.width*0.885,
                margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.06),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 5
                      )
                    ]
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                isSignupScreen = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: !isSignupScreen ? activecolor : skyblue
                                  ),
                                ),
                                if(!isSignupScreen)
                                  Container(
                                    height: 2,
                                    width: 55,
                                    color: Color.fromARGB(255, 41, 74, 42),
                                  )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                isSignupScreen = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'Manager',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: isSignupScreen ? activecolor : skyblue
                                  ),
                                ),
                                if(isSignupScreen)
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: Color.fromARGB(255, 41, 74, 42),
                                  )
                              ],
                            ),
                          )
                        ],
                      ),
                      if(isSignupScreen)
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(

                                  key: ValueKey(1),
                                  validator: (value){
                                    if(value!.isEmpty || value.length < 4){
                                      return 'Please enter at least 4 characters';
                                    }
                                    return null;
                                  },
                                  onSaved: (value){
                                    userName = value!;
                                  },
                                  onChanged: (value){
                                    userName = value;
                                  },
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.account_circle,
                                        color: iconColor,
                                      ),

                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: skyblue),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: skyblue),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),

                                      hintText: 'User name',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: skyblue
                                      ),
                                      contentPadding: EdgeInsets.all(10)
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,

                                  key: ValueKey(2),
                                  validator: (value){
                                    if(value!.isEmpty || !value.contains('@')){
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                  onSaved: (value){
                                    userEmail = value!;
                                  },
                                  onChanged: (value){
                                    userEmail = value;
                                  },
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: iconColor,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: skyblue),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: skyblue),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      hintText: 'Emails',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: skyblue
                                      ),
                                      contentPadding: EdgeInsets.all(10)
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
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
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.password,
                                        color: iconColor,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: skyblue),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: skyblue),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: skyblue
                                      ),
                                      contentPadding: EdgeInsets.all(10)
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      if(!isSignupScreen)
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  key: ValueKey(4),
                                  validator: (value){
                                    if(value!.isEmpty || !value.contains('@')){
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                  onSaved: (value){
                                    userEmail = value!;
                                  },
                                  onChanged: (value){
                                    userEmail = value;
                                  },
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.supervised_user_circle_sharp,
                                        color: iconColor,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: skyblue),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: skyblue),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                          fontSize: 20,
                                          color: skyblue
                                      ),
                                      contentPadding: EdgeInsets.all(10)
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(

                                  obscureText: true,
                                  key: ValueKey(5),
                                  validator: (value){
                                    if(value!.isEmpty || value.length < 6){
                                      return 'Password must be at least 7 characters long';
                                    }
                                    return null;
                                  },
                                  onSaved: (value){
                                    userPassword = value!;
                                  },
                                  onChanged: (value){
                                    userPassword = value;
                                  },

                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.key,
                                        color: iconColor,
                                        size: 30,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: skyblue),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: skyblue),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                          fontSize: 20,
                                          color: skyblue
                                      ),
                                      contentPadding: EdgeInsets.all(10)
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top:8)),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children:<Widget>[
                                    Text("Don't have an account? "),

                                    TextButton(onPressed: (){

                                      /*
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                              builder: (context)=>
                                                  SignupScreen()));

                                       */
                                      print("버튼눌림");
                                    }, child: Text(
                                        "Signup",
                                        style:TextStyle(color: Colors.blueAccent,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)
                                    )),

                                  ],
                                ),





                              ],
                            ),

                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
            //전송버튼
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: isSignupScreen ? 450 : MediaQuery.of(context).size.height*0.68,
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