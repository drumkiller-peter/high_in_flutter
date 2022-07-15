import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:high_in_flutter/configs/app_colors.dart';
import 'package:high_in_flutter/configs/constants.dart';
import 'package:high_in_flutter/views/dark_mode_implementation/dark_mode_provider.dart';
import 'package:provider/provider.dart';

class DarkModeExampleBodyWidget extends StatelessWidget {
  const DarkModeExampleBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    var _myProvider = Provider.of<DarkModeProvider>(context, listen: false);
    return Row(
      children: [
        Flexible(
          child: Drawer(
            child: SingleChildScrollView(
              child: _size.width > 900
                  ? const SideMEnuForBiggerScreen()
                  : const SideMenuForSmallerScreen(),
            ),
          ),
        ),
        Flexible(
          child: Drawer(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DrawerHeader(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: CachedNetworkImageProvider(
                          AppConstants.dummyNetworkImagePath,
                          errorListener: () {
                        log("ERRor");
                      }),
                    ),
                  ),
                  Switch.adaptive(
                    value: _myProvider.darkTheme,
                    onChanged: (val) {
                      _myProvider.darkTheme = !_myProvider.darkTheme;
                    },
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            "HELLO WORLD!!!",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                "Screen Width: ${_size.width.toString()}",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.spotifyGreen),
                ),
                onPressed: () {
                  _myProvider.darkTheme = !_myProvider.darkTheme;
                },
                child: const Icon(Icons.light_mode),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SideMEnuForBiggerScreen extends StatelessWidget {
  const SideMEnuForBiggerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerHeader(
          child: CircleAvatar(
            radius: 70,
            backgroundImage: CachedNetworkImageProvider(
                AppConstants.dummyNetworkImagePath, errorListener: () {
              log("ERRor");
            }),
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return const ListTile(
                title: Text("Who are you?!"),
              );
            }),
      ],
    );
  }
}

class SideMenuForSmallerScreen extends StatelessWidget {
  const SideMenuForSmallerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DrawerHeader(
          child: CircleAvatar(
            radius: 70,
            backgroundImage: CachedNetworkImageProvider(
              AppConstants.dummyNetworkImagePath,
            ),
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  "title ${index.toString()}",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              );
            }),
      ],
    );
  }
}
