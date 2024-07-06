import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
  
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login",
        ),
      ),
      body: _buildUI(),
    );
  }
  
  Widget _buildUI() {
    return Column(
      children: [
        
      ],
    );
  }
}