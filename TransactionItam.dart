import 'dart:math';

import 'package:flutter/material.dart';
import './Transactions.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
   TransactionItem({
    Key key,
    @required this.trans,
    @required this.remove_transaction,
  }) : super(key: key);

  final transactions trans;
  final Function remove_transaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color back_color; 
  @override
  void initState() {
    // TODO: implement initState
    const colors_back=[Colors.black,Colors.blue,Colors.red,Colors.pink];
    back_color=colors_back[Random().nextInt(4)];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(  
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      elevation: 5,
      child: ListTile(leading: CircleAvatar(radius: 30,
     //backgroundColor: back_color,
    child: Padding(
      padding: EdgeInsets.all(6),
      child: FittedBox(child: Text('\$ ${widget.trans.amount}'),)),),
    title: Text(widget.trans.title, style: Theme.of(context).textTheme.headline6,),
    subtitle: Text(DateFormat.yMMMd().format(widget.trans.date)),
    trailing: MediaQuery.of(context).size.width<=460? IconButton(icon: Icon(Icons.delete,), 
    onPressed: ()=>widget.remove_transaction(widget.trans.id),
    color: Theme.of(context).errorColor,):
    FlatButton.icon(onPressed:  ()=>widget.remove_transaction(widget.trans.id), icon: Icon(Icons.delete,),
     label: Text('Delete'),
     textColor: Theme.of(context).errorColor,)
    ),
      );
  }
}