import 'package:flutter/material.dart';

import '../../../../BackEnd/Models/home_model.dart';
import '../../../Components/resuable_textfield.dart';
import '../components.dart';

class SearchUi extends StatefulWidget {
  const SearchUi({super.key});

  @override
  State<SearchUi> createState() => _SearchUiState();
}

class _SearchUiState extends State<SearchUi> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    final appBarHeight = const SliverAppBar().toolbarHeight;
    const bottomNavHeight = kBottomNavigationBarHeight;
    final searchBarHeight = height * 0.065; // Your search bar height

    // Calculate available height for list items
    final availableHeight =
        height - appBarHeight - bottomNavHeight - searchBarHeight;
    final itemHeight =
        availableHeight / 7.5; // Divide by 6 to fit exactly 6 items
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
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.grey[400],
                        size: height * 0.04,
                      )),
                  title: TextField(
                    cursorColor: Colors.blue,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.020,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search eg: infy bse, nifty fut',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: MediaQuery.of(context).size.height * 0.020,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                  ),
                  backgroundColor: const Color(0xFF000000),
                  floating: false, // AppBar doesn't float above content
                  pinned: true, // AppBar will scroll out of view
                  snap: false, // No snapping effect
                  clipBehavior: Clip.antiAliasWithSaveLayer, // Smooth edges
                ),
                SliverAppBar(
                  toolbarHeight:
                  height * 0.05, //The minimum Height of the SliverAppbar
                  automaticallyImplyLeading: false,
                  expandedHeight: height * 0.05,
                  collapsedHeight: height * 0.05,
                  backgroundColor: const Color(0xFF000000),
                  floating: false,
                  pinned: true,
                  snap: false,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  flexibleSpace: SizedBox(
                    height: height * 0.05, // Fixed height for the bar
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: SerachBarOptions.length, // Dynamic menu options
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: width / 4, // Exactly 4 items fit the screen
                          child: GestureDetector(
                            onTap: () {
                              // Handle click
                              _selectedIndex.value = index;
                              // print('${menuOptions[index]} clicked');
                              print('${SerachBarOptions[index]} clicked');
                            },
                            child: ValueListenableBuilder<int>(
                                valueListenable: _selectedIndex,
                                builder: (context, value, child) {
                                  return Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          SerachBarOptions[index],
                                          style: TextStyle(
                                            color: value == index
                                                ? Colors
                                                .blue // Change text color when clicked
                                                : Colors.grey[400],
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        // Blue underline when clicked
                                        if (value == index)
                                          AnimatedOpacity(
                                            opacity: value == index ? 1.0 : 0.0,
                                            duration:
                                            const Duration(milliseconds: 300),
                                            child: Container(
                                              height: 2.0,
                                              width:
                                              30.0, // Width of the underline
                                              color: Colors.blue,
                                            ),
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
            ///Temporary page need to make same as the search page..
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: favoritesStocks.length , // +1 for search bar
                    itemBuilder: (context, index) {
                        final stock = favoritesStocks[index ];
                        return StockListItem(
                          stockName: stock['name'],
                          exchange: stock['exchange'],
                          price: stock['price'],
                          priceChange: stock['priceChange'],
                          priceChangePercentage: stock['priceChangePercentage'],
                          itemHeight: itemHeight,
                        );
                      }
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
