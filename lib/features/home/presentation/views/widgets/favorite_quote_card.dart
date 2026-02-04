import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:quotes_generator_app/core/utils/color_styles.dart';
import 'package:quotes_generator_app/core/utils/font_styles.dart';
import 'package:quotes_generator_app/features/home/data/models/quote_model.dart';
import 'package:quotes_generator_app/features/home/presentation/view_model/favorite_quotes_cubit/favorite_quotes_cubit.dart';
import 'package:quotes_generator_app/features/home/presentation/view_model/favorite_quotes_cubit/favorite_quotes_state.dart';

class FavoriteQuoteCard extends StatelessWidget {
  const FavoriteQuoteCard({super.key, required this.quote});

  final QuoteModel quote;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteQuotesCubit, FavoriteQuotesState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '“${quote.quoteText}“',
                style: FontStyles.fontStyle26,
                textAlign: TextAlign.justify,
              ),
              Text(quote.author, style: FontStyles.fontStyle22),
              const Gap(20),
              SizedBox(
                height: 48,
                width: double.infinity,
                child: OutlinedButton.icon(
                  label: Text(
                    'Remove From Favorite',
                    style: FontStyles.fontStyle22.copyWith(
                      color: ColorStyles.primaryColor,
                    ),
                  ),
                  style: IconButton.styleFrom(
                    iconSize: 32,
                    foregroundColor: ColorStyles.primaryColor,
                    side: BorderSide(
                      width: 2.0,
                      color: ColorStyles.primaryColor,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(6),
                      ),
                    ),
                  ),
                  onPressed: () {
                    BlocProvider.of<FavoriteQuotesCubit>(
                      context,
                    ).removeQuote(quote);
                  },
                  icon: Icon(Icons.favorite_border_rounded),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
