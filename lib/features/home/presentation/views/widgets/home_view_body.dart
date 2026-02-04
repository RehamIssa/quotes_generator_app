import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:quotes_generator_app/core/utils/font_styles.dart';
import 'package:quotes_generator_app/features/home/presentation/view_model/get_quote_cubit/get_quote_cubit.dart';
import 'package:quotes_generator_app/features/home/presentation/view_model/get_quote_state.dart';
import 'package:quotes_generator_app/features/home/presentation/views/widgets/add_quote_to_favorite_quotes_button.dart';
import 'package:quotes_generator_app/features/home/presentation/views/widgets/view_favorite_quotes_button.dart';
import 'package:quotes_generator_app/features/home/presentation/views/widgets/generate_random_quote_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetQuoteCubit, GetQuoteState>(
      listener: (context, state) {
        if (state is GetQuoteFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
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
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(6),
                  ),
                ),
                child: state is GetQuoteLoading
                    ? CircularProgressIndicator()
                    : state is GetQuoteSuccess
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '“${state.quote.quoteText}',
                            style: FontStyles.fontStyle26,
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            state.quote.author,
                            style: FontStyles.fontStyle22,
                          ),
                          const Gap(20),
                          Row(
                            children: [
                              const GenerateRandomQuoteButton(),
                              Gap(10),
                              Expanded(
                                child: AddQuoteToFavoriteQuotesButton(
                                  quote: state.quote,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Container(),
              ),
            ),
          ],
        );
      },
    );
  }
}
