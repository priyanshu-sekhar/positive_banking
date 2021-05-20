import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:positive_banking/bloc/ownership_bloc.dart';
import 'package:positive_banking/screens/ownership_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  static const String rootRoute = '/';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => OwnershipBloc())
      ],
      child: MaterialApp(
        title: "Positive Banking",
        theme: ThemeData(
          primaryColor: Color(0xFF1071E2),
        ),
        routes: {
          rootRoute: (context) => OwnershipScreen()
        }
      ),
    );
  }

}