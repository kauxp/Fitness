class PopularDietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;
  PopularDietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxIsSelected,

  });
  static List<PopularDietModel> getPopularDiets(){
    List<PopularDietModel> popularDiets = [
      PopularDietModel(
        name: 'Keto Diet',
        iconPath: 'icons/cake.svg',
        level: 'Intermediate',
        duration: '4 Weeks',
        calorie: '2000 cal',
        boxIsSelected: false,
      ),
      PopularDietModel(
        name: 'Vegan Diet',
        iconPath: 'icons/pancake.svg',
        level: 'Beginner',
        duration: '3 Weeks',
        calorie: '1800 cal',
        boxIsSelected: false,
      ),
      PopularDietModel(
        name: 'Paleo Diet',
        iconPath: 'icons/smoothie.svg',
        level: 'Advanced',
        duration: '6 Weeks',
        calorie: '2200 cal',
        boxIsSelected: false,
      ),
      PopularDietModel(
        name: 'Mediterranean Diet',
        iconPath: 'icons/salad.svg',
        level: 'Beginner',
        duration: '5 Weeks',
        calorie: '1900 cal',
        boxIsSelected: false,
      ),
      PopularDietModel(
        name: 'Low-Carb Diet',
        iconPath: 'icons/cake.svg',
        level: 'Intermediate',
        duration: '4 Weeks',
        calorie: '1500 cal',
        boxIsSelected: false,
      ),
    ];

    return popularDiets;
  }
}