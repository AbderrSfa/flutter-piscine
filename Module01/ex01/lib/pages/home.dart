import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String location = "Place";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    final subtitleStyle = theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    final searchController = TextEditingController();

    void onSubmit(String value) {
      setState(() => location = value);
    }

    void onGeoLocationPress() {
      setState(() => location = "Geolocation");
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Currently", style: titleStyle),
                Text(location, style: subtitleStyle),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Today", style: titleStyle),
                Text(location, style: subtitleStyle),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Weekly", style: titleStyle),
                Text(location, style: subtitleStyle),
              ],
            ),
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
