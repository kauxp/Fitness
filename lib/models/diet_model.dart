import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxColor,
    this.viewIsSelected=false,
  });

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];
    diets.add(DietModel(
      name: 'Green Salad',
      iconPath: 'icons/salad.svg',
      level: 'Intermediate',
      duration: '3 Weeks',
      calorie: '1200 Kcal',
      boxColor: Color.fromARGB(255, 127, 214, 134),
      viewIsSelected: false,
    ));
    diets.add(DietModel(
      name: 'Purple Cake',
      iconPath: 'icons/cake.svg',
      level: 'Beginner',
      duration: '2 Weeks',
      calorie: '1000 Kcal',
      boxColor: Color.fromARGB(255, 224, 162, 206),
      viewIsSelected: false,
    ));
    diets.add(DietModel(
      name: 'Good Smoothie',
      iconPath: 'icons/smoothie.svg',
      level: 'Advanced',
      duration: '4 Weeks',
      calorie: '1500 Kcal',
      boxColor: Color.fromARGB(255, 212, 236, 105),
      viewIsSelected: false,
    ));
    diets.add(DietModel(
      name: 'Pancake Stack',
      iconPath: 'icons/pancake.svg',
      level: 'Intermediate',
      duration: '3 Weeks',
      calorie: '1200 Kcal',
      boxColor: Color.fromARGB(255, 161, 199, 224),
      viewIsSelected: false,
    ));

    return diets;
  }
}
