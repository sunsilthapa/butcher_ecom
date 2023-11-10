import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meat Shop Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for meat...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enableInfiniteScroll: true,
                autoPlay: true,
              ),
              items: [
                // Add your carousel items here
                Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text('Carousel Item 1'),
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: Center(
                    child: Text('Carousel Item 2'),
                  ),
                ),
                Container(
                  color: Colors.red,
                  child: Center(
                    child: Text('Carousel Item 3'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryCard('Beef', 'assets/beef.jpg'),
                  CategoryCard('Chicken', 'assets/chicken.jpg'),
                  CategoryCard('Pork', 'assets/pork.jpg'),
                  CategoryCard('Lamb', 'assets/lamb.jpg'),
                  CategoryCard('Seafood', 'assets/seafood.jpg'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Meat Items',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  MeatItemCard('Beef Steak', 'assets/beef_steak.jpg'),
                  MeatItemCard('Grilled Chicken', 'assets/grilled_chicken.jpg'),
                  MeatItemCard('Pork Ribs', 'assets/pork_ribs.jpg'),
                  MeatItemCard('Lamb Chops', 'assets/lamb_chops.jpg'),
                  MeatItemCard('Shrimp', 'assets/shrimp.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CategoryCard extends StatelessWidget {
  final String name;
  final String imagePath;

  CategoryCard(this.name, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text(name),
        ],
      ),
    );
  }
}

class MeatItemCard extends StatelessWidget {
  final String name;
  final String imagePath;

  MeatItemCard(this.name, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text(name),
        ],
      ),
    );
  }
}
