import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vertical_landing_page/blocs/page/page_bloc.dart';
import 'package:vertical_landing_page/ui/shared/custom_app_menu.dart';
import 'package:vertical_landing_page/ui/views/about_view.dart';
import 'package:vertical_landing_page/ui/views/contact_view.dart';
import 'package:vertical_landing_page/ui/views/home_view.dart';
import 'package:vertical_landing_page/ui/views/location_view.dart';
import 'package:vertical_landing_page/ui/views/pricing_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: construirBoxDecoration(),
        child: Stack(
          children: const [_HomeBody(), Positioned(top: 20, right: 20, child: CustomAppMenu())],
        ),
      ),
    );
  }

  BoxDecoration construirBoxDecoration() => const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.pink, Colors.purpleAccent], begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: [0.5, 0.5]),
      );
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return BlocBuilder<PageBloc, PageState>(
      builder: (context, state) {
        return PageView(
          physics: BouncingScrollPhysics(),
          // controller: state.scrollController,
          scrollBehavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          }),
          scrollDirection: Axis.vertical,
          children: [
            HomeView(),
            AboutView(),
            PricingView(),
            ContactView(),
            LocationView(),
          ],
        );
      },
    );
  }
}
