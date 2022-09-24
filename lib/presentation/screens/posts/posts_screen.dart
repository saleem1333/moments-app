import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moments_app/application/auth/auth_cubit.dart';
import 'package:moments_app/application/posts/post_watcher/post_watcher_cubit.dart';
import 'package:moments_app/domain/posts/posts_repository.dart';
import 'package:moments_app/injections.dart';

import '../../../routes.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () async {
                context
                    .read<AuthCubit>()
                    .logout()
                    .then((_) => context.go(Routes.signIn));
              },
              icon: Icon(Icons.logout))),
      body: BlocProvider<PostWatcherCubit>(
        create: (context) =>
            PostWatcherCubit(getIt<PostsRepository>())..watchAllStarted(),
        child: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PostWatcherCubit>().state;
    final user = context
        .read<AuthCubit>()
        .user; // we're not using watch here because we don't actually need to listen for changes

    return Column(
      children: [
        if (user != null) Text("Welcome: ${context.read<AuthCubit>().user!}"),
        Expanded(
          child: Center(
              child: state.when(
                  initial: () => Container(),
                  loading: () => const CircularProgressIndicator(),
                  loadedSuccess: (posts) {
                    if (posts.isEmpty) {
                      return Text("No posts yet!");
                    }
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          final post = posts[index];
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            color: Colors.amber,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(post.appUser!.username.getOrCrash()),
                                  ],
                                ),
                                Text(post.content.getOrCrash()),
                                Row(
                                  children: post.tags
                                      .getOrCrash()
                                      .map((tag) => Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          color: Colors.blue,
                                          child: Text(tag.name.getOrCrash())))
                                      .toList(),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                  loadedFailure: (f) => Text("Error fetching posts"))),
        ),
      ],
    );
  }
}
