
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../application/auth/auth_cubit.dart';
import '../../../application/category/category_watcher_cubit.dart';
import '../../../application/posts/post_watcher/post_watcher_cubit.dart';
import '../../../domain/category/category.dart';
import '../../../injections.dart';
import '../../../routes.dart';
import '../../core/config/app_colors.dart';
import '../../core/config/app_text_styles.dart';
import '../../core/config/global_functions.dart';
import '../../core/config/svg_paths.dart';
import '../../core/widgets/post_widget.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryWatcherCubit>(
      create: (context) =>
          getIt<CategoryWatcherCubit>()..startWatchCategories(),
      child: Builder(builder: (context) {
        return context.watch<CategoryWatcherCubit>().state.when(
            initial: () => const Scaffold(body: SizedBox()),
            loading: () => Scaffold(body: GlobalUiFunctions.loading()),
            loadedSuccess: ((categories) =>
                _PostsScreen(categories: categories)),
            loadedFailure: (f) => Scaffold(
                  body: Center(child: Text(f.message)),
                ));
      }),
    );
  }
}

class _PostsScreen extends StatefulWidget {
  const _PostsScreen({Key? key, required this.categories}) : super(key: key);

  final List<Category> categories;

  @override
  State<_PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<_PostsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: widget.categories.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = EdgeInsets.symmetric(horizontal: size.width * .04);
    return BlocProvider(
      create: (context) => getIt<PostWatcherCubit>()
        ..watchAllStarted(widget.categories[tabController.index]),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              "Momento",
              style: TextStyle(
                fontSize: size.width * .055,
                fontFamily: "Pacifico",
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.filter_list_rounded,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.more_vert_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  context
                      .read<AuthCubit>()
                      .logout()
                      .then((_) => context.go(Routes.signIn));
                },
              ),
            ],
            leading: Container(
              margin: padding,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(SvgPaths.google),
            ),
            bottom: TabBar(
              isScrollable: true,
              onTap: (index) {
                context
                    .read<PostWatcherCubit>()
                    .changeCategory(widget.categories[tabController.index]);
              },
              labelStyle: AppTextStyles.styleWeight700(
                fontSize: size.width * .041,
                color: AppColors.mainColor,
              ),
              unselectedLabelStyle: AppTextStyles.styleWeight400(
                fontSize: size.width * .04,
                color: AppColors.mainColor,
              ),
              indicatorColor: AppColors.mainColor,
              labelColor: AppColors.mainColor,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: widget.categories
                  .map((category) => Tab(
                        text: category.name.getOrCrash(),
                      ))
                  .toList(),
              controller: tabController,
            ),
          ),
          body: _Body(),
        );
      }),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final state = context.watch<PostWatcherCubit>().state;
    final Size size = MediaQuery.of(context).size;
    final padding = EdgeInsets.symmetric(
      horizontal: size.width * .04,
      vertical: size.width * .04,
    );

    return Column(
      children: [
        Expanded(
          child: Center(
            child: state.when(
              initial: () => const SizedBox(),
              loading: GlobalUiFunctions.loading,
              loadedSuccess: (posts) {
                if (posts.isEmpty) {
                  return GlobalUiFunctions.emptyWidget;
                }
                return ListView(
                    padding: padding,
                    children: posts
                        .map((post) => PostWidget(post: post, size: size))
                        .toList());
              },
              loadedFailure: (_) => Text("Error fetching posts"),
            ),
          ),
        ),
      ],
    );
  }
}
