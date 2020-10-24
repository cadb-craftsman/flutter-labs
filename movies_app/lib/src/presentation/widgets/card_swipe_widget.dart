import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movies_app/src/data/model/movies.dart';

class CardSwiper extends StatelessWidget {
  final Movies movies;

  CardSwiper({@required this.movies});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/images/no-image.jpg'),
              image: NetworkImage(movies.movieList[index].getPosterImage()),
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: movies.movieList.length,
        itemWidth: _screenSize.width * 0.5,
        itemHeight: _screenSize.height * 0.4,
        layout: SwiperLayout.STACK,
        //pagination: new SwiperPagination(),
        //control: new SwiperControl(),
      ),
    );
  }
}
