import 'package:http/http.dart' as http;
import 'dart:convert';

// Define a class to store stock data
class Stock {
  final String symbol;
  final double price;
  final double priceChange;
  final double priceChangePercentage;

  Stock({
    required this.symbol,
    required this.price,
    required this.priceChange,
    required this.priceChangePercentage,
  });

  // Convert the JSON data to Stock object
  factory Stock.fromJson(Map<String, dynamic> json, String symbol) {
    return Stock(
      symbol: symbol,
      price: json['regularMarketPrice'],
      priceChange: json['regularMarketChange'],
      priceChangePercentage: json['regularMarketChangePercent'],
    );
  }
}

Future<List<Stock>> fetchStockData(List<String> symbols) async {
  final String baseUrl = 'https://query1.finance.yahoo.com/v7/finance/quote';
  List<Stock> stockList = [];

  try {
    // Loop over the list of symbols
    for (String symbol in symbols) {
      final String url = '$baseUrl?symbols=$symbol';

      // Send GET request
      final response = await http.get(Uri.parse(url));

      // If the request is successful
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> result = data['quoteResponse']['result'];

        if (result.isNotEmpty) {
          // Parse stock data and add it to the list
          stockList.add(Stock.fromJson(result[0], symbol));
        }
      } else {
        throw Exception('Failed to load stock data');
      }
    }

    return stockList;
  } catch (e) {
    print('Error fetching data: $e');
    return [];
  }
}

void getStockData() async {
  List<String> symbols = ['TCS.NS', 'GOLDBEES.BO']; // Example: NSE and BSE symbols
  List<Stock> stocks = await fetchStockData(symbols);

  // Print the stock data
  for (Stock stock in stocks) {
    print('Stock: ${stock.symbol}');
    print('Price: ${stock.price}');
    print('Price Change: ${stock.priceChange}');
    print('Price Change Percentage: ${stock.priceChangePercentage}');
    print('---');
  }
}

void main() {
  getStockData();  // Fetch stock data and print it
}
