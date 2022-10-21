import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../application/auth/auth_cubit.dart';
import '../../../domain/app_user/app_user.dart';
import '../../core/config/app_colors.dart';
import '../../core/config/app_text_styles.dart';
import '../../core/config/svg_paths.dart';
import 'widgets/filter_button.dart';

class PostsSearchScreen extends StatefulWidget {
  const PostsSearchScreen({Key? key}) : super(key: key);

  @override
  State<PostsSearchScreen> createState() => _PostsSearchScreenState();
}

class _PostsSearchScreenState extends State<PostsSearchScreen>
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
    final size = MediaQuery.of(context).size;
    final pagePadding = EdgeInsets.symmetric(
      horizontal: size.width * .04,
      vertical: size.width * .04,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Search",
          style: TextStyle(
            fontSize: size.width * .045,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.darkBlue,
            ),
            onPressed: () {},
          ),
        ],
        leading: Container(
          margin: pagePadding,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(SvgPaths.google),
        ),
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //
    final pagePadding = EdgeInsets.symmetric(
      horizontal: size.width * .04,
      vertical: size.width * .04,
    );

    return Padding(
        padding: pagePadding,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _SearchTextField(size: size),
              FilterButton(
                size: size,
                onTap: () {},
                border: Border.all(color: AppColors.grey1),
              ),
            ],
          ),
          SizedBox(height: size.width * .04),
          Center(
            child: Text(
              "234 posts found",
              style: AppTextStyles.styleWeight600(),
            ),
          ),
          SizedBox(height: size.width * .04),
          Expanded(
              child:
                  ListView(children: const []) // search is still not supported,
              )
        ]));
  }
}

class _SearchTextField extends StatelessWidget {
  const _SearchTextField({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .6,
      height: size.width * .12,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          cursorHeight: size.height * 0.03,
          decoration: InputDecoration(
            constraints: BoxConstraints(maxWidth: size.width),
            filled: true,
            fillColor: Colors.white,
            hintText: "Search",
            hintStyle: AppTextStyles.styleWeight500(
              fontSize: size.width * .04,
              color: AppColors.grey1,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
