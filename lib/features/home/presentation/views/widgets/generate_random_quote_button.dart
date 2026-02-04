import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_generator_app/core/utils/color_styles.dart';
import 'package:quotes_generator_app/core/utils/font_styles.dart';
import 'package:quotes_generator_app/features/home/presentation/view_model/get_quote_cubit/get_quote_cubit.dart';


class GenerateRandomQuoteButton extends StatelessWidget {
  const GenerateRandomQuoteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
        onPressed: () {
          BlocProvider.of<GetQuoteCubit>(
            context,
          ).getRandomQuote();
        },
        child: Text(
          'Generate Another Quote',
          style: FontStyles.fontStyle20.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
