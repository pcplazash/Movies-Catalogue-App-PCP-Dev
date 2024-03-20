
import '../widgets_barrel.dart';

class Overview extends StatelessWidget {
  final Movie movie;

  const Overview({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: bodyFontStyle(context, const Color(0xffD7D8DB)),
      ),
    );
  }
}