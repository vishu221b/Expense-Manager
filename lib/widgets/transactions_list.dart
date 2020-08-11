import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Transactions extends StatelessWidget {
  final List<Transaction> transactionsList;

  Transactions(this.transactionsList);

  @override
  Widget build(BuildContext buildContext) {
    return Container(
        height: 480,
        child: transactionsList.isEmpty
            ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // SizedBox(
                  //   height: 50,
                  // ),
                  Text(
                    'No transactions found yet :(',
                    style: Theme.of(buildContext).textTheme.title,
                  ),
                  // SizedBox(
                  //   height: 50,
                  // ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemCount: transactionsList.length,
                itemBuilder: (buildContext, index) {
                  return Card(
                    child: Row(children: [
                      Container(
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(buildContext).accentColor,
                            style: BorderStyle.solid,
                            width: 4,
                          ),
                        ),
                        child: Text(
                          '\$${transactionsList[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            color: Theme.of(buildContext).accentColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transactionsList[index].title,
                            style: Theme.of(buildContext).textTheme.title,
                            // style: TextStyle(
                            //   fontSize: 18,
                            //   fontWeight: FontWeight.bold,
                            // ),
                          ),
                          Text(
                            DateFormat('E  MM-dd-y  H:m')
                                .format(transactionsList[index].date),
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
