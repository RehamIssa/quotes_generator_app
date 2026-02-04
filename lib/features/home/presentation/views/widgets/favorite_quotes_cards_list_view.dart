import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_generator_app/features/home/presentation/view_model/favorite_quotes_cubit/favorite_quotes_cubit.dart';
import 'package:quotes_generator_app/features/home/presentation/view_model/favorite_quotes_cubit/favorite_quotes_state.dart';

import 'package:quotes_generator_app/features/home/presentation/views/widgets/favorite_quote_card.dart';

class FavoriteQuotesCardsListView extends StatelessWidget {
  const FavoriteQuotesCardsListView({super.key});
  @override
  Widget build(BuildContext context) {
    var quotes = BlocProvider.of<FavoriteQuotesCubit>(
      context,
    ).favoriteQuotesList;
    return BlocBuilder<FavoriteQuotesCubit, FavoriteQuotesState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: quotes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: FavoriteQuoteCard(quote: quotes[index]),
            );
          },
        );
      },
    );
  }
}
