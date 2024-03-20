import '../widgets_barrel.dart';

class MoviePoster extends StatelessWidget {
  final Movie movie;
  final String heroId;

  const MoviePoster(this.movie, this.heroId, {super.key});

  @override
  Widget build(BuildContext context) {
    movie.heroId = heroId;

    return Container(
      width: 120,
      height: 160,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const NetworkImage(
                      'https://cdn.dribbble.com/users/1294159/screenshots/4433533/media/abb668b0ba75fc9642a7838c9ed3b3bd.gif'),
                  image: NetworkImage(movie.fullPosterImg),
                  width: 120,
                  height: 175,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            movie.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: smallFontStyle(context, Colors.white),
          ),
        ],
      ),
    );
  }
}
