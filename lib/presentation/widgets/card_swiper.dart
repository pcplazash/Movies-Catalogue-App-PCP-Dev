import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../../core/models/movie.dart';

class MainCardSwiper extends StatelessWidget {
  const MainCardSwiper({super.key, required this.movies});

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: height * 0.57,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return SizedBox(
      width: double.infinity,
      height: height * 0.45,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: width * 0.65,
        itemHeight: height * 0.48,
        itemBuilder: (BuildContext context, int index) {
          final movie = movies[index];
          movie.heroId = 'swiper-${movie.id}';

          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const NetworkImage('https://cdn.dribbble.com/users/1294159/screenshots/4433533/media/abb668b0ba75fc9642a7838c9ed3b3bd.gif'),
                  image: NetworkImage(movie.fullPosterImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
