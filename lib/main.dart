import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_generator_app/core/utils/api_services.dart';
import 'package:quotes_generator_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:quotes_generator_app/features/home/presentation/view_model/favorite_quotes_cubit/favorite_quotes_cubit.dart';
import 'package:quotes_generator_app/features/home/presentation/view_model/get_quote_cubit/get_quote_cubit.dart';
import 'package:quotes_generator_app/features/home/presentation/views/home_view.dart';

void main() {
  runApp(const QuotesGeneratorApp());
}

class QuotesGeneratorApp extends StatelessWidget {
  const QuotesGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetQuoteCubit(
            HomeRepoImplementation(apiServices: ApiServices(Dio())),
          )..getRandomQuote(),
        ),
        BlocProvider(create: (context) => FavoriteQuotesCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //changing the default font family of the app
        //by using google fonts package instead of downloading the font
        theme: ThemeData.light().copyWith(
          textTheme: GoogleFonts.gemunuLibreTextTheme(
            ThemeData.light().textTheme,
          ),
        ),
        home: HomeView(),
      ),
    );
  }
}
