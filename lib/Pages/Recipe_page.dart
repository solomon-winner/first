import 'package:first/models/Recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecipePage extends StatelessWidget {
  
  final Recipe recipe;

  RecipePage({required this.recipe});

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
      body: _buildUI(context),
    );
      
  }

Widget _buildUI(BuildContext context) {
        return Column(
          children: [
            _RecipeImage(
              context,
            )
          ],
        );
      }

Widget _RecipeImage(BuildContext context,) {
  return Container(
    height: MediaQuery.sizeOf(context).height * 0.40,
    width: MediaQuery.sizeOf(context).width,
    decoration: BoxDecoration(
      image:DecorationImage(
       image: NetworkImage(
        recipe.image),  
      )
     
      ),
  );
}
    
}