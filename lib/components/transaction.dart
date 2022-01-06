import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class TransactionList {
  final List<TransactionObj>? listTransactionObj;

  TransactionList({
    required this.listTransactionObj,
  });

  factory TransactionList.fromRTDB(Map<String, dynamic> data) {
    List<TransactionObj> rawTransactionObj = [];
    for (var x in data.keys) {
      final rawData = Map<String, dynamic>.from(data[x] as Map);
      rawTransactionObj.add(TransactionObj.fromRTDB(rawData));
    }
    return TransactionList(
      listTransactionObj: rawTransactionObj,
    );
  }

  //Returns a list of transaction id.
  List<String> getTransactionIdList() {
    List<String> _list = [];
    for (TransactionObj x in listTransactionObj!) {
      _list.add(x.transactionId);
    }
    return _list;
  }
}

class TransactionObj {
  final String transactionId;
  final String date; //Temporary fix.
  final List<ItemObj> item;
  final int totalAmount;

  TransactionObj({
    required this.transactionId,
    required this.date,
    required this.totalAmount,
    required this.item,
  });

  factory TransactionObj.fromRTDB(Map<String, dynamic> data) {
    List<ItemObj> tempItemList = [];
    Map<String, dynamic> items =
        Map<String, dynamic>.from(data['items'] as Map);
    for (var x in items.keys) {
      final temp = Map<String, dynamic>.from(items[x] as Map);
      tempItemList.add(ItemObj.fromMap(temp));
    }
    return TransactionObj(
      transactionId: data['TransactionId'] ?? "",
      date: data['Date'] ?? '1/1/2000',
      totalAmount: data['Total_Amount'] ?? 0.00,
      item: tempItemList,
    );
  }
}

class ItemObj {
  final int itemId;
  final int quantity;

  ItemObj({required this.quantity, required this.itemId});

  factory ItemObj.fromMap(Map<String, dynamic> data) {
    return ItemObj(
      quantity: data['Quantity'] ?? 0,
      itemId: data['ItemID'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "itemID": itemId,
        "quantity": quantity,
      };
}
