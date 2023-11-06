import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubit/delete_cubit.dart';
import 'package:grocery_app/cubit/item_cubit.dart';
import 'package:grocery_app/cubit/item_observer.dart';
import 'package:grocery_app/cubit/read_item_cubit.dart';
import 'package:grocery_app/models/item_modal_column.dart';
import 'package:grocery_app/screens/login_signIn/login_screen.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ItemModelColumnAdapter());
  await Hive.openBox<ItemModelColumn>("itemBox");
  Bloc.observer = ItemObserver();
  final pref = await SharedPreferences.getInstance();
  final showHome = pref.getBool("showHome") ?? false;
  runApp(MyApp(
    showHome: showHome,
  ));
}

class MyApp extends StatelessWidget {
  final showHome;
  MyApp({required this.showHome});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ItemCubit()),
        BlocProvider(create: (context) => ReadItemCubit()),
        BlocProvider(create: (context) => DeleteCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: showHome ? HomeScreen() : IntoScreen(),
        home: LoginScreen(),
      ),
    );
  }
}
