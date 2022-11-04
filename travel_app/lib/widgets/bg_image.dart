import 'package:flutter/material.dart';
import '../constants/asset_constants.dart';
import '../constants/color_constants.dart';
import '../constants/shape_constant.dart';
import '../views/home_page.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetConstants.bgImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Elements(),
      ),
    );
  }
}

class Elements extends StatelessWidget {
  const Elements({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Title(),
        NavigatorButton(),
      ],
    );
  }
}

class NavigatorButton extends StatelessWidget {
  const NavigatorButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(bottom: 75.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorConstants.green,
            shape: RoundedRectangleBorder(
              borderRadius: ShapeConstant.circularBorder12,
            ),
            padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 17.0),
          ),
          onPressed: () => navigatePage(context),
          child: Text('Explore'),
        ),
      ),
    );
  }

  Future<dynamic> navigatePage(BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'aa.',
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
