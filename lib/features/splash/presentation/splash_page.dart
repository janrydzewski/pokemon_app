import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_assets.dart';
import '../../../core/app_routes.dart';
import '../../../theme/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  // Animation controllers
  late final AnimationController _enterCtrl;
  late final AnimationController _shakeCtrl;
  late final AnimationController _fadeCtrl;
  late final AnimationController _circleCtrl;

  // Animations
  late final Animation<double> _enterAnim;
  late final Animation<double> _shakeAnim;
  late final Animation<double> _circleAnim;

  // Animation constants
  static const _enterDuration = Duration(milliseconds: 1200);
  static const _shakeDuration = Duration(milliseconds: 1200);
  static const _fadeDuration = Duration(milliseconds: 400);
  static const _circleDuration = Duration(milliseconds: 600);
  static const _pauseBeforeShake = Duration(milliseconds: 300);

  // Rotation values for shake effect (degrees)
  static const List<double> _shakeRotations = [
    0.0,
    -6.5,
    7.5,
    4.5,
    3.5,
    -6.5,
    -0.5,
    -3.5,
    2.5,
    6.5,
    -4.5,
    -1.5,
    -0.5,
    1.5,
    -4.5,
    -1.5,
    3.5,
    -5.5,
    -4.5,
    4.5,
    1.5,
    1.5,
    -4.5,
    2.5,
    7.5,
    -4.5,
    -3.5,
    -2.5,
    7.5,
    -4.5,
    0.5,
    3.5,
    0,
  ];

  @override
  void initState() {
    super.initState();
    _setupAnimations();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
      _startSequence();
    });
  }

  void _setupAnimations() {
    _enterCtrl = AnimationController(vsync: this, duration: _enterDuration);
    _enterAnim = CurvedAnimation(parent: _enterCtrl, curve: Curves.easeOutBack);

    _shakeCtrl = AnimationController(vsync: this, duration: _shakeDuration);
    _shakeAnim = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _shakeCtrl, curve: Curves.linear));

    _fadeCtrl = AnimationController(vsync: this, duration: _fadeDuration);

    _circleCtrl = AnimationController(vsync: this, duration: _circleDuration);
    _circleAnim = CurvedAnimation(
      parent: _circleCtrl,
      curve: Curves.easeInQuart,
    );
  }

  Future<void> _startSequence() async {
    await _enterCtrl.forward();
    await Future.delayed(_pauseBeforeShake);

    _shakeCtrl.repeat(reverse: true);
    await Future.delayed(_shakeDuration);
    _shakeCtrl.stop();

    await _circleCtrl.forward();
    await _fadeCtrl.forward();

    if (!mounted) return;
    context.goNamed(AppRouteName.list);
  }

  @override
  void dispose() {
    _enterCtrl.dispose();
    _shakeCtrl.dispose();
    _fadeCtrl.dispose();
    _circleCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final maxDimension = math.max(screenSize.width, screenSize.height);

    return Scaffold(
      backgroundColor: AppColors.seed,
      body: Stack(
        children: [
          _buildPokeballAnimation(screenSize.width),
          _buildCircleExpansion(maxDimension),
          _buildFadeOverlay(),
        ],
      ),
    );
  }

  Widget _buildPokeballAnimation(double screenWidth) {
    return AnimatedBuilder(
      animation: Listenable.merge([_enterAnim, _shakeAnim]),
      builder: (_, child) {
        final translationX = _calculateTranslationX(screenWidth);
        final rotation = _calculateTotalRotation();

        return Transform.translate(
          offset: Offset(translationX, 0),
          child: Transform.rotate(
            angle: _degreesToRadians(rotation),
            child: child,
          ),
        );
      },
      child: Center(
        child: Image.asset(AppAssets.pokeball, width: 120, height: 120),
      ),
    );
  }

  Widget _buildCircleExpansion(double maxDimension) {
    return AnimatedBuilder(
      animation: _circleAnim,
      builder: (context, child) {
        return Positioned.fill(
          child: ClipPath(
            clipper: CircleClipper(_circleAnim.value * maxDimension * 1.5),
            child: Container(color: Colors.white),
          ),
        );
      },
    );
  }

  Widget _buildFadeOverlay() {
    return FadeTransition(
      opacity: _fadeCtrl,
      child: Container(color: Colors.white),
    );
  }

  double _calculateTranslationX(double screenWidth) {
    return -screenWidth / 2 * (1 - _enterAnim.value);
  }

  double _calculateTotalRotation() {
    final rollRotation = _calculateRollRotation();
    final shakeRotation = _calculateShakeRotation();
    return rollRotation + shakeRotation;
  }

  double _calculateRollRotation() {
    if (_enterCtrl.status == AnimationStatus.forward) {
      return _enterAnim.value * 720;
    }
    return 0;
  }

  double _calculateShakeRotation() {
    if (_shakeCtrl.status == AnimationStatus.forward ||
        _shakeCtrl.status == AnimationStatus.reverse) {
      final index = (_shakeAnim.value * (_shakeRotations.length - 1)).floor();
      return _shakeRotations[index.clamp(0, _shakeRotations.length - 1)];
    }
    return 0;
  }

  double _degreesToRadians(double degrees) {
    return degrees * (math.pi / 180);
  }
}

class CircleClipper extends CustomClipper<Path> {
  final double radius;

  CircleClipper(this.radius);

  @override
  Path getClip(Size size) {
    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    path.addOval(Rect.fromCircle(center: center, radius: radius));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
