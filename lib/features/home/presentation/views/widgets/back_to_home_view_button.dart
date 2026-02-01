import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quotes_generator_app/core/utils/color_styles.dart';
import 'package:quotes_generator_app/core/utils/font_styles.dart';
import 'package:quotes_generator_app/features/home/presentation/views/home_view.dart';

class BackToHomeViewButton extends StatelessWidget {
  const BackToHomeViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeView()),
        );
      },
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorStyles.secondaryColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.chevron_left_outlined,
                color: ColorStyles.primaryFontColor,
                size: 32,
              ),
              const Gap(3),
              const Text('Back To Home Screen', style: FontStyles.fontStyle26),
            ],
          ),
        ),
      ),
    );
  }
}
