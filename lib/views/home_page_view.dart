import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<String> images = [
    "assets/images/carousel1.png",
    "assets/images/carousel2.png",
    "assets/images/carousel3.png",
  ];

  var _dotPosition = 0;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HomeHeader(),
          CarouselSlider(
            options: CarouselOptions(
              height: screenHeight * 0.2,
              initialPage: 0,
              aspectRatio: 16 / 9,
              viewportFraction: 0.95,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                  _dotPosition = index;
                });
              },
            ),
            items: images.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: screenWidth,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(image),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          DotsIndicator(
            dotsCount: images.isEmpty ? 1 : images.length,
            position: _dotPosition,
            decorator: const DotsDecorator(
              activeColor: Color.fromARGB(255, 12, 59, 36),
              color: Colors.green,
              spacing: EdgeInsets.all(2),
              activeSize: Size(8, 8),
              size: Size(6, 6),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          CategorySection(),
          const SizedBox(height: 10,),
          ProductSection(),
        ],
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      child: Row(children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.05,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 224, 223, 223),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const TextField(
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "Search product",
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.green,
                )),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color:
                Colors.greenAccent, // Adjust the color according to your design
          ),
          child: IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white, size: 30,),
            onPressed: () {
              // Add your notification logic here
            },
          ),
        ),
      ]),
    );
  }
}

class CategorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(screenWidth * 0.03),
          child: Text(
            'Categories',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CategoryCard(
                  categoryName: 'Hen', imagePath: 'assets/icons/hen.svg'),
              CategoryCard(
                  categoryName: 'Buff', imagePath: 'assets/icons/buffalo.svg'),
              CategoryCard(
                  categoryName: 'Goat', imagePath: 'assets/icons/goat.svg'),
              CategoryCard(
                  categoryName: 'Seafood',
                  imagePath: 'assets/icons/sausage.svg'),
              // Add more CategoryCard widgets as needed
            ],
          ),
        ),
      ],
    );
  }
}

class ProductSection extends StatelessWidget {
  // Predefined list of product details
  final List<Map<String, String>> productList = [
    {"name": "Fresh Ocean Catch", "price": "19.99"},
    {"name": "Jumbo Ocean Prawns", "price": "29.99"},
    {"name": "Skinless & Trimmed Chicken", "price": "14.99"},
    {"name": "Lean and Tender buff", "price": "24.99"},
    {"name": "Nutrient-Rich Organ Meat", "price": "22.99"},
    {"name": "Succulent Pork Cuts", "price": "17.99"},
    {"name": "Chicken sausage with pickle", "price": "17.99"},
    {"name": "Chicken Drumstick", "price": "17.99"},
  ];

  ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: Text(
            'Featured Products',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: screenWidth * 0.03,
            mainAxisSpacing: screenWidth * 0.03,
            childAspectRatio: 0.7,
          ),
          itemCount: productList.length,
          itemBuilder: (context, index) {
            // Access product details from the predefined list
            String productName = productList[index]["name"] ?? "Unknown";
            String price = productList[index]["price"] ?? "0.00";

            return ProductCard(
              productName: productName,
              price: price,
              imagePath: 'assets/images/${index + 1}.png',
            );
          },
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final String price;
  final String imagePath;

  ProductCard(
      {required this.productName,
      required this.price,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      margin: EdgeInsets.all(screenWidth * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: screenWidth * 0.4,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: screenWidth * 0.02),
          Center(
            child: Text(
              productName,
              style: Theme.of(context).textTheme.displayMedium
            ),
          ),
          SizedBox(height: screenWidth * 0.01),
          Center(
            child: Text(
              '\$$price',
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final String imagePath;

  CategoryCard({required this.categoryName, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Card(
      color: Color(0xFF7ED957),
      elevation: 0,
      margin: EdgeInsets.all(screenWidth * 0.03),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Column(
          children: [
            SvgPicture.asset(
              imagePath,
              height: screenWidth * 0.12,
              width: screenWidth * 0.12,
              fit: BoxFit.cover,
            ),
            SizedBox(height: screenWidth * 0.02),
            Text(
              categoryName,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}



