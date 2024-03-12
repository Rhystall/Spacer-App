import 'package:flutter/material.dart';
import 'package:spacer/theme.dart';

class HomeCategoryItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  const HomeCategoryItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 123,
      width: MediaQuery.of(context).size.width - (2 * 24),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 102,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: kWhiteColor,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        subtitle,
                        style: greyTextStle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            imageUrl,
            height: 122,
          ),
        ],
      ),
    );
  }
}
