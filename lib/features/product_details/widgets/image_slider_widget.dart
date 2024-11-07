import 'package:flutter/material.dart';

class ImageSliderWidget extends StatelessWidget {
  final List<String> imageUrls;

  // ignore: use_super_parameters
  const ImageSliderWidget({Key? key, required this.imageUrls})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Image.network(
            imageUrls[index],
            fit: BoxFit.cover,
            width: double.infinity,
          );
        },
      ),
    );
  }
}
