import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:visting_card_scanner_application/model/contact_models.dart';
import 'package:visting_card_scanner_application/pages/form_page.dart';
import 'package:visting_card_scanner_application/pages/home_page.dart';
import 'package:visting_card_scanner_application/pages/scan_page.dart';
import 'package:visting_card_scanner_application/provider/contact_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ContactProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'Flutter Demo',
      builder: EasyLoading.init(),
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
    );
  }

  final _router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: HomePage.routername,
        path: HomePage.routername,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            name: ScanPage.routername,
            path: ScanPage.routername,
            builder: (context, state) => const ScanPage(),
            routes: [
              GoRoute(
                path: FormPage.routername,
                name: FormPage.routername,
                builder: (context, state) =>
                    FormPage(contactModel: state.extra! as ContactModels),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
