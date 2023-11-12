import 'package:flutter/material.dart';

class TextFade extends StatelessWidget {
  final String text;
  final Color color;
  double? fontSize;
  FontWeight? fontWeight;
  TextFade({
    required this.color,
    required this.text,
    this.fontSize,
    this.fontWeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // 这是用 ChatGPT 生成的一个文本组件，实现了当文本过长时自动淡出的效果。
      // 多多利用 ChatGPT 达到类似的效果、提高开发效率。
      // padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding for the container
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [Colors.white, Colors.transparent],
            stops: [
              0.90,
              1.0
            ], // 90% of the text will be fully visible, the last 10% will fade out
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(bounds);
        },
        blendMode: BlendMode
            .dstIn, // This blend mode will apply the gradient as a mask
        child: Text(
          text,
          softWrap: false,
          overflow:
              TextOverflow.clip, // Clip the overflow to ensure the fade effect
          style: TextStyle(
            fontSize: (fontSize ?? 14.0),
            fontWeight: fontWeight ?? FontWeight.bold,
            color: color,
          ),
          maxLines: 1,
        ),
      ),
    );
  }
}
