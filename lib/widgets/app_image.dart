import 'package:algoriza_task/theme/colors.dart';
import 'package:algoriza_task/widgets/shimmer.dart';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String imageUrl;

  const AppImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image(
        image: NetworkImage(imageUrl),
        fit: BoxFit.cover,
        loadingBuilder: (_, __, ___) => Shimmer(
          linearGradient: shimmerGradient,
          child: ShimmerLoading(
            isLoading: true,
            child: Container(
              height: 200,
              width: 200,
              padding: const EdgeInsets.all(32),
              color: Colors.white,
            ),
          ),
        ),
        errorBuilder: (_, __, ___) => const Icon(Icons.error),
      ),
    );
  }
}
