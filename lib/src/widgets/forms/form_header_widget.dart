import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    this.image,
    required this.title,
    required this.subTitle,
  });

  final String? image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (image != null)
          Image(
            image: AssetImage(image!),
            height: size.height * 0.2,
          ),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
