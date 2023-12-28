import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/menu/sidebar.dart';
import 'package:wasikuna_admin/core/utils/query_size.dart';

class CustomScaffoldMain extends StatefulWidget {
  const CustomScaffoldMain(
      {super.key, required this.child, required this.routeName});
  final Widget child;
  final String routeName;

  @override
  State<CustomScaffoldMain> createState() => _CustomScaffoldMainState();
}

class _CustomScaffoldMainState extends State<CustomScaffoldMain>
    with SingleTickerProviderStateMixin {
  bool isSideBarOpen = false;
  late String currentRoute;

  late SMIBool isMenuOpenInput;
  late AnimationController _animationController;
  late Animation<double> scalAnimation;
  late Animation<double> animation;

  @override
  void initState() {
    currentRoute = widget.routeName;
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(
        () {
          setState(() {});
        },
      );
    scalAnimation = Tween<double>(begin: 1, end: 0.85).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(61, 40, 67, 1),
      body: Stack(
        children: [
          AnimatedPositioned(
            width: 248,
            height: MediaQuery.of(context).size.height,
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideBarOpen ? 0 : -248,
            top: 0,
            child: SideBar(currentRoute: widget.routeName),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(
                  1 * animation.value - 30 * (animation.value) * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 225, 0),
              child: Transform.scale(
                scale: scalAnimation.value,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(isSideBarOpen ? 24.0 : 0.0),
                  ),
                  child: widget.child,
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideBarOpen ? 185 : 0,
            top: isSideBarOpen ? QuerySize.height(context, 0.035) : 10,
            child: MenuBtn(
              press: () {
                isMenuOpenInput.value = !isMenuOpenInput.value;

                if (_animationController.value == 0) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }

                setState(
                  () {
                    isSideBarOpen = !isSideBarOpen;
                  },
                );
              },
              riveOnInit: (artboard) {
                final controller = StateMachineController.fromArtboard(
                    artboard, "State Machine");
                artboard.addController(controller!);
                isMenuOpenInput =
                    controller.findInput<bool>("isOpen") as SMIBool;
                isMenuOpenInput.value = true;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MenuBtn extends StatelessWidget {
  const MenuBtn({super.key, required this.press, required this.riveOnInit});

  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        child: Container(
          margin: const EdgeInsets.only(left: 12),
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: Colors.white38,
            shape: BoxShape.circle,
          ),
          child: RiveAnimation.asset(
            "assets/RiveAssets/menu_button.riv",
            onInit: riveOnInit,
          ),
        ),
      ),
    );
  }
}
