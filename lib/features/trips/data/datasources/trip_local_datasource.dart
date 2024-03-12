import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app_riverpood/features/trips/data/models/trip_model.dart';

class TripLocalDataSource {
  final Box<TripModel> tripBox;

  TripLocalDataSource({required this.tripBox});

  List<TripModel> getTrips() {
    return tripBox.values.toList();
  }

  addTrip(TripModel trip) {
    tripBox.add(trip);
  }

  deleteTrip(int index) {
    tripBox.delete(index);
  }
}
