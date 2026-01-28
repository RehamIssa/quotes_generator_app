import 'package:flutter/material.dart';
import 'package:quotes_generator_app/core/utils/color_styles.dart';
import 'package:quotes_generator_app/core/utils/font_styels.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Stack(
              alignment: AlignmentGeometry.topRight,
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorStyles.secondaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      topLeft: Radius.circular(6),
                    ),
                  ),
                  height: 60,
                  width: double.infinity,
                  child: Center(
                    child: const Text(
                      'Click Here To View Favorite Quotes',
                      style: FontStyles.fontStyle26,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 45,
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorStyles.primaryFontColor,
                    ),
                    child: Center(
                      child: Text(
                        '2',
                        style: FontStyles.fontStyle22.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
