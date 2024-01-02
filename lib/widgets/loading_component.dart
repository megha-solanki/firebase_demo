import 'package:flutter/material.dart';



class LoadingComponent extends StatelessWidget {
  final Color color;
  final double size;
  final double loadingWidth;

  const LoadingComponent({
    super.key,
    this.color = Colors.indigo,
    this.size = 37,
    this.loadingWidth = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color),
          strokeWidth: loadingWidth,
        ),
      ),
    );
  }
}
