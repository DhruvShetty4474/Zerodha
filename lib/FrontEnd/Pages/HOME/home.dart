import 'package:flutter/material.dart';

import '../../../BackEnd/Navigation/navigation.dart';
import 'logic.dart';

///Need MORE...
///1. NEED TO ADD MORE COMPONENTS IN THE HOMEPAGE TO LOOK ALIKE ZERODHA HOMEPAGE..

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF000000),
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  title:  Text(
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
                ///Need to work on this as it should be scrollable horizontally and the text should be
                ///start from left to right...and has to be clickable...
                // SliverAppBar(
                //   automaticallyImplyLeading: false,
                //   backgroundColor: const Color(0xFF000000),
                //   floating: false, // AppBar doesn't float above content
                //   pinned: true, // AppBar remains visible when scrolling
                //   snap: false, // No snapping effect
                //   clipBehavior: Clip.antiAliasWithSaveLayer, // Smooth edges
                //   actions: [
                //     SingleChildScrollView(
                //       scrollDirection: Axis.horizontal, // Horizontal scrolling
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                //         children: [
                //           Text('Favorites', style: TextStyle(color: Colors.white),),
                //           Text('My list' ,style: TextStyle(color: Colors.white),),
                //           Text('Must watch' ,style: TextStyle(color: Colors.white),),
                //           Text('Random' ,style: TextStyle(color: Colors.white),),
                //           Text('Favorites', style: TextStyle(color: Colors.white),),
                //           Text('My list' ,style: TextStyle(color: Colors.white),),
                //           Text('Must watch' ,style: TextStyle(color: Colors.white),),
                //           Text('Random' ,style: TextStyle(color: Colors.white),),
                //           Text('Favorites', style: TextStyle(color: Colors.white),),
                //           Text('My list' ,style: TextStyle(color: Colors.white),),
                //           Text('Must watch' ,style: TextStyle(color: Colors.white),),
                //           Text('Random' ,style: TextStyle(color: Colors.white),),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),

              ];
            },
            body: Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fixed Row Left',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Text(
                        'Fixed Row Right',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 50, // Example items to scroll
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Item $index', style: TextStyle(color: Colors.white),),
                      );
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
