import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/new_transactions.dart';
import './widgets/transactions_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      title: 'Expense Management Tool',
      home: HomePage(),
      theme: ThemeData(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
          primarySwatch: Colors.teal,
          accentColor: Colors.teal,
          fontFamily: 'Quicksand'),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> transactionsList = [];
    // Transaction(
    //   id: "1",
    //   title: "Title",
    //   amount: 1231123.312,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "2",
    //   title: "Title",
    //   amount: 13.312,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "3",
    //   title: "Title",
    //   amount: 123.312,
    //   date: DateTime.now(),
    // ),
  // ];/

  void _addNewTransaction(String title, double amount, bool error) {
    if (error) {
      setState(() {});
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

  void _addNewTransactionModal(BuildContext modalContext) {
    showModalBottomSheet(
      context: modalContext,
      builder: (contextWhichIsNotYetNeeded) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: NewTransactions(_addNewTransaction),
          onTap: () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Management Tool'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: () => _addNewTransactionModal(buildContext),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Colors.deepOrangeAccent,
              child: Card(
                color: Theme.of(context).primaryColorLight,
                child: Text('Chart Card'),
              ),
            ),
            Transactions(transactionsList),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addNewTransactionModal(buildContext),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
