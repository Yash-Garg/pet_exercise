import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petperfect_exercise/ui/posts/cubit/post_cubit.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostCubit(),
      child: const PostView(),
    );
  }
}

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  void initState() {
    super.initState();
    context.read<PostCubit>().started();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!state.loading && state.posts != null) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: state.posts!.length,
              itemBuilder: (context, index) {
                final post = state.posts![index];

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ListTile(
                      title: Text(post.title),
                      minVerticalPadding: 10,
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(post.body),
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return Center(
              child: Text(
            state.error!.message!,
            style: TextStyle(fontSize: 20.0),
          ));
        },
      ),
    );
  }
}
