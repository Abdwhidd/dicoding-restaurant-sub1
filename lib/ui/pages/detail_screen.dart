import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:restaurant/model/RestaurantResponse.dart';
import 'package:restaurant/ui/components/custom_detail_card.dart';
import 'package:restaurant/ui/components/custom_favorite_button.dart';
import 'package:restaurant/ui/theme/ColorTheme.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detailscreen';
  final Restaurant restaurant;
  const DetailScreen({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          restaurant.name,
          style: whiteTextStyle.copyWith(
              fontWeight: FontWeight.w600, fontSize: 18),
        ),
        backgroundColor: ColorTheme.redColor,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Hero(
                tag: restaurant.pictureId,
                child: Image.network(
                  restaurant.pictureId,
                  height: MediaQuery.of(context).size.width * 0.5,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        restaurant.name,
                        style: blackTextStyle.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      CustomFavoriteButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      size: 24,
                      color: ColorTheme.blackColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurant.city,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          Text(
                            'Jl. Lorem Ipsum No. 10',
                            style: greyTextStyle.copyWith(
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.star,
                      color: ColorTheme.orangeColor,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      restaurant.rating.toString(),
                      style:
                          blackTextStyle.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: blackTextStyle.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    restaurant.description,
                    style: greyTextStyle.copyWith(fontWeight: FontWeight.w500),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Text(
                    'Foods',
                    style: blackTextStyle.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: restaurant.menus.foods!
                          .map(
                            (food) => Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              decoration: BoxDecoration(
                                color: ColorTheme.greyColor,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  food.name!,
                                  style: whiteTextStyle.copyWith(
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Text(
                    'Drinks',
                    style: blackTextStyle.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: restaurant.menus.drinks!
                          .map((drink) => Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                decoration: BoxDecoration(
                                  color: ColorTheme.greyColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    drink.name!,
                                    style: whiteTextStyle.copyWith(
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
