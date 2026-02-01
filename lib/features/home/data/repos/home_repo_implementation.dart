import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quotes_generator_app/core/errors/failure.dart';
import 'package:quotes_generator_app/core/utils/api_keys.dart';
import 'package:quotes_generator_app/core/utils/api_services.dart';
import 'package:quotes_generator_app/features/home/data/models/quote_model.dart';
import 'package:quotes_generator_app/features/home/data/repos/home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImplementation({required this.apiServices});
  @override
  Future<Either<Failure, List<QuoteModel>>> getRandomQuote() async {
    try {
      var data = await apiServices.get(Endpoints.getRandomQuotes);
      List<QuoteModel> quotesList = [];
      for (var quote in data['content']) {
        quotesList.add(QuoteModel.fromJson(quote));
      }
      return Right(quotesList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, QuoteModel>> getSearchedQuote(String endpoint) {
    // TODO: implement getSearchedQuote
    throw UnimplementedError();
  }
}
