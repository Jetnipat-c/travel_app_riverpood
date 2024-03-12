import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:travel_app_riverpood/features/trips/presentation/providers/trip_provider.dart';
import 'package:travel_app_riverpood/features/trips/presentation/widgets/custom_search_bar.dart';
import 'package:travel_app_riverpood/features/trips/presentation/widgets/travel_card.dart';

class MyTripsScreen extends ConsumerWidget {
  const MyTripsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripList = ref.watch(tripListNotifierProvider);
    print("tripList: $tripList");
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(children: [
        CustomSearchBar(),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tripList.length,
          itemBuilder: (context, index) {
            final trip = tripList[index];
            print("trip: $trip");
            // return Text(trip.title);
            return TravelCard(
                imageUrl: trip.photos[0],
                title: trip.title,
                description: trip.description,
                date: DateFormat.yMMMEd().format(trip.date).toString(),
                location: trip.location,
                onDelete: () {
                  ref.read(tripListNotifierProvider.notifier).removeTrip(index);
                  ref.read(tripListNotifierProvider.notifier).loadTrips();
                });
          },
        )
      ]),
    );
  }
}
