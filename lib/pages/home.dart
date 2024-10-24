import 'package:fitness/models/category_model.dart';
import 'package:fitness/models/diet_model.dart';
import 'package:fitness/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietModel> popularDiets = [];

  void toggleView(int index) {
    setState(() {
      diets[index].viewIsSelected = !diets[index].viewIsSelected;
    });
  }

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getDiets() {
    diets = DietModel.getDiets();
  }

  void _getPopularDiets() {
    popularDiets = PopularDietModel.getPopularDiets();
  }

  void _getInitialInfo() {
    _getCategories();
    _getDiets();
    _getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();

    return Scaffold(
      appBar: appBar(),
      // backgroundColor: Colors.white,
      body: ListView(
        children: [
          searchField(),
          const SizedBox(height: 40),
          categoriesSection(),
          const SizedBox(height: 40),
          dietSelector(),
          const SizedBox(height: 40),
          popularDietSelector()
        ],
      ),
    );
  }

  Column popularDietSelector() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Popular',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            const SizedBox(height: 15),
            ListView.separated(
              shrinkWrap: true,
              itemCount: popularDiets.length,
              separatorBuilder: (context, index) => SizedBox(height: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
              itemBuilder: (context, index) {
                return Container(
                  height: 120,
                  decoration: BoxDecoration(
                      color: popularDiets[index].boxIsSelected
                          ? Colors.white
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: popularDiets[index].boxIsSelected
                                ? Colors.black38.withOpacity(0.3)
                                : Colors.transparent,
                            offset: Offset(0, 10),
                            blurRadius: 40.0,
                            spreadRadius: 0)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 70,
                          height: 70,
                          child:
                              SvgPicture.asset(popularDiets[index].iconPath)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(popularDiets[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16,
                              )),
                          Text(popularDiets[index].level +
                              '|' +
                              popularDiets[index].duration +
                              '|' +
                              popularDiets[index].calorie)
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset('icons/Arrow-circle.svg',
                            height: 30, width: 30),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        );
  }

  Column dietSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('Recommendation\n for Diet',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            itemCount: diets.length,
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemBuilder: (context, index) {
              return Container(
                width: 170,
                decoration: BoxDecoration(
                  color: diets[index].boxColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        child: SvgPicture.asset(diets[index].iconPath),
                      ),
                      Text(
                        diets[index].name,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                          '${diets[index].level}|${diets[index].duration}|${diets[index].calorie}',
                          style: TextStyle(color: Colors.black)),
                      GestureDetector(
                          onTap: () {
                            toggleView(index);
                          },
                          child: Container(
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    diets[index].viewIsSelected
                                        ? Color(0xFF64BEFF)
                                        : Colors.transparent,
                                    diets[index].viewIsSelected
                                        ? Color(0xFF4685B2)
                                        : Colors.transparent,
                                  ])),
                              child: Center(
                                  child: Text("View",
                                      style: TextStyle(
                                          color: diets[index].viewIsSelected
                                              ? Colors.white
                                              : Colors.black54,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)))))
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Column categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('Category',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 150,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => SizedBox(width: 25),
            itemBuilder: (context, index) {
              return Container(
                width: 130,
                decoration: BoxDecoration(
                  color: categories[index].boxColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(8.5),
                        child: SvgPicture.asset(categories[index].iconPath),
                      ),
                    ),
                    Text(categories[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 16,
                        )),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Container searchField() {
    return Container(
        margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.19),
              spreadRadius: 0,
              blurRadius: 40,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(15),
                hintText: 'Search for pankcakes',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset('icons/search.svg',
                      height: 25, width: 25),
                ),
                suffixIcon: Container(
                  width: 100,
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const VerticalDivider(
                          color: Colors.black,
                          indent: 10,
                          endIndent: 10,
                          thickness: 0.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: SvgPicture.asset('icons/filter.svg',
                              height: 25, width: 25),
                        ),
                      ],
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none))));
  }

  AppBar appBar() {
    return AppBar(
        title: const Text('Breakfast',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              'assets/icons/left-arrow.svg',
              height: 20,
              width: 20,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              width: 37,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                'assets/icons/dots.svg',
                height: 20,
                width: 20,
              ),
            ),
          )
        ]);
  }
}
