import 'package:flutter/material.dart';
import 'package:quotes_generator_app/core/utils/color_styles.dart';
import 'package:quotes_generator_app/core/utils/font_styles.dart';

class ViewFavoriteQuotesButton extends StatelessWidget {
  const ViewFavoriteQuotesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              alignment: AlignmentGeometry.topRight,
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorStyles.secondaryColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(6),
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
                  right: -15,
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
