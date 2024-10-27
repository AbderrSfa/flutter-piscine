import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.secondary,
        title: SearchBar(
          backgroundColor: WidgetStatePropertyAll(theme.colorScheme.primary),
          leading: Icon(
            Icons.search,
            color: theme.colorScheme.onPrimary,
          ),
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(10.0),
            child: SizedBox(
              height: 10,
            )),
        actions: [
          IconButton(
            icon: const Icon(Icons.gps_fixed),
            color: theme.colorScheme.onPrimary,
            onPressed: () {},
          ),
        ],
      ),
      body: TabBarView(
        children: [
          Center(
            child: Text("Currently", style: textTheme),
          ),
          Center(
            child: Text("Today", style: textTheme),
          ),
          Center(
            child: Text("Weekly", style: textTheme),
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
