import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Models/home_model.dart';

//fetches the future data...
Future<List<Stock>> fetchStockData() async {
  try {
    final CollectionReference stocksCollection =
    FirebaseFirestore.instance.collection('StockData');
    final QuerySnapshot querySnapshot = await stocksCollection.get();

    // Debug: Log the fetched documents
    for (var doc in querySnapshot.docs) {
      print(doc.data());
    }

    return querySnapshot.docs
        .map((doc) => Stock.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  } catch (e) {
    // Better error handling
    print('Error fetching stock data: $e');
    throw Exception('Error fetching stock data: $e');
  }
}


//fetches the real time data...
Stream<List<Stock>> fetchRealTimeStockData() {
  try {
    final CollectionReference stocksCollection =
    FirebaseFirestore.instance.collection('StockData');

    // Use snapshots() to listen for real-time updates
    return stocksCollection.snapshots().map((querySnapshot) {
      // Log the document data as you process each one
      querySnapshot.docs.forEach((doc) {
        print("Received document data: ${doc.data()}");
      });
      // Convert the querySnapshot to a list of Stock objects
      return querySnapshot.docs
          .map((doc) => Stock.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    });
  } catch (e) {
    // Error handling if necessary
    print('Error fetching stock data: $e');
    throw Exception('Error fetching stock data: $e');
  }
}