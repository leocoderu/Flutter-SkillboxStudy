// Packages
import 'package:cloud_firestore/cloud_firestore.dart';

// Layers
import 'package:model/model.dart';

class PlaceRepo {
  late CollectionReference<Place> _places;

  Future<List<Place>?> getPlaces() async {
    _places = await FirebaseFirestore.instance.collection('places').withConverter<Place>(
      fromFirestore: (snapshot, _) => Place.fromJson(snapshot.data()!),
      toFirestore: (place, _) => place.toJson(),
    );

    QuerySnapshot querySnapshot = await _places.get();
    return querySnapshot.docs.map<Place>((e) => e.data() as Place).toList();
  }
}