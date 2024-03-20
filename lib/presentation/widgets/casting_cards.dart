import 'package:movies_catalogue/presentation/widgets/widgets_barrel.dart';


class CastingCards extends StatelessWidget {
  final int movieId;

  const CastingCards({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 100),
            height: 180,
            child: const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 100),
            height: 180,
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 100),
            height: 180,
            child: const Text('No cast information available'),
          );
        } else {
          final List<Cast> cast = snapshot.data!;
          return Container(
            margin: const EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: 180,
            child: ListView.builder(
              itemCount: cast.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index) => _CastCard(cast[index]),
            ),
          );
        }
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final Cast actor;

  const _CastCard(this.actor);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const NetworkImage(
                  'https://cdn.dribbble.com/users/1294159/screenshots/4433533/media/abb668b0ba75fc9642a7838c9ed3b3bd.gif'),
              image: NetworkImage(actor.fullProfilePath),
              width: height * 0.12,
              height: height * 0.15,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            actor.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: smallFontStyle(context, Colors.white),
          ),
        ],
      ),
    );
  }
}
