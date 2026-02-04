import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_generator_app/features/home/data/models/quote_model.dart';
import 'package:quotes_generator_app/features/home/presentation/view_model/favorite_quotes_cubit/favorite_quotes_state.dart';

class FavoriteQuotesCubit extends Cubit<FavoriteQuotesState> {
  FavoriteQuotesCubit() : super(FavoriteQuotesInitial());
  List<QuoteModel> favoriteQuotesList = [];
  void addQuote(QuoteModel quote) {
    favoriteQuotesList.add(quote);
    emit(AddQuote());
    emit(FavoriteQuotesLength());
  }

  List<QuoteModel> getFavoriteQuotes() {
    return favoriteQuotesList;
  }

  bool isFavoriteQuote(QuoteModel quote) {
    return favoriteQuotesList.any((q) => q.id == quote.id);
  }

  void removeQuote(QuoteModel quote) {
    var quoteId = quote.id;
    favoriteQuotesList.removeWhere((quote) => quote.id == quoteId);
    emit(RemoveQuote());
    emit(FavoriteQuotesLength());
  
  }

  void toggleQuote(QuoteModel quote) {
    if (isFavoriteQuote(quote)) {
      removeQuote(quote);
    } else {
      addQuote(quote);
    }
  }
}
