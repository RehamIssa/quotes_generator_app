class QuoteModel {
  final String quoteText;
  final String author;

  QuoteModel({required this.quoteText, required this.author});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(quoteText: json[''], author: json['']);
  }
}
