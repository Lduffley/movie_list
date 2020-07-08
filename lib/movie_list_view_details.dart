import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/movie.dart'

class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieListViewDetails({Key key, this.movieName, this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$movieName'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(
            thumbnail: movie.images[0],
          ),
          MovieDetailHeaderWithPoster(
            movie: movie,
          ),
          MovieDetailsCast(
            movie: movie,
          ),
          HorizontalLine(),
          MovieScrollView(
            posters: movie.images,
          ),
        ],
      ),
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieDetailsThumbnail({Key key, this.thumbnail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(thumbnail),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Icon(
              Icons.play_circle_outline,
              size: 100,
              color: Colors.white,
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0x00f5f5f5),
                Color(0xfff5f5f5),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          height: 80,
        ),
      ],
    );
  }
}

class MovieDetailHeaderWithPoster extends StatelessWidget {
  final Movie movie;

  const MovieDetailHeaderWithPoster({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          MoviePoster(
            poster: movie.images[0].toString(),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: MovieDetailsHeader(movie: movie),
          ),
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;

  MoviePoster({this.poster});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                poster,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeader({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '${movie.year} . ${movie.genre}'.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          movie.title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 32,
          ),
        ),
        Text.rich(
          TextSpan(
            children: <TextSpan>[TextSpan(text: movie.plot)],
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  final Movie movie;

  const MovieDetailsCast({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          MovieField(field: 'Cast', value: movie.actors),
          MovieField(field: 'Directors', value: movie.director)
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  final String value;

  const MovieField({Key key, this.field, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$field : ',
          style: TextStyle(
              color: Colors.black38, fontSize: 12, fontWeight: FontWeight.w300),
        ),
        Text(
          value,
          style: TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class MovieScrollView extends StatelessWidget {
  final List<String> posters;

  const MovieScrollView({Key key, this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
          child: Text(
            'More Movie Images',
            style: TextStyle(fontSize: 14, color: Colors.black26),
          ),
        ),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 16),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 160,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            posters[index],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    width: 8,
                  ),
              itemCount: posters.length),
        )
      ],
    );
  }
}
