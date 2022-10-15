import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/config/app_colors.dart';
import '../../core/config/svg_paths.dart';
import '../posts/post_search_screen.dart';
import '../posts/posts_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ValueNotifier<int> indexValue;
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    indexValue = ValueNotifier(0);
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          PostsScreen(),
          PostsSearchScreen(),
          SizedBox(),
          SizedBox(),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: indexValue,
          builder: (context, index, _) {
            return BottomNavigationBar(
              showSelectedLabels: false,
              elevation: 5,
              currentIndex: index,
              onTap: (newIndex) {
                indexValue.value = newIndex;
                pageController.animateToPage(
                  newIndex,
                  duration: Duration(milliseconds: 350),
                  curve: Curves.bounceIn,
                );
              },
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    SvgPaths.homeIcon,
                    color: (index == 0) ? AppColors.mainColor : AppColors.grey1,
                  ),
                  label: "home",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    SvgPaths.searchIcon,
                    color: (index == 1) ? AppColors.mainColor : AppColors.grey1,
                  ),
                  label: "saerch",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    SvgPaths.addIcon,
                    color: (index == 2) ? AppColors.mainColor : AppColors.grey1,
                  ),
                  label: "add post",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    SvgPaths.addIcon,
                    color: (index == 3) ? AppColors.mainColor : AppColors.grey1,
                  ),
                  label: "profile",
                ),
              ],
            );
          }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
