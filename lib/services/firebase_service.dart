import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign up user
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Login user
  Future<User?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Save user review and rating
  Future<void> saveReview(String movieId, String review, double rating) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('reviews').add({
        'userId': user.uid,
        'movieId': movieId,
        'review': review,
        'rating': rating,
        'timestamp': Timestamp.now(),
      });
    }
  }

  // Get reviews for a movie
  Stream<QuerySnapshot> getReviews(String movieId) {
    return _firestore
        .collection('reviews')
        .where('movieId', isEqualTo: movieId)
        .snapshots();
  }
}
