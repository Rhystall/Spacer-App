import 'package:flutter/material.dart';
import 'package:spacer/theme.dart';

class OnboardingItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const OnboardingItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 99),
        Image.asset(
          imageUrl,
          width: double.infinity,
        ),
        const SizedBox(
          height: 127,
        ),
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 26,
            fontWeight: regular,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: greyTextStle.copyWith(
            fontSize: 18,
            fontWeight: regular,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
