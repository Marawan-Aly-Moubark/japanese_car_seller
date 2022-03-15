// ignore_for_file: must_be_immutable
import 'package:cars_seller/constants/strings.dart';
import 'package:flutter/material.dart';
import 'app_router.dart';
import 'helpers/shared_prefrences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(
    MyShop(
      appRouter: AppRouter(),
    ),
  );
}

class MyShop extends StatelessWidget {
  final AppRouter appRouter;

  MyShop({Key? key, required this.appRouter}) : super(key: key);
  String? token = CacheHelper.getData(key: 'token');

  String getInitialScreen(token) {
    if (token != null) {
      return carsScreen;
    } else {
      return loginScreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: getInitialScreen(token),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.genertaRoute,
    );
  }
}
