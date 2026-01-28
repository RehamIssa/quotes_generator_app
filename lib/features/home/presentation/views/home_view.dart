import 'package:flutter/material.dart';
import 'package:quotes_generator_app/features/home/presentation/views/widgets/custom_background.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: CustomBackground(bodyWidget: HomeViewBody())),
    );
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: double.infinity,
          color: Color(0xffD0BCF0),
          child: Text('Click Here To View Favorite Quotes'),
        ),
      ],
    );
  }
}
