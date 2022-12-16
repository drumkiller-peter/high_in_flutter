//*! this is an example for ImageSwiper and also Singleton in dart */

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:high_in_flutter/configs/app_colors.dart';
import 'package:high_in_flutter/configs/constants.dart';
import 'package:provider/provider.dart';

class SingletonInDartFlutter extends StatelessWidget {
  const SingletonInDartFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => SingletonProvider(),
      lazy: true,
      child: SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(
            titleText: "Singleton Example with Scrolling Dots",
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height:
                    _size.width > 450 ? _size.height * 0.8 : _size.height * 0.5,
                width: _size.width,
                child: Consumer<SingletonProvider>(
                    builder: (context, singletonProvider, _) {
                  return Stack(
                    children: [
                      PagesWidget(
                        singletonProvider: singletonProvider,
                      ),
                      Positioned(
                        bottom: _size.height * 0.01,
                        child: MyDotsWidget(
                          singletonProvider: singletonProvider,
                        ),
                      )
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyDotsWidget extends StatelessWidget {
  const MyDotsWidget({
    Key? key,
    required this.singletonProvider,
  }) : super(key: key);

  final SingletonProvider singletonProvider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: singletonProvider.imageItems.length,
          itemBuilder: (context, dotsIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CircleAvatar(
                radius: 8,
                backgroundColor: singletonProvider.currentIndex == dotsIndex
                    ? Colors.white
                    : Colors.grey.withOpacity(0.4),
              ),
            );
          },
        ),
      ),
    );
  }
}

class PagesWidget extends StatelessWidget {
  const PagesWidget({
    Key? key,
    required this.singletonProvider,
  }) : super(key: key);

  final SingletonProvider singletonProvider;

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return PageView.builder(
      onPageChanged: (pageIndex) {
        singletonProvider.onPageChanged(pageIndex);
      },
      scrollDirection: Axis.horizontal,
      scrollBehavior: const ScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.invertedStylus,
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
        PointerDeviceKind.stylus,
      }),
      itemCount: singletonProvider.imageItems.length,
      itemBuilder: (context, index) {
        return Image.asset(
          singletonProvider.imageItems[index],
          fit: BoxFit.fill,
          width: _size.width,
          height: _size.height,
        );
      },
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.titleText}) : super(key: key);

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        titleText,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: AppColors.white,
            ),
      ),
      backgroundColor: AppColors.spotifyGreenDark,
      actions: const [
        Icon(
          Icons.settings,
          size: 26,
          color: AppColors.white,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class SingletonProvider extends ChangeNotifier {
  int currentIndex = 0;

  void onPageChanged(int pgIndex) {
    //Here pgIndex is the index from PageView.Builder();
    currentIndex = pgIndex;
    notifyListeners();
  }

  var imageItems = [
    AppConstants.singleton1,
    AppConstants.singleton2,
    AppConstants.singleton3,
    AppConstants.singleton4,
    AppConstants.singleton5,
    AppConstants.singleton6,
  ];
}
