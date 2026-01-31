import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quotes_generator_app/core/utils/color_styles.dart';
import 'package:quotes_generator_app/core/utils/font_styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController textController = TextEditingController();
  bool showClearIcon = false;
  @override
  void initState() {
    super.initState();
    textController.addListener(updateClearIconVisibility);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void updateClearIconVisibility() {
    final bool hasText = textController.text.isNotEmpty;
    // Only update state if the visibility actually changes to avoid unnecessary rebuilds
    if (showClearIcon != hasText) {
      setState(() {
        showClearIcon = hasText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: FontStyles.fontStyle22.copyWith(
        color: ColorStyles.primaryFontColor,
      ),
      controller: textController,
      decoration: InputDecoration(
        hintText: 'Type Something Here To Search..',
        hintStyle: FontStyles.fontStyle22,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: showClearIcon
              ? IconButton(
                  onPressed: () {
                    textController.clear();
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.circleXmark,
                    color: ColorStyles.secondaryFontColor,
                    size: 24,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
