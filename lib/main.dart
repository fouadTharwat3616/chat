import 'package:chat/rooms/view/screens/create_room_screen.dart';
import 'package:chat/shared/app_bloc_observer.dart';
import 'package:chat/shared/app_theme.dart';
import 'package:chat/auth/view/screens/login_screen.dart';
import 'package:chat/auth/view/screens/register_screen.dart';
import 'package:chat/auth/view_model/auth_view_model.dart';
import 'package:chat/firebase_options.dart';
import 'package:chat/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = AppBlocObserver();
  runApp(
      BlocProvider(
          create:(context) => AuthViewModel() ,
          child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      routes: {
       HomeScreen.routeName:(context) => HomeScreen(),
        LoginScreen.routeName:(context) => LoginScreen(),
        RegisterScreen.routeName:(context) => RegisterScreen(),
        CreateRoomScreen.routeName:(context) => const CreateRoomScreen()
      },
      initialRoute: HomeScreen.routeName,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
    );
  }
}


