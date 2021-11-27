
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name="";
  bool changeButton=false;

  final _formKey=GlobalKey<FormState>();

  moveToHome(BuildContext context)async{
    if(_formKey.currentState.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child:SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/hey.png",fit: BoxFit.cover),
              SizedBox(
                height: 20,
              ),
              Text("Welcome $name",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter username",
                        labelText:"UserName",
                      ),
                      validator: (value){
                        if(value.isEmpty){
                          return"Username cannot be Empty";
                        }
                        return null;
                      },
                      onChanged: (value){
                        name=value;
                        setState((){});
                      },
                    ),

                    TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          labelText:"Password",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password cannot be Empty";
                          }
                          else if(value.length<6){
                            return "Password length should be 6";
                          }
                          return null;
                        }
                    ),
                    SizedBox(
                      height:20,
                    ),
                    Material(
                      color: context.theme.buttonColor,
                      borderRadius: BorderRadius.circular(changeButton?50:8),
                      child: InkWell(
                        onTap: ()=>moveToHome(context),
                        child:AnimatedContainer(
                          duration:Duration(seconds: 1),
                          width:changeButton? 50:150,
                          height:50,
                          alignment: Alignment.center,
                          child: changeButton?Icon(Icons.done,color: Colors.white,):Text("login",
                            style:TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          // decoration: BoxDecoration(
                          //   color:Colors.blue,
                          //   shape: changeButton ? BoxShape.circle:BoxShape.rectangle,
                          //   borderRadius: BorderRadius.circular(changeButton?50:8),
                          // ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
