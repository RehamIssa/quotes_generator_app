import 'package:quotes_generator_app/features/home/data/models/quote_model.dart';

class GetQuoteState {}

class GetQuoteInitial extends GetQuoteState {}

class GetQuoteLoading extends GetQuoteState {}

class GetQuoteSuccess extends GetQuoteState {
  final QuoteModel quote;

  GetQuoteSuccess({required this.quote});
}

class GetQuoteFailure extends GetQuoteState {
  final String errorMessage;

  GetQuoteFailure({required this.errorMessage});
}
