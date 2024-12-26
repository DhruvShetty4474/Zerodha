import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../BackEnd/Navigation/navigation.dart';
import '../../Components/resuable_textfield.dart';
import 'logic.dart';

///Need MORE...
///1. NEED TO ADD MORE COMPONENTS IN THE HOMEPAGE TO LOOK ALIKE ZERODHA HOMEPAGE..

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  // @override
  // void initState() {
  //   super.initState();
  //   _selectedIndex = ValueNotifier<int>(0);
  // }

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }


  final List<String> menuOptions = [
    'Favorites',
    'My list',
    'Must watch',
    'Random',
    'More',
    'Trending',
    'Top picks',
  ];

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF000000),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                title: Text(
                  'Watchlist',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: _height * 0.035,
                      fontWeight: FontWeight.bold),
                ),
                actions: [
                  /// A drop Down button which will show a widget when clicked...
                  IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.grey[400],
                      size: _height * 0.05,
                    ),
                    onPressed: () {},
                  ),
                ],
                backgroundColor: const Color(0xFF000000),
                floating: false, // AppBar doesn't float above content
                pinned: false, // AppBar will scroll out of view
                snap: false, // No snapping effect
                clipBehavior: Clip.antiAliasWithSaveLayer, // Smooth edges
              ),

              // List of menu options....
              SliverAppBar(
                toolbarHeight:
                    _height * 0.05, //The minimum Height of the SliverAppbar
                automaticallyImplyLeading: false,
                expandedHeight: _height * 0.05,
                collapsedHeight: _height * 0.05,
                backgroundColor: const Color(0xFF000000),
                floating: false,
                pinned: true,
                snap: false,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                flexibleSpace: SizedBox(
                  height: _height * 0.05, // Fixed height for the bar
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: menuOptions.length, // Dynamic menu options
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: _width / 4, // Exactly 4 items fit the screen
                        child: GestureDetector(
                          onTap: () {
                            // Handle click
                            _selectedIndex.value = index;
                            // print('${menuOptions[index]} clicked');
                            print('${menuOptions[index]} clicked');
                          },
                          child: ValueListenableBuilder<int>(
                              valueListenable: _selectedIndex,
                              builder: (context, value, child) {
                                return  Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        menuOptions[index],
                                        style: TextStyle(
                                          color: value == index
                                              ? Colors.blue // Change text color when clicked
                                              : Colors.grey[400],
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // Blue underline when clicked
                                      if ( value == index)
                                        Container(
                                          margin: const EdgeInsets.only(top: 4.0),
                                          height: 2.0,
                                          width: 30.0, // Width of the underline
                                          color: Colors.blue,
                                        ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ];
          },
          body: Column(
            children: [

              Expanded(
                child: ListView.builder(
                  itemCount:
                      51, // Total items (50 items + 1 for the search bar widget)
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      // Return the search bar widget as the first item
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.065,
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Icon(Iconsax.search_normal_14,
                                  color: Colors.grey[400],
                                  size: MediaQuery.of(context).size.height *
                                      0.0255),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Text(
                                'Search & add',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.020,
                                ),
                              ),
                              const Spacer(),
                              VerticalDivider(
                                color: Colors.grey[800],
                                thickness: 1.0,
                                indent: 15.0,
                                endIndent: 15.0,
                                width: 1.0,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  MdiIcons.tuneVertical,
                                  color: Colors.white,
                                  size: MediaQuery.of(context).size.height *
                                      0.0255,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      // Return the list items


                      ///Need to show a widget from below when list item is clicked...
                      ///every item has its own widget eg when clicked it should change the info
                      ///accordingly....
                      return Column(
                        children: [
                          SizedBox(
                            height: _height /
                                9.28, // Exactly 6 items fit the screen
                            child: ListTile(
                              title: Text(
                                'SENSEX ${index - 1}', // Subtract 1 because the header takes index 0
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 3,
                            color: Colors.grey[900],
                            // color: Colors.white,
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClickableText(String text) {
    return GestureDetector(
      onTap: () {
        // Handle click event
        print('$text clicked');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 15.0), // Spacing between texts
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
    );
  }
}
