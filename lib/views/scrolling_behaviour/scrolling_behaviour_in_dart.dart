import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScrollingBehaviourInDart extends StatefulWidget {
  const ScrollingBehaviourInDart({Key? key}) : super(key: key);

  @override
  State<ScrollingBehaviourInDart> createState() =>
      _ScrollingBehaviourInDartState();
}

class _ScrollingBehaviourInDartState extends State<ScrollingBehaviourInDart> {
  late ScrollController _sc1;
  late ScrollController _sc2;
  late ScrollController _sc3;

  @override
  void initState() {
    _sc1 = ScrollController();
    _sc2 = ScrollController();
    _sc3 = ScrollController();
    var _pr = Provider.of<MyScrollProvider>(context, listen: false);
    _sc1.addListener(() {
      log("SC1::::::::::: " + _sc1.position.pixels.toString());
      if (_sc1.position.pixels == _sc1.position.minScrollExtent) {
        debugPrint("OK");
        _pr.changePhysics(enableScrolling: true);
      }
    });
    _sc2.addListener(() {
      if (_sc2.offset == _sc2.position.maxScrollExtent) {
        _pr.changePhysics(enableScrolling: false);
        log("YAAA");
      }
    });

    _sc3.addListener(() {
      log("SC3::::::::::: " + _sc3.position.pixels.toString());
    });

    super.initState();
  }

  @override
  void dispose() {
    _sc1.dispose();
    _sc2.dispose();
    _sc3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.8),
        body: SizedBox(
          height: _size.height,
          child: Consumer<MyScrollProvider>(
            builder: (context, myScrollProvider, _) => SingleChildScrollView(
              controller: _sc1,
              child: Column(
                children: [
                  SizedBox(
                    height: _size.height * 0.5,
                    child: ListView.builder(
                      controller: _sc2,
                      physics: myScrollProvider.enablePrimaryScroll
                          ? const AlwaysScrollableScrollPhysics()
                          : const NeverScrollableScrollPhysics(),
                      itemCount: 20,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return const ListTile(
                          leading: Icon(
                            Icons.icecream,
                            color: Colors.amber,
                          ),
                          title: Text("Ice Cream"),
                        );
                      },
                    ),
                  ),
                  ListView.builder(
                    itemCount: 20,
                    controller: _sc3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return const ListTile(
                        leading: Icon(
                          Icons.cake,
                          color: Colors.red,
                        ),
                        title: Text("Cake"),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyScrollProvider extends ChangeNotifier {
  var enablePrimaryScroll = true;
  changePhysics({required bool enableScrolling}) {
    enablePrimaryScroll = enableScrolling;
    notifyListeners();
  }
}
