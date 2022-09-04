import 'package:flutter/material.dart';
import 'package:high_in_flutter/views/shimmer_effect/custom_shimmers.dart';
import 'package:high_in_flutter/views/singleton_in_dart/singleton_in_dart.dart';

class ShimmerLoadingScreen extends StatelessWidget {
  const ShimmerLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(titleText: "Shimmer In Flutter"),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
        child: SizedBox(
          height: _size.height,
          width: _size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      6,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CustomShimmer(
                            height: _size.width * 0.2,
                            width: _size.width * 0.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomShimmer(
                            height: _size.height * 0.3,
                            width: _size.width,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomShimmer(
                            height: _size.height * 0.025,
                            width: _size.width * 0.8,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomShimmer(
                            height: _size.height * 0.025,
                            width: _size.width * 0.5,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
