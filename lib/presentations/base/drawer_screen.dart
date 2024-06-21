import 'package:fideos_restaurant/controllers/base.controller.dart';
import 'package:fideos_restaurant/models/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerSection extends StatefulWidget {
  const DrawerSection({super.key});

  @override
  State<DrawerSection> createState() => _DrawerSectionState();
}

class _DrawerSectionState extends State<DrawerSection> {
  // Importing basecontroller
  final controller = Get.put(BaseController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      DrawerHeader(
          decoration: BoxDecoration(color: ColorManager.primary),
          child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(children: [
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                // // User Image
                // CircleAvatar(
                //     backgroundColor: Colors.white,
                //     radius: 30,
                //     child: Padding(
                //         padding: EdgeInsets.all(1),
                //         child: CircleAvatar(
                //             radius: 28,
                //             backgroundImage: NetworkImage(
                //                 "https://cdn.dribbble.com/users/295355/screenshots/2480604/media/05eed18b2c3216f0d72126eafde717ea.png?resize=800x600&vertical=center")))),

                // //  Adding some space
                //   SizedBox(width: 10),
                // User name+email
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // User name
                              Text("Dipika",
                                  style: TextStyle(
                                      fontSize: 18, color: ColorManager.white)),

                              // User mail
                              Text("dipika@gmail.com",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16, color: ColorManager.white))
                            ])))
                ])
              ]))),
      ...List.generate(controller.draweritems.length, (index) {
        DrawerModel item = controller.draweritems[index];
        return Column(children: [
          ListTile(
            onTap: () {},
            leading: Icon(item.icon, size: 20),
            title: Text(item.title, style: const TextStyle(fontSize: 14)),
          ),
          // Divider
          Divider(color: Colors.black.withOpacity(0.05))
        ]);
      })
    ]));
  }
}
