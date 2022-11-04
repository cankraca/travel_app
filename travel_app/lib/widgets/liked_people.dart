import 'package:flutter/material.dart';
import 'package:travel_app/constants/asset_constants.dart';
import '../constants/color_constants.dart';
import '../constants/shape_constant.dart';

class LikedPeople extends StatelessWidget {
  const LikedPeople({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: ColorConstants.lightGreen,
        borderRadius: ShapeConstant.circularBorder12,
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundImage: AssetImage(AssetConstants.pic1),
                ),
                Positioned(
                  child: CircleAvatar(
                    backgroundImage: AssetImage(AssetConstants.pic2),
                    radius: 10,
                  ),
                  left: 10,
                ),
                Positioned(
                  child: CircleAvatar(
                    backgroundImage: AssetImage(AssetConstants.pic3),
                    radius: 10,
                  ),
                  left: 20,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              '+7 people like this trip.',
            ),
          )
        ],
      ),
    );
  }
}
