
import 'package:flutter/material.dart';

final List<String> SerachBarOptions = [
  '#',
  'ETF',
  'MF',
  'IPO',
  'G-Sec',
];

//List of menu options
final List<String> menuOptions = [
  'Favorites',
  'My list',
  'Must watch',
  'Random',
  'More',
  'Trending',
  'Top picks',
];

//List of stock data.....
final List<Map<String, dynamic>> stockData = [
  {
    'name': 'GOLDBEES',
    'exchange': 'NSE',
    'price': 64.00,
    'priceChange': 0.32,
    'priceChangePercentage': 0.50,
  },
  {
    'name': 'HDFCBANK',
    'exchange': 'NSE',
    'price': 1790.75,
    'priceChange': -7.35,
    'priceChangePercentage': -0.40,
  },
  {
    'name': 'HINDUNILVR',
    'exchange': 'NSE',
    'price': 2332.75,
    'priceChange': -2.80,
    'priceChangePercentage': -0.11,
  },
  {
    'name': 'INFY',
    'exchange': 'NSE',
    'price': 1907.40,
    'priceChange': -1.65,
    'priceChangePercentage': -0.08,
  },
  {
    'name': 'ONGC',
    'exchange': 'NSE',
    'price': 240.25,
    'priceChange': 1.30,
    'priceChangePercentage': 0.54,
  },
  {
    'name': 'TCS',
    'exchange': 'NSE',
    'price': 4169.10,
    'priceChange': -10.40,
    'priceChangePercentage': -0.24,
  },
  {
    'name': 'TATAMOTORS',
    'exchange': 'NSE',
    'price': 740.80,
    'priceChange': 4.70,
    'priceChangePercentage': 0.63,
  },
  {
    'name': 'TATASTEEL',
    'exchange': 'NSE',
    'price': 138.91,
    'priceChange': -1.45,
    'priceChangePercentage': -1.03,
  },
  {
    'name': 'TATATECH',
    'exchange': 'NSE',
    'price': 898.85,
    'priceChange': -1.65,
    'priceChangePercentage': -0.18,
  },
  {
    'name': 'WIPRO',
    'exchange': 'NSE',
    'price': 309.10,
    'priceChange': 4.05,
    'priceChangePercentage': 1.32,
  },
  {
    'name': 'BANKBARODA',
    'exchange': 'NSE',
    'price': 244.99,
    'priceChange': -1.69,
    'priceChangePercentage': -0.68,
  },
  {
    'name': 'KOTAKBANK',
    'exchange': 'NSE',
    'price': 1759.90,
    'priceChange': 7.10,
    'priceChangePercentage': 0.40,
  },
  // Add more stocks as needed
];



// List<Map<String, dynamic>> AddingFavoraitesStocksList(List<String> names) {
//   return stockData.where((stock) => names.contains(stock['name'])).toList();
// }
//
// final List<String> favoriteNames = ['GOLDBEES', 'HDFCBANK', 'TCS'];
//
// final List<Map<String, dynamic>> favoritesStocks = AddingFavoraitesStocksList(favoriteNames);

// List of stock data which gets updated from firestore through Streambuilder,..
ValueNotifier<List<Stock>> stockNotifier = ValueNotifier<List<Stock>>([]);

// Class to represent StockData...
class Stock {
  final String name;
  final String exchange;
  final double price;
  final double priceChange;
  final double priceChangePercentage;

  Stock({
    required this.name,
    required this.exchange,
    required this.price,
    required this.priceChange,
    required this.priceChangePercentage,
  });

  factory Stock.fromMap(Map<String, dynamic> map) {
    return Stock(
      name: map['name'] as String,
      exchange: map['exchange'] as String,
      price: (map['price'] as num).toDouble(),
      priceChange: (map['priceChange'] as num).toDouble(),
      priceChangePercentage: (map['priceChangePercentage'] as num).toDouble(),
    );
  }
}

