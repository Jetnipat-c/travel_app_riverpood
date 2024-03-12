import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app_riverpood/features/trips/domain/entities/trip.dart';
import 'package:travel_app_riverpood/features/trips/presentation/providers/trip_provider.dart';

class AddTripScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController(text: 'City 1');
  final _descController = TextEditingController(text: 'Best city in the world');
  final _locationController = TextEditingController(text: 'Paris, France');
  final _pictureController =
      TextEditingController(text: 'https://picsum.photos/200/300');

  List<String> pictures = [];

  AddTripScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Column(children: [
        TextFormField(
          controller: _titleController,
          decoration: const InputDecoration(labelText: 'Title'),
        ),
        TextFormField(
          controller: _descController,
          decoration: const InputDecoration(labelText: 'Description'),
        ),
        TextFormField(
          controller: _locationController,
          decoration: const InputDecoration(labelText: 'Location'),
        ),
        TextFormField(
          controller: _pictureController,
          decoration: const InputDecoration(labelText: 'Photo'),
        ),
        ElevatedButton(
            onPressed: () {
              pictures.add(_pictureController.text);
              if (_formKey.currentState!.validate()) {
                final newTrip = Trip(
                    title: _titleController.text,
                    description: _descController.text,
                    date: DateTime.now(),
                    location: _locationController.text,
                    photos: pictures);
                ref.read(tripListNotifierProvider.notifier).addNewTrip(newTrip);
                ref.watch(tripListNotifierProvider.notifier).loadTrips();
              }
            },
            child: const Text('Add Trip'))
      ]),
    );
  }
}
