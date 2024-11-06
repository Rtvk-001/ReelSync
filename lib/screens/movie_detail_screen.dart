import 'package:flutter/material.dart';
import 'firebase_service.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String movieId;
  final FirebaseService _firebaseService = FirebaseService();

  MovieDetailsScreen({required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movie Details')),
      body: Column(
        children: [
          // Add synopsis and cast here based on the movieId
          Expanded(
            child: StreamBuilder(
              stream: _firebaseService.getReviews(movieId),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return ListTile(
                      title: Text(doc['review']),
                      subtitle: Text('Rating: ${doc['rating']}'),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
