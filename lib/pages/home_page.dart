import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:spacer/theme.dart';
import 'package:spacer/widgets/home_category_item.dart';
import 'package:spacer/widgets/home_popular_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int categoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteGreyColor,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: kWhiteColor,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Image.asset(
                'assets/icon_home.png',
                width: 24,
              ),
            ),
            BottomNavigationBarItem(
              label: "Favorite",
              icon: Image.asset(
                'assets/icon_heart.png',
                width: 24,
              ),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Image.asset(
                'assets/icon_profile.png',
                width: 24,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Image.asset('assets/image_background.png'),
          ListView(
            children: [
              // Header
              Container(
                margin: EdgeInsets.only(top: 24),
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/logo_black.png',
                      width: 53,
                    ),
                    Text(
                      "Space",
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                      ),
                    ),
                    Spacer(),
                    Image.asset(
                      'assets/icon_cart.png',
                      width: 30,
                    ),
                  ],
                ),
              ),
              // Search Bar
              Container(
                margin: EdgeInsets.only(
                  top: 30,
                  left: 24,
                  right: 24,
                ),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: kWhiteColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Search Funiture",
                      style: greyTextStle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    Image.asset(
                      'assets/icon_search.png',
                      width: 24,
                      color: kGreyColor,
                    ),
                  ],
                ),
              ),
              // Category Title
              Container(
                margin: EdgeInsets.only(
                  top: 30,
                  left: 24,
                  right: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category",
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      "Show All",
                      style: blackTextStyle.copyWith(
                        fontWeight: regular,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
              // Category Carrousel
              Container(
                margin: EdgeInsets.only(top: 25),
                child: CarouselSlider(
                  items: [
                    HomeCategoryItem(
                      title: 'Minimalis Chair',
                      subtitle: 'Chair',
                      imageUrl: 'assets/image_product_category1.png',
                    ),
                    HomeCategoryItem(
                      title: 'Minimalis Table',
                      subtitle: 'Table',
                      imageUrl: 'assets/image_product_category2.png',
                    ),
                    HomeCategoryItem(
                      title: 'Minimalis Chair',
                      subtitle: 'Chair',
                      imageUrl: 'assets/image_product_category3.png',
                    ),
                  ],
                  options: CarouselOptions(
                    height: 140,
                    enableInfiniteScroll: false,
                    viewportFraction: 1,
                    onPageChanged: (value, _) {
                      setState(() {
                        categoryIndex = value;
                      });
                    },
                  ),
                ),
              ),
              // Carousel Indicator
              Container(
                margin: EdgeInsets.only(
                  top: 13,
                  left: 24,
                  right: 24,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            categoryIndex == 0 ? kBlackColor : kLineDarkColor,
                      ),
                    ),
                    Container(
                      height: 10,
                      width: 10,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            categoryIndex == 1 ? kBlackColor : kLineDarkColor,
                      ),
                    ),
                    Container(
                      height: 10,
                      width: 10,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            categoryIndex == 2 ? kBlackColor : kLineDarkColor,
                      ),
                    ),
                  ],
                ),
              ),

              // POPULAR SECTION
              Container(
                margin: EdgeInsets.only(top: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                  color: kWhiteColor,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 24,
                        left: 24,
                        right: 24,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular",
                            style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            'Show All',
                            style: blackTextStyle.copyWith(
                              fontWeight: regular,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 310,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            HomePagePopularItem(
                              title: "Poan Chair",
                              imageUrl: "assets/image_product_popular1.png",
                              price: 34,
                              isWishlist: true,
                            ),
                            HomePagePopularItem(
                              title: "Poan Chair",
                              imageUrl: "assets/image_product_popular2.png",
                              price: 34,
                              isWishlist: false,
                            ),
                            HomePagePopularItem(
                              title: "Poan Chair",
                              imageUrl: "assets/image_product_popular3.png",
                              price: 34,
                              isWishlist: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
