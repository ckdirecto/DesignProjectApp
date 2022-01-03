import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class TransactionList {
  final List<TransactionObj>? listTransactionObj;

  TransactionList({
    required this.listTransactionObj,
  });

  factory TransactionList.fromRTDB(Map<String, dynamic> data) {
    List<TransactionObj>? rawTransactionObj;
    for (var x in data.keys) {
      Map<String, dynamic> rawData = data[x];
      rawTransactionObj!.add(TransactionObj.fromRTDB(rawData));
    }
    return TransactionList(
      listTransactionObj: rawTransactionObj,
    );
  }

  List<int> getTransactionIdList() {
    List<int> _list = [];
    for (TransactionObj x in listTransactionObj!) {
      _list.add(x.transactionId);
    }
    return _list;
  }
}

class TransactionObj {
  final int transactionId;
  final DateTime date;
  final List<ItemObj> item;
  final int totalAmount;

  TransactionObj({
    required this.transactionId,
    required this.date,
    required this.totalAmount,
    required this.item,
  });

  factory TransactionObj.fromRTDB(Map<String, dynamic> data) {
    return TransactionObj(
      transactionId: data['TransactionID'] ?? 0,
      date: data['Date'] ?? '1/1/2000',
      totalAmount: data['Total_Amount'] ?? 0.00,
      item: List<ItemObj>.from(data["items"].map((x) => ItemObj.fromMap(x))),
    );
  }

  int getTransactionId() {
    return transactionId;
  }
}

class ItemObj {
  final int itemId;
  final int quantity;

  ItemObj({required this.quantity, required this.itemId});

  factory ItemObj.fromMap(Map<String, dynamic> data) {
    return ItemObj(quantity: data['quantity'], itemId: data['itemID']);
  }

  Map<String, dynamic> toJson() => {
        "itemID": itemId,
        "quantity": quantity,
      };
}
