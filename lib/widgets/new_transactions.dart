import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
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
    onPressedCallback(sanitisedTitle, sanitisedAmount, false);
  }

  final Function onPressedCallback;

  NewTransactions(this.onPressedCallback);

  @override
  Widget build(BuildContext buildContext) {
    return Card(
      // elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
