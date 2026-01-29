import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quotes_generator_app/core/utils/color_styles.dart';
import 'package:quotes_generator_app/core/utils/font_styles.dart';
import 'package:quotes_generator_app/features/home/presentation/views/widgets/favorite_quotes_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ViewFavoriteQuotesButton(),
        const Gap(10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(6)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '“All I required to be happy was friendship and people I could admire.”',
                  style: FontStyles.fontStyle26,
                  textAlign: TextAlign.justify,
                ),
                Text('Christian Dior', style: FontStyles.fontStyle22),
                const Gap(20),
                Row(
                  children: [
                    SizedBox(
                      height: 48,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: ColorStyles.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Generate Another Quote',
                          style: FontStyles.fontStyle20.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Gap(10),
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: IconButton.outlined(
                          iconSize: 32,
                          color: ColorStyles.primaryColor,
                          style: IconButton.styleFrom(
                            side: BorderSide(
                              width: 2.0,
                              color: ColorStyles.primaryColor,
                            ),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(6),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border_rounded),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
