import 'package:flutter/material.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({
    super.key,
    required this.positionLeftImage1,
    required this.positionLeftImage2,
    required this.imgSrc1,
    required this.imgSrc2,
    required this.title,
    required this.subtitle,
    this.onTap,
  });
  final double positionLeftImage1;
  final double positionLeftImage2;
  final Function()? onTap;
  final String imgSrc1;
  final String imgSrc2;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.deepPurple),
            child: Stack(
              children: [
                AnimatedPositioned(
                  left: positionLeftImage1,
                  duration: const Duration(milliseconds: 600),
                  child: GestureDetector(
                    onTap: onTap,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(imgSrc1),
                      radius: 60,
                    ),
                  ),
                ),
                AnimatedPositioned(
                  left: positionLeftImage2,
                  duration: const Duration(milliseconds: 600),
                  child: GestureDetector(
                    onTap: onTap,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(imgSrc2),
                      radius: 60,
                      backgroundColor: Colors.black38,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(fontSize: 18),
              ),
              subtitle: Text(
                subtitle,
                style: const TextStyle(fontSize: 15),
              ),
              isThreeLine: true,
            ),
          )
        ],
      ),
    );
  }
}
