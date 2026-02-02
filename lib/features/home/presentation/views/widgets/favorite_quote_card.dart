import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quotes_generator_app/core/utils/color_styles.dart';
import 'package:quotes_generator_app/core/utils/font_styles.dart';

class FavoriteQuoteCard extends StatelessWidget {
  const FavoriteQuoteCard({
    super.key,
    required this.quoteText,
    required this.author,
  });
  final String quoteText;
  final String author;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '“$quoteText”',
            style: FontStyles.fontStyle26,
            textAlign: TextAlign.justify,
          ),
          Text(author, style: FontStyles.fontStyle22),
          const Gap(20),
          SizedBox(
            height: 48,
            width: double.infinity,
            child: OutlinedButton.icon(
              label: Text(
                'Remove From Favorite',
                style: FontStyles.fontStyle22.copyWith(
                  color: ColorStyles.primaryColor,
                ),
              ),
              style: IconButton.styleFrom(
                iconSize: 32,
                foregroundColor: ColorStyles.primaryColor,
                side: BorderSide(width: 2.0, color: ColorStyles.primaryColor),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(6),
                  ),
                ),
              ),
              onPressed: () {},
              icon: Icon(Icons.favorite_border_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
