import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../theme/theme.dart';

/// Animated Game Boy style button
/// Uses implicit animations and haptic feedback for enhanced UX
class AnimatedGameBoyButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final Widget? icon;
  final bool enabled;

  const AnimatedGameBoyButton({
    required this.label,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width = 160,
    this.height = 40,
    this.icon,
    this.enabled = true,
    super.key,
  });

  @override
  State<AnimatedGameBoyButton> createState() => _AnimatedGameBoyButtonState();
}

class _AnimatedGameBoyButtonState extends State<AnimatedGameBoyButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _glowAnimation;

  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _glowAnimation = Tween<double>(begin: 0.3, end: 0.8).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    if (!widget.enabled) return;
    setState(() => _isPressed = true);
    _animationController.forward();

    HapticFeedback.lightImpact();
  }

  void _onTapUp(TapUpDetails details) {
    if (!widget.enabled) return;
    setState(() => _isPressed = false);
    _animationController.reverse();
    widget.onPressed?.call();
  }

  void _onTapCancel() {
    if (!widget.enabled) return;
    setState(() => _isPressed = false);
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        widget.backgroundColor ?? AppColors.contrastCardBackground;
    final borderColor = widget.textColor ?? AppColors.brightGreen;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: borderColor.withOpacity(widget.enabled ? 1.0 : 0.5),
                  width: 2,
                ),
                boxShadow: widget.enabled
                    ? [
                        BoxShadow(
                          color: borderColor.withOpacity(_glowAnimation.value),
                          blurRadius: _isPressed ? 8 : 4,
                          offset: const Offset(0, 0),
                        ),
                      ]
                    : null,
              ),
              child: _ButtonContent(
                label: widget.label,
                icon: widget.icon,
                textColor: widget.textColor,
                enabled: widget.enabled,
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Button content with icon and text
class _ButtonContent extends StatelessWidget {
  final String label;
  final Widget? icon;
  final Color? textColor;
  final bool enabled;

  const _ButtonContent({
    required this.label,
    this.icon,
    this.textColor,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    final color = (textColor ?? AppColors.brightGreen).withOpacity(
      enabled ? 1.0 : 0.5,
    );

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            IconTheme(
              data: IconThemeData(color: color, size: 16),
              child: icon!,
            ),
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
