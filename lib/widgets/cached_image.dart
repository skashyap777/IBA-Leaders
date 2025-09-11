import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;

  const CachedImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        }

        final loadingWidget =
            placeholder ??
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            );

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: frame == null ? loadingWidget : child,
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return errorWidget ??
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.broken_image,
                color: Colors.grey,
                size: 48,
              ),
            );
      },
    );
  }
}

class BackgroundImage extends StatelessWidget {
  final String imagePath;
  final Widget child;
  final BoxFit fit;

  const BackgroundImage({
    super.key,
    required this.imagePath,
    required this.child,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: fit,
          onError: (error, stackTrace) {
            debugPrint('Error loading background image: $error');
          },
        ),
      ),
      child: child,
    );
  }
}
