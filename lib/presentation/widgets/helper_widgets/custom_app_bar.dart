
import 'package:google_fonts/google_fonts.dart';

import '../widgets_barrel.dart';

class CustomAppBar extends StatelessWidget {
  final Movie movie;

  const CustomAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          color: Colors.black45,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10, left: 12, right: 12),
          child: Text(
            movie.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.sourceSans3(
              textStyle: bodyFontStyle(context, Colors.white).copyWith(fontWeight: FontWeight.bold)

           ),
          ),
        ),
        background: FadeInImage(
          placeholder: const NetworkImage(
              'https://cdn.dribbble.com/userupload/10245506/file/original-2ad10c30f36214ae1b66efb04e4ded4b.gif'),
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
