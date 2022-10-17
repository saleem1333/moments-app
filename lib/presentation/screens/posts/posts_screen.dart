import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../application/auth/auth_cubit.dart';
import '../../../application/posts/post_watcher/post_watcher_cubit.dart';
import '../../../domain/app_user/app_user.dart';
import '../../../domain/posts/posts_repository.dart';
import '../../../injections.dart';
import '../../../routes.dart';
import '../../core/config/app_colors.dart';
import '../../core/config/app_text_styles.dart';
import '../../core/config/global_functions.dart';
import '../../core/config/svg_paths.dart';
import '../../core/widgets/post_widget.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen>
    with SingleTickerProviderStateMixin {
  late final Size size;
  late final EdgeInsetsGeometry pagePadding;
  late final TabController tabController;
  late final AppUser? user;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 10, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
    pagePadding = EdgeInsets.symmetric(horizontal: size.width * .04);
    user = context
        .read<AuthCubit>()
        .user; // we're not using watch here because we don't actually need to listen for changes
  }

  @override
  Widget build(BuildContext context) {
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
          margin: pagePadding,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(SvgPaths.google),
        ),
        bottom: TabBar(
          isScrollable: true,
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
          tabs: List.filled(
            10,
            Tab(
              height: size.height * .07,
              text: "tab",
            ),
          ),
          controller: tabController,
        ),
      ),
      body: BlocProvider<PostWatcherCubit>(
        create: (context) => PostWatcherCubit(
          getIt<PostsRepository>(),
        )..watchAllStarted(),
        child: _Body(),
      ),
    );
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
    //
    final pagePadding = EdgeInsets.symmetric(
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
                  padding: pagePadding,
                  children: List.filled(
                    10,
                    PostWidget(
                      size: size,
                    ),
                  ),
                );
              },
              loadedFailure: (_) => Text("Error fetching posts"),
            ),
          ),
        ),
      ],
    );
  }
}
