import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String url;
  final BoxFit? boxFit;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double borderTopLeftRadius;
  final double borderTopRightRadius;
  final double borderBottomLeftRadius;
  final double borderBottomRightRadius;
  final bool isOnlyRadius;
  final bool isUser;
  final Alignment alignment;
  const CustomCachedNetworkImage({
    super.key,
    required this.url,
    this.boxFit,
    this.width = 150,
    this.height = 150,
    this.isOnlyRadius = false,
    this.borderRadius = 50,
    this.borderBottomLeftRadius = 0,
    this.borderBottomRightRadius = 0,
    this.borderTopLeftRadius = 0,
    this.borderTopRightRadius = 0,
    this.alignment = Alignment.center,
    this.isUser = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          (isOnlyRadius)
              ? BorderRadius.only(
                topLeft: Radius.circular(borderTopLeftRadius),
                topRight: Radius.circular(borderTopRightRadius),
                bottomLeft: Radius.circular(borderBottomLeftRadius),
                bottomRight: Radius.circular(borderBottomRightRadius),
              )
              : BorderRadius.circular(borderRadius ?? 0.0),
      child:
          (Uri.parse(url).isAbsolute && url.isNotEmpty)
              ? CachedNetworkImage(
                imageUrl: url,
                fit: (boxFit) ?? BoxFit.cover,
                width: width,
                height: height,
                alignment: Alignment.topCenter,
                placeholder:
                    (context, url) => Center(
                      child: Container(
                        width: width,
                        height: height,
                        padding: const EdgeInsets.all(15),
                        child: Center(child: CircularProgressIndicator.adaptive(strokeWidth: 1.5)),
                      ),
                    ),
                errorWidget:
                    (context, url, error) => Container(
                      padding: const EdgeInsets.all(5),
                      child: isUser ? Icon(Icons.person_rounded, size: 25) : Icon(Icons.image, size: 25),
                    ),
              )
              : Container(
                padding: const EdgeInsets.all(5),
                child: isUser ? Icon(Icons.person_rounded, size: 25) : Icon(Icons.image, size: 25),
              ),
    );
  }
}
