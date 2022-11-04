import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/color_constants.dart';
import '../constants/shape_constant.dart';

class MorePlaces extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const MorePlaces({
    required this.image,
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape:
          RoundedRectangleBorder(borderRadius: ShapeConstant.circularBorder12),
      iconColor: Colors.white,
      tileColor: ColorConstants.white,
      leading: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: ShapeConstant.circularBorder12,
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.subtitle2,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 10),
      ),
      trailing: Ink(
        decoration: ShapeDecoration(
          color: ColorConstants.green,
          shape: RoundedRectangleBorder(
            borderRadius: ShapeConstant.circularBorder12,
          ),
        ),
        child: IconButton(
          icon: Icon(Icons.location_on_outlined),
          onPressed: () async {
            final url = 'https://www.google.com/search?q=' + this.title;

            if (await canLaunchUrl(Uri.parse(url)))
              await launchUrl(Uri.parse(url));
            else
              throw Exception();
          },
        ),
      ),
    );
  }
}
