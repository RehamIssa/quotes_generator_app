import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_generator_app/features/home/data/models/quote_model.dart';
import 'package:quotes_generator_app/features/home/presentation/view_model/favorite_quotes_cubit/favorite_quotes_state.dart';

class FavoriteQuotesCubit extends Cubit<FavoriteQuotesState> {
  FavoriteQuotesCubit() : super(FavoriteQuotesInitial());
  List<QuoteModel> favoriteQuotesList = [];
  void addQuote(QuoteModel quote) {
    favoriteQuotesList.add(quote);
    emit(AddQuote());
  }

  List<QuoteModel> getFavoriteQuotes() {
    return favoriteQuotesList;
  }

  
  void removeQuote(QuoteModel quote) {}
}
