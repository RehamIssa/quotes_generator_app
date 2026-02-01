import 'package:quotes_generator_app/core/utils/api_keys.dart';

class QuoteModel {
  final String quoteText;
  final String author;

  QuoteModel({required this.quoteText, required this.author});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      quoteText: json[ApiKeys.quoteText],
      author: json[ApiKeys.author],
    );
  }
}
