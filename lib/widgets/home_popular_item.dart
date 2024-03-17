import 'package:flutter/material.dart';
import 'package:spacer/theme.dart';

class HomePagePopularItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int price;
  final bool isWishlist;

  const HomePagePopularItem(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.price,
      required this.isWishlist});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(left: 24),
        child: Column(
          children: [
            Container(
              width: 200,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                color: kWhiteGreyColor,
              ),
              child: Center(
                child: Image.asset(
                  imageUrl,
                  width: 160,
                ),
              ),
            ),
            Container(
              color: kWhiteColor,
              width: 200,
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$$price',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 18,
                        ),
                      ),
                      Image.asset(
                        width: 44,
                        isWishlist
                            ? 'assets/button_wishlist_active.png'
                            : 'assets/button_wishlist.png',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
