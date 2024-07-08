import 'package:first/Services/auth_Service.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
  
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _loginFormKey = GlobalKey();
  String? UserName, Password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login",
        ),
      ),
      body: SafeArea (child: _buildUI()),
    );
  }
  
  Widget _buildUI() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width ,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _title(),
          _loginForm(),
        ],
      ),
    );
  }

  Widget _title() {
    return const Text(
      "Recipe Book",
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w300,
      ),
    );

  }

  Widget _loginForm() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.90,
      height: MediaQuery.sizeOf(context).height * 0.30,
      child: Form(
        key: _loginFormKey,        
        child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            initialValue: 'emilys',
            onSaved: (value) {
              setState(() {
               UserName = value;              
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter A User Name!";
              }
            },
            decoration: const InputDecoration(
              hintText: "User Name",
            ),
          ),
          TextFormField(
            initialValue: 'emilyspass',
            obscureText: true,
            onSaved: (value) {
              setState(() {
              Password = value;              
              });
            },
            validator: (value) {
              if (value == null || value.length < 5) {
                return "password must have atleast 5 digits!";
              }
            },
            decoration: const InputDecoration(
              hintText: "PassWord",
            ),
          ),
          _LoginButton(),
        ],
      ),
      ),
    );
  }

  Widget _LoginButton () {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.60,
      child: ElevatedButton(
        onPressed: () async  {
          if (_loginFormKey.currentState?.validate()?? false) 
          {
            _loginFormKey.currentState?.save();
            bool result = await AuthService().login(
              UserName!,
               Password!,); 
          }
        },
        child: const Text(
         "Login",
         ),
      ), 
    );
  }
}