import 'package:first/Services/data_Service.dart';
import 'package:first/models/Recipe.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

String _mealTypeFilter = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe Book"),
        centerTitle: true,
      ),
      body: SafeArea(child: _buildUI()),
    );
  }

  Widget _buildUI() {
    return Padding(
      padding: const EdgeInsets.all(
        10.0,
      ),
      child: Column(
        children: [
          _recipeTypeButtons(),
          _RespesList(),
        ],
      ),
    );
  }

  Widget _recipeTypeButtons() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.05,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: FilledButton(
              onPressed: () {
            setState(() {
              _mealTypeFilter = "snack";
            });
            }, 
            child: const Text("Snack"),),
          ),

           Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: FilledButton(onPressed: () {
             setState(() {
              _mealTypeFilter = "breakfast";
            });
            }, 
            child: const Text("BreackFast"),),
          ),

           Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: FilledButton(onPressed: () {
             setState(() {
              _mealTypeFilter = "lunch";
            });           
            }, 
            child: const Text("Lunch"),),
          ),

           Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: FilledButton(onPressed: () {
              setState(() {
              _mealTypeFilter = "dinner";
            });          
            }, 
            child: const Text("Dinner"),),
          ),
        ],
      ),
      
    );
  }

  Widget _RespesList() {
  return Expanded(
  child: FutureBuilder(
    future: DataService().getRecipes(_mealTypeFilter),
     builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
          );
      }
      if (snapshot.hasError) {
        return const Center(
          child: Text("Unable to load data."),
        );
      }
      return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          Recipe recipe = snapshot.data![index];
          return ListTile(
            onTap: () => {},
            contentPadding: const EdgeInsets.only(
              top: 20.0,
            ),
            isThreeLine: true,
            subtitle: Text(
              "${recipe.cuisine}\nDifficulty: ${recipe.difficulty}",
              ),
              leading: Image.network(
                recipe.image,
              ),
            title: Text(
              recipe.name,
            ),
            trailing: Text("${recipe.rating.toString()}",
            style:const TextStyle(
              fontSize: 15,
            ),
            ),
          );
        },
      );
     })

  
  );
  }
}