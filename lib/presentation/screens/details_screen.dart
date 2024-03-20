import '../widgets/widgets_barrel.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(movie: movie),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                PosterAndTitle(
                  movie: movie,
                ),
                Overview(movie: movie),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Cast',
                        style: bodyFontStyle(
                            context, Colors.tealAccent.withGreen(250))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CastingCards(
                    movieId: movie.id,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


