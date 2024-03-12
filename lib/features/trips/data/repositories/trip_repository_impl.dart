import 'package:dartz/dartz.dart';
import 'package:travel_app_riverpood/core/error/failures.dart';
import 'package:travel_app_riverpood/features/trips/data/datasources/trip_local_datasource.dart';
import 'package:travel_app_riverpood/features/trips/data/models/trip_model.dart';
import 'package:travel_app_riverpood/features/trips/domain/entities/trip.dart';
import 'package:travel_app_riverpood/features/trips/domain/repositories/trip_repository.dart';

class TripRepositoryImpl implements TripRepository {
  final TripLocalDataSource localDataSource;

  TripRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addTrip(Trip trip) async {
    final tripModel = TripModel.fromEntity(trip);
    localDataSource.addTrip(tripModel);
  }

  @override
  Future<void> deleteTrip(int index) async {
    localDataSource.deleteTrip(index);
  }

  @override
  Future<Either<Failure, List<Trip>>> getTrips() async {
    // final tripModels = localDataSource.getTrips();
    // List<Trip> res = tripModels.map((model) => model.toEntity()).toList();
    // return res;
    try {
      final tripModels = localDataSource.getTrips();
      List<Trip> res = tripModels.map((model) => model.toEntity()).toList();
      return Right(res);
    } catch (err) {
      return Left(SomeSpecificError(message: err.toString()));
    }
  }
}
