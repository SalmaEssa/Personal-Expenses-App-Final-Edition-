import 'package:flutter/material.dart';
import './Transactions.dart';
import './TransactionItam.dart';

class transactions_list extends StatelessWidget {
  @override
  final List<transactions> trans;
  final Function remove_transaction;
  transactions_list(this.trans,this.remove_transaction);
  
  Widget build(BuildContext context) {
    return Container(
      height: 450,

      child: trans.isEmpty? LayoutBuilder(builder:(contx, constrains){
        return Column(
        children: <Widget>[
          Text("No Transaction added yet!", style: Theme.of(context).textTheme.headline6,),
          SizedBox(height: 20,),
          Container(
            height: constrains.maxHeight*0.6,
            child:  Image.asset('assets/Images/waiting.png', fit: BoxFit.cover,),
          )
        ],
      ) ;
      }) :
       ListView.builder(itemCount: trans.length,itemBuilder: (cnx, ind){
        return TransactionItem(key: ValueKey(trans[ind].id),  trans: trans[ind], remove_transaction: remove_transaction);
          
        

      },),
    );
  }
}

