import 'package:flutter/material.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/icon_and_text.dart';
import 'package:ecommerce/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  AppColumn({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      //prevent box layout
      shrinkWrap: true,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(text: text, size: Dimensions.font26),
            SizedBox(
              height: Dimensions.height10,
            ),
            Row(
              children: [
                Wrap(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      color: AppColors.mainColor,
                      size: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SmallText(text: "4.5"),
                const SizedBox(
                  width: 10,
                ),
                SmallText(text: "1287"),
                const SizedBox(
                  width: 10,
                ),
                SmallText(
                  text: "comments",
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconText(
                  icon: Icons.circle_sharp,
                  text: "Normal",
                  iconColor: AppColors.iconColor1,
                ),
                IconText(
                  icon: Icons.location_on,
                  text: "1.7KM",
                  iconColor: AppColors.mainColor,
                ),
                IconText(
                  icon: Icons.access_alarm_rounded,
                  text: "32min",
                  iconColor: AppColors.iconColor2,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
