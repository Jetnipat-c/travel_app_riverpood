import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app_riverpood/features/trips/presentation/pages/add_trip_screen.dart';
import 'package:travel_app_riverpood/features/trips/presentation/pages/my_trip_screen.dart';
import 'package:travel_app_riverpood/features/trips/presentation/providers/trip_provider.dart';

class MainScreen extends ConsumerWidget {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(tripListNotifierProvider.notifier).loadTrips();

    _pageController.addListener(() {
      _currentPage.value = _pageController.page!.round();
    });
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi Cheer",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                "Traveling today ?",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          )),
      body: PageView(
        controller: _pageController,
        children: [
          const MyTripsScreen(),
          AddTripScreen(),
          const Text("3"),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: _currentPage,
          builder: (context, pageIndex, child) {
            return BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list), label: "My trips"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.add), label: "Add trips"),
                  BottomNavigationBarItem(icon: Icon(Icons.map), label: "Maps"),
                ],
                currentIndex: pageIndex,
                onTap: (index) => _pageController.jumpToPage(index));
          }),
    );
  }
}
