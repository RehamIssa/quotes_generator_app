import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_generator_app/features/home/presentation/view_model/get_quote_cubit/get_quote_cubit.dart';
import 'package:quotes_generator_app/features/home/presentation/views/widgets/custom_background.dart';
import 'package:quotes_generator_app/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomBackground(
          bodyWidget: RefreshIndicator(
            onRefresh: () =>
                BlocProvider.of<GetQuoteCubit>(context).getRandomQuote(),
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [SliverFillRemaining(child: HomeViewBody())],
            ),
          ),
        ),
      ),
    );
  }
}
