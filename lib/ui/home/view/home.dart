import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petperfect_exercise/ui/home/cubit/home_cubit.dart';
import 'package:petperfect_exercise/ui/posts/post.dart';
import 'package:petperfect_exercise/utils/video_player.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().started();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.loading && !state.hasError) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        if (!state.loading && state.imageUrl != null) {
          final url = state.imageUrl!.toLowerCase();
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: url.contains('.jpeg') ||
                        url.contains('.jpg') ||
                        url.contains('.png') ||
                        url.contains('.gif')
                    ? CachedNetworkImage(
                        imageUrl: state.imageUrl!,
                        progressIndicatorBuilder: (_, __, ___) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : VideoPlayerWidget(videoURL: state.imageUrl!),
              ),
            ),
            floatingActionButton: !state.loading
                ? FloatingActionButton(
                    child: const Icon(
                      Icons.skip_next_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute<dynamic>(
                        builder: (_) => const PostsPage(),
                      ),
                    ),
                  )
                : null,
          );
        }

        return const Center(child: Text('Error'));
      },
    );
  }
}
