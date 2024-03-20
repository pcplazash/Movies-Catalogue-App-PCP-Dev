
import '../widgets_barrel.dart';

class PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const PosterAndTitle({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const NetworkImage(
                    'https://cdn.dribbble.com/users/1294159/screenshots/4433533/media/abb668b0ba75fc9642a7838c9ed3b3bd.gif'),
                image: NetworkImage(movie.fullBackdropPath),
                height: height * 0.19,
                width: height * 0.13,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width - 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: subTitleFontStyle(context, Color(0xff9AF5FF)),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  movie.originalTitle,
                  style: bodyFontStyle(context, Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_border_outlined,
                      size: 15,
                      color: Colors.yellowAccent,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${movie.voteAverage}',
                      style: smallFontStyle(
                          context,
                          movie.voteAverage >= 7
                              ? Colors.tealAccent.withGreen(250)
                              : Colors.redAccent),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
