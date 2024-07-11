import 'package:first/models/Recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecipePage extends StatelessWidget {
  
  final Recipe recipe;

  RecipePage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
            ),
            _RecipeDetails(context),
          ],
        );
      }

Widget _RecipeImage(BuildContext context,) {
  return Container(
    height: MediaQuery.sizeOf(context).height * 0.40,
    width: MediaQuery.sizeOf(context).width,
    decoration: BoxDecoration(
      image:DecorationImage(
        fit: BoxFit.cover,
       image: NetworkImage(
        recipe.image),  
      )
     
      ),
  );
}

Widget _RecipeDetails (BuildContext context) {
  return Container(
    color: Colors.white,
    width: MediaQuery.sizeOf(context).width,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${recipe.cuisine}, ${recipe.difficulty}",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
        ),
      ],
    )
  );
}
    
}