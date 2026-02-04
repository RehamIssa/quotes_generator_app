import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quotes_generator_app/core/utils/color_styles.dart';
import 'package:quotes_generator_app/core/utils/font_styles.dart';
import 'package:quotes_generator_app/features/home/presentation/view_model/favorite_quotes_cubit/favorite_quotes_cubit.dart';
import 'package:quotes_generator_app/features/home/presentation/view_model/favorite_quotes_cubit/favorite_quotes_state.dart';
import 'package:quotes_generator_app/features/home/presentation/views/widgets/favorite_quote_card.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController textController = TextEditingController();
  bool showClearIcon = false;
  @override
  void initState() {
    super.initState();
    textController.addListener(updateClearIconVisibility);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void updateClearIconVisibility() {
    final bool hasText = textController.text.isNotEmpty;
    // Only update state if the visibility actually changes to avoid unnecessary rebuilds
    if (showClearIcon != hasText) {
      setState(() {
        showClearIcon = hasText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: FontStyles.fontStyle22.copyWith(
        color: ColorStyles.primaryFontColor,
      ),
      controller: textController,
      onChanged: (value) => BlocProvider.of<FavoriteQuotesCubit>(
        context,
      ).searchInFavoritesQuotesList(value),
      decoration: InputDecoration(
        hintText: 'Type Something Here To Search..',
        hintStyle: FontStyles.fontStyle22,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: showClearIcon
              ? IconButton(
                  onPressed: () {
                    textController.clear();
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.circleXmark,
                    color: ColorStyles.secondaryFontColor,
                    size: 24,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

class SearchedQuotesList extends StatelessWidget {
  const SearchedQuotesList({super.key});

  @override
  Widget build(BuildContext context) {
    var quotes = BlocProvider.of<FavoriteQuotesCubit>(
      context,
    ).searchQuotesResults;
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
