import 'dart:developer';

import 'package:flutter/material.dart';

class StockListItem extends StatelessWidget {
  final String stockName;
  final String exchange;
  final double price;
  final double priceChange;
  final double priceChangePercentage;
  final double itemHeight;
  // final VoidCallback onTap;

  const StockListItem({
    super.key,
    required this.stockName,
    required this.exchange,
    required this.price,
    required this.priceChange,
    required this.priceChangePercentage,
    required this.itemHeight,

    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPositive = priceChange >= 0;
    final Color textColor = isPositive ? Colors.green : Colors.red;
    final TextStyle primaryTextStyle =  TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
    final TextStyle secondaryTextStyle = TextStyle(
      fontSize: 14,
      color: Colors.grey[400],
    );

    return GestureDetector(
      onTap: (){
        log('Stock name: $stockName');
      },
      behavior: HitTestBehavior
          .opaque, // Ensures taps are detected anywhere in the widget
      child: Column(
        children: [
          SizedBox(
            height: itemHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left side - Stock name and exchange
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stockName,
                          style: primaryTextStyle.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          exchange,
                          style: secondaryTextStyle,
                        ),
                      ],
                    ),
                  ),
                  // Right side - Price and change
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        price.toStringAsFixed(2),
                        style: primaryTextStyle.copyWith(color: textColor),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${isPositive ? "+" : ""}${priceChange.toStringAsFixed(2)} (${isPositive ? "+" : ""}${priceChangePercentage.toStringAsFixed(2)}%)',
                        style: secondaryTextStyle.copyWith(color: textColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[900],
          ),
        ],
      ),
    );
  }
}
