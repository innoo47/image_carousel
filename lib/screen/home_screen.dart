import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_carousel/widget/detail_text.dart';
import 'dart:async';

import 'package:image_carousel/widget/favorite_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        int? nextPage = pageController.page?.toInt();

        if (nextPage == null) {
          return;
        }

        if (nextPage == 4) {
          nextPage = 0;
        } else {
          nextPage++;
        }
        pageController.animateToPage(
          nextPage,
          duration: const Duration(seconds: 3),
          curve: Curves.ease,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    String userName = "_inno.o";

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: SizedBox(
          width: 350,
          height: 650,
          child: Card(
            color: Colors.white,
            elevation: 20,
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Icon(Icons.person),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: GestureDetector(
                              onTap: () {
                                print('이름 클릭');
                              },
                              child: Text(userName),
                            ),
                          ),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Icon(Icons.more_horiz),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: SizedBox(
                    height: 500,
                    child: GestureDetector(
                      onDoubleTap: () {
                        print('더블 탭');
                      },
                      child: PageView(
                        controller: pageController,
                        children: [1, 2, 3, 4, 5]
                            .map(
                              (number) => Image.asset(
                                'asset/img/image_$number.jpeg',
                                fit: BoxFit.cover,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
                const Flexible(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FavoriteWidget(),
                        DetailText(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
