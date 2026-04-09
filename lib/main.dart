import 'package:firebase_core/firebase_core.dart';
import 'package:fitnessapp/data/remote_datasources/auth_remote_datasource.dart';
import 'package:fitnessapp/firebase_options.dart';
import 'package:fitnessapp/presentations/cubits/auth/auth_cubit.dart';
import 'package:fitnessapp/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(AuthRemoteDatasource())),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.dmSansTextTheme(),
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),
          scaffoldBackgroundColor: Colors.white,
        ),
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
