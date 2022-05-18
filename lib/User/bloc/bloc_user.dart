import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trips/Place/model/place.dart';
import 'package:trips/Place/repository/firebase_storage_repository.dart';
import 'package:trips/User/model/user.dart';
import 'package:trips/User/repository/auth_repository.dart';
import 'package:trips/User/repository/cloud_firestore_api.dart';
import 'package:trips/User/repository/cloud_firestore_repository.dart';
import 'package:trips/User/ui/widgets/card_image_profile.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  // Stream Controller
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();

  Stream<User?> get authStatus => streamFirebase;

  Future<User?> get currentUser async => FirebaseAuth.instance.currentUser;
  // Casos de uso de objeto User

  // 1. Iniciar sesión al app con Google
  Future<UserCredential> signIn() => _auth_repository.signInFirebase();

  // 2. Cerrar sesión
  signOut() => _auth_repository.signOut();

  // 3. Registrar usuario en BD
  final _cloudFirestoreRepository = CloudFirestoreRepository();

  updateUserData(UserModel user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreRepository.updatePlaceData(place);

  Stream<QuerySnapshot> placesListStream = FirebaseFirestore.instance
      .collection(CloudFirestoreAPI().PLACES)
      .snapshots();

  Stream<QuerySnapshot> get placesStream => placesListStream;

  List<CardImageProfile> buildPlaces(
          List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreRepository.buildPlaces(placesListSnapshot);

  final _firebaseStorageRepository = FirebaseStorageRepository();

  Future<UploadTask> uploadFile(String path, PickedFile image) =>
      _firebaseStorageRepository.uploadFile(path, image);

  @override
  void dispose() {}
}
