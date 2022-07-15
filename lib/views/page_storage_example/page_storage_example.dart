import 'package:flutter/material.dart';

class PageStorageExample extends StatelessWidget {
  const PageStorageExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _texttheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PageStorageExample",
          style: _texttheme.bodyLarge,
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(tabs: [
              Tab(
                child: Text("Home", style: _texttheme.bodyMedium),
              ),
              Tab(
                child: Text("Notification", style: _texttheme.bodyMedium),
              ),
              Tab(
                child: Text("Favourites", style: _texttheme.bodyMedium),
              ),
            ]),
            const Expanded(
              child: TabBarView(children: [
                Homecontent(),
                NotificationContent(),
                Favourite(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class Homecontent extends StatelessWidget {
  const Homecontent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        key: const PageStorageKey<String>("homeContent"),
        itemCount: 30,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "Home Content $index",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: Colors.greenAccent),
            ),
          );
        });
  }
}

class NotificationContent extends StatelessWidget {
  const NotificationContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        key: const PageStorageKey<String>("notificationContent"),
        itemCount: 30,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "Notification Content $index",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: Colors.yellowAccent),
            ),
          );
        });
  }
}

class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        key: const PageStorageKey<String>("favouriteContent"),
        itemCount: 30,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "Favourite Content $index",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: Colors.cyanAccent),
            ),
          );
        });
  }
}
