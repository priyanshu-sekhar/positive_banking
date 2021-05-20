import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:positive_banking/bloc/ownership_bloc.dart';
import 'package:positive_banking/widgets/header.dart';
import 'package:positive_banking/widgets/text_decorator.dart';
import 'package:provider/provider.dart';

class OwnershipScreen extends StatelessWidget {
  static const route = '/ownership';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: inputSection(context),
    );
  }

  Widget inputSection(BuildContext context) {
    final OwnershipBloc bloc =
    Provider.of<OwnershipBloc>(context);

    return Container(
      margin: EdgeInsets.only(left: 60, right: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 70)),
          balance(bloc),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          txn1(bloc),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          txn2(bloc),
          Padding(padding: EdgeInsets.only(bottom: 30)),
          submit(bloc, context),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Text(
            'Good Shares',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          sharesWidget(bloc),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Text(
            'Good Impact',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          impactWidget(bloc)
        ],
      ),
      // color: Colors.orange,
    );
  }

  Widget balance(OwnershipBloc bloc) {
    return Container(
      height: 40,
      child: StreamBuilder(
        stream: bloc.balance,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            decoration: TextDecorator.textFieldDecoration(
              hintText: 'Average Balance in USD',
              errorText: snapshot.error,
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
            onChanged: bloc.changeBalance,
          );
        },
      ),
    );
  }

  Widget txn1(OwnershipBloc bloc) {
    return Container(
      height: 40,
      child: StreamBuilder(
        stream: bloc.txn1,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            decoration: TextDecorator.textFieldDecoration(
              hintText: 'Transaction 1 in USD',
              errorText: snapshot.error,
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
            onChanged: bloc.changeTxn1,
          );
        },
      ),
    );
  }

  Widget txn2(OwnershipBloc bloc) {
    return Container(
      height: 40,
      child: StreamBuilder(
        stream: bloc.txn2,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            decoration: TextDecorator.textFieldDecoration(
              hintText: 'Transaction 2 in USD',
              errorText: snapshot.error,
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
            onChanged: bloc.changeTxn2,
          );
        },
      ),
    );
  }

  Widget submit(OwnershipBloc bloc, BuildContext context) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return Column(
          children: [
            ElevatedButton(
                child: Text("Submit"),
                style: buildButtonStyle(snapshot.hasData, context),
                onPressed: !snapshot.hasData ? null : () => bloc.submit(context)
            )
          ],
        );
      },
    );
  }

  Widget sharesWidget(OwnershipBloc bloc) {
    return StreamBuilder(
      stream: bloc.shares,
      builder: (context, AsyncSnapshot<double> snapshot) {
        if (snapshot.hasData) {
          return Text(
            '${snapshot.data} \$',
            style: TextStyle(color: Colors.grey[500], fontSize: 12),
          );
        }

        return Container();
      }
    );
  }

  Widget impactWidget(OwnershipBloc bloc) {
    return StreamBuilder(
      stream: bloc.acres,
      builder: (context, AsyncSnapshot<double> snapshot) {
        if (snapshot.hasData) {
          double acres = snapshot.data;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              numberOfAcresWidget(acres),
              numberOfTreesWidget(acres),
              numberOfAnimalsWidget(acres)
            ],
          );
        }
        return Container();
      }
    );
  }

  Widget numberOfAcresWidget(double acres) {
    return Text(
        '$acres acres',
        style: TextStyle(color: Colors.grey[600], fontSize: 12)
    );
  }

  Widget numberOfTreesWidget(double acres) {
    return Text(
        "${(acres * 900).toInt()} trees",
        style: TextStyle(color: Colors.grey[600], fontSize: 12)
    );
  }

  Widget numberOfAnimalsWidget(double acres) {
    return Text(
        '${(acres * 12000).toInt()} animals',
        style: TextStyle(color: Colors.grey[600], fontSize: 12)
    );
  }

  ButtonStyle buildButtonStyle(bool isValid, BuildContext context) {
    Color color = Theme
        .of(context)
        .colorScheme
        .primary;

    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (!isValid)
            return color.withOpacity(0.5);
          return color;
        },
      ),
      // backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF1071E2)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      padding: MaterialStateProperty.all(
          EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12)),
    );
  }
}