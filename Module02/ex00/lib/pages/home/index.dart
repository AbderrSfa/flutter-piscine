import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherappv2proj/pages/home/components/tab_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String coordinates = "";
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final searchController = TextEditingController();

    void onSubmit(String value) {
      setState(() {
        coordinates = value;
        errorMessage = "";
      });
    }

    void onGeoLocationPress() async {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() => errorMessage = "Location service not enabled");
        return;
      }

      // Check for location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() => errorMessage = "Location permission denied");
          return;
        }
      }

      // Check if location permissions are permanently denied
      if (permission == LocationPermission.deniedForever) {
        setState(() => errorMessage =
            "Location permission denied, allow it from the app settings");
        return;
      }

      // Get the current location
      final Position position = await Geolocator.getCurrentPosition();
      setState(() {
        coordinates = "Lat: ${position.latitude}, Long: ${position.longitude}";
        errorMessage = "";
      });
    }

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.secondary,
        title: SearchBar(
          controller: searchController,
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              color: theme.colorScheme.onPrimary,
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(theme.colorScheme.primary),
          leading: IconButton(
            icon: const Icon(Icons.search),
            color: theme.colorScheme.onPrimary,
            onPressed: () => onSubmit(searchController.text),
          ),
          onSubmitted: (value) => onSubmit(value),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: SizedBox(
            height: 10,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.gps_fixed),
            color: theme.colorScheme.onPrimary,
            onPressed: () => onGeoLocationPress(),
          ),
        ],
      ),
      body: TabBarView(
        children: [
          TabPageContent(
            tabTitle: 'Currently',
            coordinates: coordinates,
            errorMessage: errorMessage,
          ),
          TabPageContent(
            tabTitle: 'Today',
            coordinates: coordinates,
            errorMessage: errorMessage,
          ),
          TabPageContent(
            tabTitle: 'Weekly',
            coordinates: coordinates,
            errorMessage: errorMessage,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: theme.colorScheme.secondary,
        child: TabBar(
          dividerColor: theme.colorScheme.secondary,
          indicatorColor: theme.colorScheme.onSecondary,
          tabs: [
            Tab(
              icon: Icon(
                Icons.watch_later,
                color: theme.colorScheme.onSecondary,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.today_rounded,
                color: theme.colorScheme.onSecondary,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.calendar_month,
                color: theme.colorScheme.onSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
