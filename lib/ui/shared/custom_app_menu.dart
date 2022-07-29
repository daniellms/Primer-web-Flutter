import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/blocs/page/page_bloc.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';
import 'package:vertical_landing_page/ui/shared/Custom_item_menu.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu> with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200)); // verticalSync
  }

  @override
  Widget build(BuildContext context) {
    final pageProviderr = Provider.of<PageProvider>(context, listen: false);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isOpen) {
            controller.reverse();
          } else {
            controller.forward();
          }

          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
            // duration: Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 150,
            height: (isOpen) ? 308 : 50,
            color: Colors.black,
            child: Column(
              children: [
                _MenuRow(isOpen: isOpen, controller: controller),
                if (isOpen) ...[
                  CustomMenuItem(delay: 0, text: 'Home', onPressed: () => pageProviderr.goTo(0)), //=> context.read<PageBloc>().add(OnGoTo(index: 0)
                  CustomMenuItem(delay: 80, text: 'About', onPressed: () => pageProviderr.goTo(1)), //=> context.read<PageBloc>().add(OnGoTo(index: 1))
                  CustomMenuItem(delay: 160, text: 'Pricing', onPressed: () => pageProviderr.goTo(2)), //=> context.read<PageBloc>().add(OnGoTo(index: ))
                  CustomMenuItem(delay: 240, text: 'Contact', onPressed: () => pageProviderr.goTo(3)), //=> context.read<PageBloc>().add(OnGoTo(index: ))
                  CustomMenuItem(delay: 320, text: 'Location', onPressed: () => pageProviderr.goTo(4)), //=> context.read<PageBloc>().add(OnGoTo(index:))
                  // SizedBox(height: 8,) goTo
                ]
              ],
            )),
      ),
    );
  }
}

class _MenuRow extends StatelessWidget {
  const _MenuRow({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.linear, // easeInOut
            width: (isOpen) ? 40 : 0,
          ),
          Text('Menu',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 20,
              )),
          const Spacer(),
          AnimatedIcon(
            progress: controller,
            icon: AnimatedIcons.menu_close,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
