import 'package:flutter/material.dart';

import '../../core/models/movie.dart';
import '../../core/themes/font_theme.dart';
import 'helper_widgets/movie_poster.dart';

class PopMoviesSlider extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  const PopMoviesSlider({
    super.key,
    required this.movies,
    this.title,
    required this.onNextPage,
  });

  @override
  State<PopMoviesSlider> createState() => _PopMoviesSliderState();
}

class _PopMoviesSliderState extends State<PopMoviesSlider> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      height: height * 0.36,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                widget.title!,
                style: subTitleFontStyle(context, Colors.white),
              ),
            ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (_, int index) => MoviePoster(widget.movies[index],
                  '$widget.title-$index-$widget.movies[index].id'),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
