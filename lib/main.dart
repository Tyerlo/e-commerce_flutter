import 'package:ecommerce/app/auth_widget.dart';
import 'package:ecommerce/app/pages/auth/sign_in_page.dart';
import 'package:ecommerce/app/pages/user/user_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'app/pages/admin/admin_home.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            primary: Colors.black87, seedColor: Colors.black87),
        primarySwatch: Colors.blue,
      ),
      home: AuthWidget(
        adminSignedInBuilder: ((context) => const AdminHome()),
        signedInBuilder: (context) => const UserHome(),
        nonSignedInBuilder: (_) => const SignInPage(),
      ),
    );
  }
}
