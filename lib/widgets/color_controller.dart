import 'package:flutter/material.dart';
import 'package:test_application/core/app_border_radius.dart';
import 'package:test_application/core/app_spacing.dart';

class ColorController extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final bool isShown;
  final String text;
  final Color color;
  const ColorController({
    super.key,
    required this.color,
    required this.icon,
    required this.isShown,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      maintainState: true,
      maintainAnimation: true,
      maintainSize: true,
      visible: isShown,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(AppBorderRadius.xl),
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.s),
              child: Icon(icon, color: color),
            ),
          ),
          Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
