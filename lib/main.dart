import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vertical_landing_page/blocs/page/page_bloc.dart';
import 'package:vertical_landing_page/routers/router.dart';
import 'package:vertical_landing_page/ui/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FluroPrincipalRouter.configureRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PageBloc())
      ],
      child: MaterialApp(
        title: 'Landing Page',
        initialRoute: '/home',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: FluroPrincipalRouter.router.generator,
      ),
    );
  }
}
