import 'package:dartz/dartz.dart';
import 'package:quotes_generator_app/core/errors/failure.dart';
import 'package:quotes_generator_app/features/home/data/models/quote_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, QuoteModel>> getRandomQuote();
}
