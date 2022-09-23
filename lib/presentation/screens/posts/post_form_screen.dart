import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:moments_app/application/category/category_watcher_cubit.dart';
import 'package:moments_app/application/category/category_watcher_state.dart';
import 'package:moments_app/application/posts/post_form/post_form_cubit.dart';
import 'package:moments_app/injections.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../../application/posts/post_form/post_form_state.dart';

class PostFormScreen extends StatelessWidget {
  const PostFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocProvider(
      providers: [
        BlocProvider<PostFormCubit>(
          create: (context) => getIt<PostFormCubit>(),
        ),
        BlocProvider<CategoryWatcherCubit>(
          create: (context) =>
              getIt<CategoryWatcherCubit>()..startWatchCategories(),
        ),
      ],
      child: Body(),
    ));
  }
}

class Body extends HookWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useState(CustomTextfieldTagsController());
    final state = context.watch<PostFormCubit>().state;

    useEffect(() {
      void callback() => context
          .read<PostFormCubit>()
          .tagsChanged(controller.value.getTags ?? []);
      controller.value.addListener(callback);
      return () => controller.removeListener(callback);
    }, [controller]);

    return BlocListener<PostFormCubit, PostFormState>(
      listener: (context, state) {
        state.actionFailureOrSuccess?.fold((f) {
          log(f.message);
        }, (_) {
          log("post has been successfully created.");
        });
      },
      child: Form(
        autovalidateMode: state.showErrors
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Moment"),
                SizedBox(height: 10),
                TextFormField(
                  validator: (_) => state.postBody.failureOrValue
                      .fold((f) => f.message, (r) => null),
                  onChanged: (value) =>
                      context.read<PostFormCubit>().postBodyChanged(value),
                  maxLines: 8,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "What happened?"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (_) => context
                      .read<PostFormCubit>()
                      .state
                      .tags
                      .failureOrValue
                      .fold((f) => f.message, (_) => null),
                  controller: controller.value.textEditingController,
                  focusNode: controller.value.focusNode,
                  onFieldSubmitted: controller.value.onSubmitted,
                  onChanged: controller.value.onChanged,
                  decoration: InputDecoration(
                    isDense: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 74, 137, 92),
                        width: 3.0,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 74, 137, 92),
                        width: 3.0,
                      ),
                    ),
                    hintText: controller.value.hasTags ? '' : "Enter tag...",
                    prefixIcon: controller.value.hasTags
                        ? SingleChildScrollView(
                            controller: controller.value.scrollController,
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children:
                                    controller.value.getTags!.map((String tag) {
                              return Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  color: Color.fromARGB(255, 74, 137, 92),
                                ),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      child: Text(
                                        tag,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      onTap: () {},
                                    ),
                                    const SizedBox(width: 4.0),
                                    InkWell(
                                      child: const Icon(
                                        Icons.cancel,
                                        size: 14.0,
                                        color:
                                            Color.fromARGB(255, 233, 233, 233),
                                      ),
                                      onTap: () {
                                        controller.value.onTagDelete(tag);
                                      },
                                    )
                                  ],
                                ),
                              );
                            }).toList()),
                          )
                        : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                BlocBuilder<CategoryWatcherCubit, CategoryWatcherState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loadedSuccess: (categories) {
                        return DropdownButtonFormField<String>(
                            validator: (value) => context
                                .read<PostFormCubit>()
                                .state
                                .category
                                .name
                                .failureOrValue
                                .fold((f) => f.message, (_) => null),
                            value: categories[0].name.getOrCrash(),
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                            items: categories
                                .map(
                                  (category) => DropdownMenuItem(
                                      value: category.name.getOrCrash(),
                                      child: Text(category.name.getOrCrash())),
                                )
                                .toList(),
                            onChanged: (value) {
                              context
                                  .read<PostFormCubit>()
                                  .categoryChanged(value!);
                            });
                      },
                      loadedFailure: (f) {
                        return Center(child: Text("Failed loading categories"));
                      },
                      orElse: () => CircularProgressIndicator(),
                    );
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Spacer(),
                    SizedBox(
                        width: 150,
                        child: ElevatedButton(
                            onPressed: () async {
                              await context.read<PostFormCubit>().created();
                            },
                            child: Text("Create"))),
                    Spacer()
                  ],
                )
              ]),
        ),
      ),
    );
  }
}

class CustomTextfieldTagsController extends TextfieldTagsController {
  CustomTextfieldTagsController() {
    init(null, LetterCase.capital, [], TextEditingController(), FocusNode(),
        null);
  }
}
