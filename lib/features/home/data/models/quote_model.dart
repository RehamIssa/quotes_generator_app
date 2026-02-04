import 'package:quotes_generator_app/core/utils/api_keys.dart';
import 'package:hive/hive.dart';
part 'quote_model.g.dart';

@HiveType(typeId: 0)
class QuoteModel {
  @HiveField(0)
  final String quoteText;
  @HiveField(1)
  final String author;
  @HiveField(2)
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
