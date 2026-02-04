import 'package:quotes_generator_app/core/utils/api_keys.dart';

class QuoteModel {
  final String quoteText;
  final String author;
  final int id;
  QuoteModel({required this.quoteText, required this.author, required this.id});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      quoteText: json[ApiKeys.quoteText],
      author: json[ApiKeys.author],
      id: json[ApiKeys.id],
    );
  }
}
