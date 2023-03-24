import 'package:flutter/material.dart';
import 'package:tripdiary/login/logInVeiwModel.dart';
import 'package:tripdiary/login/views/logInScreen.dart';
import './views/splash/splash.dart';

import 'dart:async';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:flutter/services.dart';


class server extends ChangeNotifier{
  var http_server_name;

  void setserver(ss){
    http_server_name=ss;
    notifyListeners();
  }
}

class loginindex extends ChangeNotifier{
  StreamController<String> streamController = StreamController<String>();
  void logout(){
    streamController.add("로그아웃");
    notifyListeners();
  }
  void login(){
    streamController.add("로그인");
    notifyListeners();
  }


  void init(){
    streamController.add("init");
    notifyListeners();
  }

}

void main() {
  runApp(

      MultiProvider(providers: [
        ChangeNotifierProvider(create: (c)=>server()),
        ChangeNotifierProvider(create: (c)=>loginindex()),
        ChangeNotifierProvider(create:(c)=> logInViewModel())
      ]
       ,child: MyApp(),)
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
        stream: context.watch<loginindex>().streamController.stream,
        builder: (BuildContext context,snapshot){
          if(snapshot.data.toString()=="로그인") {
            //퓨쳐빌
            return logInScreen();
          } else{
            return logInScreen();
          }

        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  @override
  Widget build(BuildContext context) {

    return splash_page();
  }
}

class tet extends StatefulWidget {
  const tet({Key? key}) : super(key: key);

  @override
  State<tet> createState() => _tetState();
}

class _tetState extends State<tet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}
