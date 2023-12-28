import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rive/rive.dart';
import 'package:wasikuna_admin/app/shared/domain/menu_domain_model.dart';
import 'package:wasikuna_admin/core/utils/query_size.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key, required this.currentRoute});
  final String currentRoute;

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  late String currentRoute;
  @override
  void initState() {
    currentRoute = widget.currentRoute;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding:
            EdgeInsets.symmetric(vertical: QuerySize.height(context, 0.015)),
        width: 248,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                name: "Gustavo Quino",
                dpto: "Dpto. 801",
              ),
              getSeparatorZoneMenu("Beneficios"),
              ...mainMenuList
                  .map((menu) => SideMenu(
                        menu: menu,
                        selectedMenu: menu.routeName == currentRoute,
                        press: () {
                          if (menu.isRedirect &&
                              menu.routeName != currentRoute) {
                            context.go(menu.routeName ?? "");
                          }
                          setState(() {
                            currentRoute = menu.routeName ?? "";
                          });
                        },
                        riveOnInit: (artboard) {},
                      ))
                  .toList(),
              getSeparatorZoneMenu("Soporte"),
              ...secondaryMenuList
                  .map((menu) => SideMenu(
                        menu: menu,
                        selectedMenu: menu.routeName == currentRoute,
                        press: () {
                          setState(() {
                            currentRoute = menu.routeName ?? "";
                          });
                          if (menu.isRedirect &&
                              menu.routeName != currentRoute) {
                            context.go(menu.routeName ?? "");
                          }
                        },
                        riveOnInit: (artboard) {},
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getSeparatorZoneMenu(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 15, bottom: 10),
      child: Text(title,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold)),
    );
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu(
      {super.key,
      required this.menu,
      required this.press,
      required this.riveOnInit,
      required this.selectedMenu});

  final MenuDomain menu;
  final void Function()? press;
  final ValueChanged<Artboard> riveOnInit;
  final bool selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Divider(color: Colors.white24, height: 1),
          ),
          Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                width: selectedMenu ? 236 : 0,
                height: 56,
                left: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(101, 50, 121, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              ListTile(
                horizontalTitleGap: 0.0,
                onTap: press,
                leading: Icon(
                  menu.icon,
                  color: Colors.white,
                  size: 20.0,
                ),
                title: Text(
                  menu.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.name,
    required this.dpto,
  }) : super(key: key);

  final String name, dpto;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 20.0,
        backgroundColor: Colors.black26,
        child: Icon(
          Iconsax.user,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        dpto,
        style: const TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}
