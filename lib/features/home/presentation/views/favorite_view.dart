import 'package:flutter/material.dart';
import 'package:quotes_generator_app/features/home/presentation/views/widgets/custom_background.dart';
import 'package:quotes_generator_app/features/home/presentation/views/widgets/favorite_view_body.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CustomBackground(bodyWidget: FavoriteViewBody())),
    );
  }
}
