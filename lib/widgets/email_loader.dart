import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EmailLoader extends StatelessWidget {
  const EmailLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Shimmer.fromColors(
        baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
        highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _shimmerBox(height: 20, width: 200),
            const SizedBox(height: 12),
            _shimmerBox(height: 16, width: double.infinity),
            const SizedBox(height: 8),
            _shimmerBox(height: 16, width: double.infinity),
            const SizedBox(height: 24),
            _shimmerBox(height: 200, width: double.infinity),
          ],
        ),
      ),
    );
  }

  Widget _shimmerBox({required double height, required double width}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
