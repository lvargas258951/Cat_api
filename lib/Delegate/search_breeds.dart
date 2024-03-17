import 'package:flutter/material.dart';
import '../Models/breeds.dart';

class CatSearchDelegate extends SearchDelegate<CatBreeds> {
  final List<CatBreeds> cats;
  static const String routeName = '/detail_cat';
  CatSearchDelegate({required this.cats});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showResults(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {},
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<CatBreeds> filteredBreeds = cats
        .where(
            (breed) => breed.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (filteredBreeds.isEmpty) {
      return Center(
        child: Text('No se encontraron razas para "$query"'),
      );
    }

    return ListView.builder(
      itemCount: filteredBreeds.length,
      itemBuilder: (context, index) {
        final breed = filteredBreeds[index];
        return ListTile(
          title: Text(breed.name),
          onTap: () {
            Navigator.pushNamed(context, CatSearchDelegate.routeName,
                arguments: breed);
            //close(context, breed);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<CatBreeds> suggestionList = query.isEmpty
        ? cats.sublist(0, 5) // Show top 5 breeds as suggestions
        : cats
            .where((breed) =>
                breed.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final breed = suggestionList[index];
        return ListTile(
          title: Text(breed.name),
          onTap: () {
            query = breed.name; 
            showResults(context);
          },
        );
      },
    );
  }
}
