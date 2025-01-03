import 'package:flutter/material.dart';
import '../BackEnd/Data/Firestore/StockData.dart';
import '../BackEnd/Models/home_model.dart'; // Import fetchStockData function

class StockDataProvider extends StatefulWidget {
  final Function(List<Stock>) onDataReady; // Callback for passing data to the parent

  const StockDataProvider({Key? key, required this.onDataReady}) : super(key: key);

  @override
  State<StockDataProvider> createState() => _StockDataProviderState();
}

class _StockDataProviderState extends State<StockDataProvider> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Stock>>(
      future: fetchStockData(), // Fetch data from Firestore
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No stock data available'));
        }

        // Invoke the callback with the fetched data
        widget.onDataReady(snapshot.data!);

        // Return an empty container since UI rendering will happen elsewhere
        return const SizedBox.shrink();
      },
    );
  }
}


class StockDataRealTime extends StatefulWidget {
  const StockDataRealTime({super.key});

  @override
  State<StockDataRealTime> createState() => _StockDataRealTimeState();
}

class _StockDataRealTimeState extends State<StockDataRealTime> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: fetchRealTimeStockData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No stock data available'));
          }
          // Access the data when it's available
          if (snapshot.connectionState == ConnectionState.active) {
            print('Received data: ${snapshot.data!}');
            WidgetsBinding.instance.addPostFrameCallback((_) {
              // Update ValueNotifier outside the build phase
              stockNotifier.value = snapshot.data!;
            });
            // Now you can safely use the stocks list
          }
          return const SizedBox.shrink();
        }
        );
  }
}
