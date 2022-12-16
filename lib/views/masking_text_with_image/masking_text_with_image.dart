import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:high_in_flutter/configs/constants.dart';
import 'package:high_in_flutter/views/masking_text_with_image/widgets/masked_image_widget.dart';
import 'package:high_in_flutter/views/singleton_in_dart/singleton_in_dart.dart';

class MaskTextWithImageScreen extends StatelessWidget {
  const MaskTextWithImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(titleText: "Masked Text With Image"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
              AppConstants.dummyNetworkImagePath2,
              height: _size.height * 0.5,
              width: _size.width * 0.5,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "☝️☝️ Used image ☝️☝️",
            style: Theme.of(context).textTheme.headline4,
          ),
          MaskedImage(
            image: const NetworkImage(
              AppConstants.dummyNetworkImagePath2,
              scale: 0.5,
            ),
            child: Text(
              "Flutter",
              style: GoogleFonts.workSans(
                fontSize: 140,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}