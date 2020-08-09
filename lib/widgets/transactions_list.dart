import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Transactions extends StatelessWidget {
  final List<Transaction> transactionsList;

  Transactions(this.transactionsList);

  @override
  Widget build(BuildContext buildContext) {
    return Container(
        height: 440,
        child: ListView.builder(
          itemCount: transactionsList.length,
          itemBuilder: (buildContext, index) {
            return Card(
              child: Row(children: [
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.blue,
                        style: BorderStyle.solid,
                        width: 4),
                  ),
                  child: Text(
                    '\$${transactionsList[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        color: Colors.blue),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactionsList[index].title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat('E  MM-dd-y  H:m').format(transactionsList[index].date),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ]),
            );
          },
        ));
  }
}
