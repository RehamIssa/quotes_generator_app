import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_generator_app/core/utils/color_styles.dart';
import 'package:quotes_generator_app/features/home/data/models/quote_model.dart';
import 'package:quotes_generator_app/features/home/presentation/view_model/favorite_quotes_cubit/favorite_quotes_cubit.dart';
import 'package:quotes_generator_app/features/home/presentation/view_model/favorite_quotes_cubit/favorite_quotes_state.dart';

class AddQuoteToFavoriteQuotesButton extends StatelessWidget {
  const AddQuoteToFavoriteQuotesButton({super.key, required this.quote});
  final QuoteModel quote;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteQuotesCubit, FavoriteQuotesState>(
      builder: (context, state) {
        final isFavoriteQuote = BlocProvider.of<FavoriteQuotesCubit>(
          context,
        ).isFavoriteQuote(quote);
        return SizedBox(
          height: 48,
          child: IconButton.outlined(
            iconSize: 32,
            color: ColorStyles.primaryColor,
            style: IconButton.styleFrom(
              side: BorderSide(width: 2.0, color: ColorStyles.primaryColor),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(6),
                ),
              ),
            ),
            onPressed: () {
              //adding or removing the quote to favorite based on wether it is added or not
              BlocProvider.of<FavoriteQuotesCubit>(context).toggleQuote(quote);
            },
            icon: isFavoriteQuote
                ? Icon(Icons.favorite_rounded, color: ColorStyles.primaryColor)
                : Icon(Icons.favorite_border_rounded),
          ),
        );
      },
    );
  }
}
