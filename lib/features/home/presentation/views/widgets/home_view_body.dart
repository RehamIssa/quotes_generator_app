import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:quotes_generator_app/core/utils/color_styles.dart';
import 'package:quotes_generator_app/core/utils/font_styles.dart';
import 'package:quotes_generator_app/features/home/presentation/view_model/get_quote_cubit/get_quote_cubit.dart';
import 'package:quotes_generator_app/features/home/presentation/view_model/get_quote_state.dart';
import 'package:quotes_generator_app/features/home/presentation/views/widgets/favorite_quotes_button.dart';

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
                onPressed: () {
                  BlocProvider.of<GetQuoteCubit>(context).getRandomQuote();
                },
                child: Text(
                  'Generate Another Quote',
                  style: FontStyles.fontStyle20.copyWith(color: Colors.white),
                ),
              ),
            ),
            Gap(20),

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
                        children: [
                          Text(
                            // '“All I required to be happy was friendship and people I could admire.”',
                            '“${state.quotesList[0].quoteText}',
                            style: FontStyles.fontStyle26,
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            // 'Christian Dior',
                            state.quotesList[0].author,
                            style: FontStyles.fontStyle22,
                          ),
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
