import 'package:ecommerce/app_styles.dart';
import 'package:ecommerce/size_confiq.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> Category = ["All items", "Dress", "Hat", "Watch"];
  List<String> icons = ["🤾‍♀️", "👗", "🎩", "⌚"];
  List<String> imageUrl = [
    "https://th.bing.com/th/id/OIP.CZ-28lC-ty4hL4V92TdbMwHaLH?w=186&h=279&c=7&r=0&o=5&dpr=1.25&pid=1.7",
    "https://th.bing.com/th/id/OIP.o7XQy5ByQId3C5aXflyB3QHaLL?w=186&h=281&c=7&r=0&o=5&dpr=1.25&pid=1.7",
    "https://th.bing.com/th/id/OIP.6NWnOhypYICyW7YscUUqOQHaMV?w=186&h=310&c=7&r=0&o=5&dpr=1.25&pid=1.7",
    "https://th.bing.com/th/id/OIP.LK2bVCrae39KyjXP5UpeggHaJ4?w=186&h=248&c=7&r=0&o=5&dpr=1.25&pid=1.7",
    "https://th.bing.com/th/id/OIP.KE1RQza-tXgpX-jPt9an9AHaMV?w=186&h=310&c=7&r=0&o=5&dpr=1.25&pid=1.7"
  ];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hello Welcome ",
                      style: kEncodeSansRegularBold.copyWith(
                        color: kDarkBrown,
                        fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                      ),
                    ),
                    Text(
                      "Albert Stevano ",
                      style: kEncodeSansBold.copyWith(
                        color: kDarkBrown,
                        fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                      ),
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: kGrey,
                  backgroundImage: NetworkImage(
                      "https://th.bing.com/th/id/OIP.TF2MwccEWUuBSkCnn6YiQAHaJY?pid=ImgDet&rs=1"),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: kEncodeSansRegularBold.copyWith(
                      color: kDarkBrown,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    ),
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 13),
                      prefixIcon: const IconTheme(
                        data: IconThemeData(color: kDarkBrown),
                        child: Icon(Icons.search),
                      ),
                      hintText: 'Search Clothes',
                      border: kInputBorder,
                      errorBorder: kInputBorder,
                      disabledBorder: kInputBorder,
                      focusedBorder: kInputBorder,
                      focusedErrorBorder: kInputBorder,
                      enabledBorder: kInputBorder,
                      hintStyle: kEncodeSansRegularBold.copyWith(
                        color: kDarkBrown,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  height: 49,
                  width: 49,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      color: kBlack),
                  child: const Icon(
                    Icons.search,
                    color: kWhite,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: double.infinity,
            height: 36,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: Category.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: 80,
                    height: 36,
                    decoration: BoxDecoration(
                      color: current == index ? kDarkBrown : kWhite,
                      borderRadius: BorderRadius.circular(8),
                      border: current == index
                          ? null
                          : Border.all(color: kGrey, width: 1),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            icons[index],
                            style: TextStyle(
                                color: current == index ? kWhite : kBlack),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            Category[index],
                            style: TextStyle(
                                color: current == index ? kWhite : kBlack),
                          )
                        ]),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MasonryGridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              itemCount: imageUrl.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              child: Image.network(
                                imageUrl[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Positioned(
                            right: 20,
                            top: 20,
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                      Text(
                        'Modern Light clothes',
                        style: kEncodeSansBold.copyWith(
                            color: kBlack, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Modern Light clothes',
                        style: kEncodeSansRegularBold.copyWith(
                            color: kGrey, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            Text("&212.99"),
                            Text("⭐ 5.0")
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
