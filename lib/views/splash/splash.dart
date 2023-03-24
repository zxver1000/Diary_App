
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:flutter/services.dart';
import '../../constants/constants.dart';


class splash_page extends StatefulWidget {
  const splash_page({Key? key}) : super(key: key);

  @override
  State<splash_page> createState() => _splash_pageState();
}

class _splash_pageState extends State<splash_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor:Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Image.asset('assets/logo.png'),


          Padding(padding: EdgeInsets.only(top: 20)),
          Center(child: Text("Trip Diary",style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold
          ),),),

          Padding(padding: EdgeInsets.only(top: 100)),
          CircularProgressIndicator(
            strokeWidth: 4.0,
            valueColor : AlwaysStoppedAnimation(Colors.blueAccent),
          )
          ,
          Padding(padding: EdgeInsets.only(top: 30)),
          Text("서버와 연결중입니다 잠시만 기다려주세요!",style: TextStyle(
            fontSize: 20
          ),),
      Container(
        width: 200,
        height: 200,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff74ABE2),
              Color(0xff5563DE),
            ],
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(0, 5),
            )
          ],
        ),
        child: Center(
          child: Text(
            "이쁜 박스",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),




        ],
      ),
    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            "My App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}