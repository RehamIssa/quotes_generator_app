import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:quotes_generator_app/features/home/presentation/view_model/favorite_quotes_cubit/favorite_quotes_cubit.dart';
import 'package:quotes_generator_app/features/home/presentation/view_model/favorite_quotes_cubit/favorite_quotes_state.dart';
import 'package:quotes_generator_app/features/home/presentation/views/widgets/back_to_home_view_button.dart';
import 'package:quotes_generator_app/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:quotes_generator_app/features/home/presentation/views/widgets/favorite_quotes_cards_list_view.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteQuotesCubit, FavoriteQuotesState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const BackToHomeViewButton(),
              const Gap(10),
              const CustomSearchBar(),
              const Gap(10),
              Expanded(child:  state is SearchedQuoteState ? SearchedQuotesList() : FavoriteQuotesCardsListView()),
            ],
          ),
        );
      },
    );
  }
}
