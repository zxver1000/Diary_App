
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:tripdiary/login/logInVeiwModel.dart';
import 'package:tripdiary/login/views/testScreen.dart';

class logInScreen extends StatefulWidget {
  const logInScreen({Key? key}) : super(key: key);

  @override
  State<logInScreen> createState() => _logInScreenState();
}

class _logInScreenState extends State<logInScreen> {
  logInViewModel? viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel=Provider.of<logInViewModel>(context,listen: false);
    print(viewModel);
    print("Fds");
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("#21!!!!!!!!!!!!!!!!!!!!!!!!!!"),
          Consumer<logInViewModel>(
            builder: (context,viewModel,widget){
              return Text(viewModel!.count.toString());
            },
          )
          ,TextButton(onPressed: (){

            viewModel!.inc();
          }, child: Text("버튼버틍")),


          FloatingActionButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context)=>
                    Login_Screen()));
          },child: Text("hhihi"),)
        ],
      )

    ,
    );
  }
}
