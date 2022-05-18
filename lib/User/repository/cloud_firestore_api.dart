import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trips/Place/model/place.dart';
import 'package:trips/User/model/user.dart';
import 'package:trips/User/ui/widgets/card_image_profile.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String PLACES = "places";

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(UserModel user) async {
    DocumentReference ref = _db.collection(USERS).doc(user.uid);
    return ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true));
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = _db.collection(PLACES);

    String uid = await _auth.currentUser!.uid;

    await refPlaces.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'userOwner': _db.doc("$USERS/$uid"), // REFERENCE
      'urlImage': place.uriImage
    }).then((DocumentReference doc) {
      doc.get().then((DocumentSnapshot snapshot) {
        // snapshot.id;

        // DocumentReference refUsers = _db.collection(USERS).doc(uid);
        // refUsers.update({
        //   'myPlaces': FieldValue.arrayUnion([_db.doc("$PLACES/$snapshot.id")])
        // });

        DocumentReference placeRef = snapshot.reference; // REFERENCIA ARRAY
        DocumentReference refUsers = _db.collection(USERS).doc(uid);
        refUsers.update({
          'myPlaces': FieldValue.arrayUnion([placeRef])
        });
      });
    });
  }

  List<CardImageProfile> buildPlaces(
      List<DocumentSnapshot> placesListSnapshot) {
    List<CardImageProfile> profilePlaces = <CardImageProfile>[];

    placesListSnapshot.forEach((element) {
      profilePlaces.add(CardImageProfile(
          path: element['urlImage'],
          title: element['name'],
          description: element['description']));
    });

    return profilePlaces;
  }
}
