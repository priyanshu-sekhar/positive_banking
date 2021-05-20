import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class OwnershipBloc {
  final _balance = BehaviorSubject<String>();
  final _txn1 = BehaviorSubject<String>();
  final _txn2 = BehaviorSubject<String>();
  final _acres = BehaviorSubject<double>();
  final _shares = BehaviorSubject<double>();

  // Function(String) get changeBalance => _balance.add;
  Function(String) get changeTxn1 => _txn1.add;
  Function(String) get changeTxn2 => _txn2.add;

  Stream<String> get balance => _balance;
  Stream<String> get txn1 => _txn1;
  Stream<String> get txn2 => _txn2;
  Stream<bool> get submitValid => CombineLatestStream([txn1, txn2], (values) => true);
  Stream<double> get acres => _acres;
  Stream<double> get shares => _shares;

  changeBalance(String value) {
    _balance.add(value);
    final shares = min<double>(1000, double.parse(value)) * 0.0005;
    _shares.add(shares);
  }

  submit(BuildContext context) async {
    final validTxn1 = _txn1.value;
    final validTxn2 = _txn2.value;


    final acres = (double.parse(validTxn1) + double.parse(validTxn2)) * 0.03;
    _acres.add(acres);
  }

  dispose() {
    _balance.close();
    _txn1.close();
    _txn2.close();
    _acres.close();
    _shares.close();
  }
}