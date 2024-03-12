import 'package:dartz/dartz.dart';
import 'package:travel_app_riverpood/core/error/failures.dart';
import 'package:travel_app_riverpood/features/trips/domain/entities/trip.dart';
import 'package:travel_app_riverpood/features/trips/domain/repositories/trip_repository.dart';

class GetTrips {
  final TripRepository repository;

  GetTrips({required this.repository});

  Future<Either<Failure, List<Trip>>> call() {
    return repository.getTrips();
  }
}
