import '../../core/themes/font_theme.dart';
import '../search/search_delegate.dart';
import '../widgets/card_swiper.dart';
import '../widgets/movie_slider.dart';
import '../widgets/widgets_barrel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Busca cualquier Película',
            style: subTitleFontStyle(context, Colors.black87),
          ),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: MovieSearchDelegate()),
                icon: const Icon(
                  Icons.search,
                  color: Colors.black87,
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Películas Recientes',
                      style: subTitleFontStyle(context, Colors.white)),
                ),
              ),
              MainCardSwiper(movies: moviesProvider.onDisplayMovies),
              const SizedBox(height: 8,),
              PopMoviesSlider(
                movies: moviesProvider.popularMovies,
                title: 'Populares',
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
            ],
          ),
        ));
  }
}
