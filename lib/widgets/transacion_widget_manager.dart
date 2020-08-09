import 'package:flutter/material.dart';

import './new_transactions.dart';
import './transactions_list.dart';
import '../models/transaction.dart';

class TransactionManager extends StatefulWidget {
  @override
  _TransactionManagerState createState() => _TransactionManagerState();
}

class _TransactionManagerState extends State<TransactionManager> {
  final List<Transaction> transactionsList = [
    Transaction(
      id: "1",
      title: "Title",
      amount: 1231123.312,
      date: DateTime.now(),
    ),
    Transaction(
      id: "2",
      title: "Title",
      amount: 13.312,
      date: DateTime.now(),
    ),
    Transaction(
      id: "3",
      title: "Title",
      amount: 123.312,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount, bool error) {
    if (error){
      setState((){
        
      });
    }
    Transaction newTransactionValue = Transaction(
      id: DateTime.now().millisecond.toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );
    setState(() {
      transactionsList.add(newTransactionValue);
    });
  }

  @override
  Widget build(BuildContext buildContext) {
    return Column(children: <Widget>[
      NewTransactions(_addNewTransaction),
      Transactions(transactionsList),
    ]);
  }
}
