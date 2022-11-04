import 'package:flutter/material.dart';
import 'package:travel_app/widgets/image_dialog.dart';
import '../constants/shape_constant.dart';

class Avatar extends StatelessWidget {
  final String avatar;
  const Avatar({
    required this.avatar,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 50,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return ImageDialog(url: avatar);
          },
        );
      },
      icon: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(avatar),
            fit: BoxFit.cover,
          ),
          borderRadius: ShapeConstant.circularBorder12,
        ),
      ),
    );
  }
}

class Leading extends StatelessWidget {
  const Leading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(
            Icons.sort,
            color: Colors.black,
          ),
        );
      },
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ListView(
        children: [
          ListTile(
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
            leading: Text(
              'Log out',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            trailing: Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
