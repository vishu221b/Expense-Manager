import 'package:flutter/material.dart';

class NewTransactions extends StatefulWidget {
  final Function onPressedCallback;

  NewTransactions(this.onPressedCallback);

  @override
  _NewTransactionsState createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final titleText = TextEditingController();

  final amountText = TextEditingController();

  void _submitTransactionData(){
    final String sanitisedTitle = titleText.text;
    final String initialAmount = amountText.text;
    if (sanitisedTitle.length <= 0 || initialAmount.length <= 0){
      print("Sanitization failed, returning......");
      return;
    }
    final double sanitisedAmount = double.parse(initialAmount);
    widget.onPressedCallback(sanitisedTitle, sanitisedAmount, false);
    Navigator.of(context).pop();// closes the modal once values are submitted inside the Expense Modal
  }
// widget and context are built in keywords available inside State class to refer to the parameters/methods in it's parent stateful widget or the context from it
  @override
  Widget build(BuildContext buildContext) {
    return Card(
      // elevation: 5,
      child: Container(
        height: 250,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              onSubmitted: (_) {
                print(_);
                _submitTransactionData();
                },
              controller: titleText,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitTransactionData(),
              controller: amountText,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              onPressed: _submitTransactionData,
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
