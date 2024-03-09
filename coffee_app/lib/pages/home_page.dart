// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_super_parameters, sized_box_for_whitespace
import 'package:coffee_shop/util/coffee_tiles.dart';
import 'package:coffee_shop/util/coffee_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List of coffee types
  final List coffeeType = [
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Ice',
      false,
    ],
  ];
  //user tapped on coffee item
  void coffeeTypeSelected(int index) {
    setState(() {

      //this loop makes every selection false
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black12,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ),
      body: Column(
        children: [
          //find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Find the best Coffee for you',
              style: GoogleFonts.bebasNeue(fontSize: 40),
            ),
          ),

          SizedBox(height: 25),

          //Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SizedBox(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Find your coffee....',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 25),

          //Horizontal listview of coffee types
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTap: () {
                    coffeeTypeSelected(index);
                  },
                );
              },
            ),
          ),

          //Horizontal listview of coffee tiles
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeImagePath: 'assets/images/image1.jpg',
                  coffeeName: 'Latte',
                  coffeePrice: '4',
                ),
                CoffeeTile(
                  coffeeImagePath: 'assets/images/image1.jpg',
                  coffeeName: 'Cappicino',
                  coffeePrice: '5.99',
                ),
                CoffeeTile(
                  coffeeImagePath: 'assets/images/image1.jpg',
                  coffeeName: 'Black',
                  coffeePrice: '4.30',
                ),
                CoffeeTile(
                  coffeeImagePath: 'assets/images/image1.jpg',
                  coffeeName: 'Mil Coffee',
                  coffeePrice: '5.30',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
