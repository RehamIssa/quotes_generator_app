import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_generator_app/features/home/data/repos/home_repo.dart';
import 'package:quotes_generator_app/features/home/presentation/view_model/get_quote_state.dart';

class GetQuoteCubit extends Cubit<GetQuoteState> {
  GetQuoteCubit(this.homeRepo) : super(GetQuoteInitial());
  final HomeRepo homeRepo;

  Future<void> getRandomQuote() async {
    emit(GetQuoteLoading());
    var results = await homeRepo.getRandomQuote();
    results.fold(
      (failure) {
        emit(GetQuoteFailure(errorMessage: failure.errorMessage));
      },
      (quotesList) {
        emit(GetQuoteSuccess(quotesList: quotesList));
      },
    );
  }
}
