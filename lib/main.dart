import 'package:flutter/material.dart';
import 'movie_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovieList(),
    );
  }
}

//Card(
//elevation: 4.5,
//color: Colors.white,
//child: ListTile(
//leading: CircleAvatar(
//child: Container(
//width: 500,
//height: 500,
//decoration: BoxDecoration(
//image: DecorationImage(
//image: NetworkImage(movieList[index].poster),
//fit: BoxFit.cover),
//borderRadius: BorderRadius.circular(13.9),
//),
//),
//),
//trailing: Text('...'),
//title: Text(movieList[index].title),
//subtitle: Text('${movieList[index].title}'),
//onTap: () {
//Navigator.push(
//context,
//MaterialPageRoute(
//builder: (context) => MovieListViewDetails(
//movieName: movieList.elementAt(index).title,
//movie: movieList[index],
//),
//),
//);
//},
////                onTap: () => print('Movie name: ${movies.elementAt(index)}'),
//),
//);
