import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white60,
        title: const Text(
          "RecipeBook",
        ),
      ),
      body: _buildUI(),
    );
      
  }

Widget _buildUI() {
        return Column(
          children: [],
        );
      }
    
}