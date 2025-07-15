import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Enhanced scroll controller
/// Provides improved scroll physics, better pagination handling, and debug information
class EnhancedScrollController extends ScrollController {
  final double _paginationThreshold;
  final VoidCallback? _onLoadMore;

  bool _isLoadingMore = false;
  bool _hasMore = true;

  EnhancedScrollController({
    double paginationThreshold = 0.85,
    VoidCallback? onLoadMore,
    super.debugLabel,
  }) : _paginationThreshold = paginationThreshold,
       _onLoadMore = onLoadMore;

  void setLoadingMore(bool isLoading) {
    _isLoadingMore = isLoading;
  }

  void setHasMore(bool hasMore) {
    _hasMore = hasMore;
  }

  bool get shouldLoadMore {
    if (!hasClients || _isLoadingMore || !_hasMore) return false;

    final maxScroll = position.maxScrollExtent;
    final currentScroll = offset;
    return currentScroll >= (maxScroll * _paginationThreshold);
  }

  Future<void> animateToTop({
    Duration duration = const Duration(milliseconds: 800),
    Curve curve = Curves.easeOutCubic,
  }) {
    return animateTo(0.0, duration: duration, curve: curve);
  }

  Future<void> animateToBottom({
    Duration duration = const Duration(milliseconds: 800),
    Curve curve = Curves.easeOutCubic,
  }) {
    if (!hasClients) return Future.value();

    return animateTo(
      position.maxScrollExtent,
      duration: duration,
      curve: curve,
    );
  }

  void addPaginationListener() {
    addListener(() {
      if (shouldLoadMore) {
        _isLoadingMore = true;
        _onLoadMore?.call();
      }
    });
  }

  double get scrollProgress {
    if (!hasClients) return 0.0;

    final maxScroll = position.maxScrollExtent;
    if (maxScroll == 0) return 0.0;

    return (offset / maxScroll).clamp(0.0, 1.0);
  }

  bool get isAtTop => hasClients && offset <= position.minScrollExtent;

  bool get isAtBottom => hasClients && offset >= position.maxScrollExtent;

  Map<String, dynamic> get debugInfo => {
    'isLoadingMore': _isLoadingMore,
    'hasMore': _hasMore,
    'shouldLoadMore': shouldLoadMore,
    'scrollProgress': scrollProgress,
    'isAtTop': isAtTop,
    'isAtBottom': isAtBottom,
    'currentOffset': hasClients ? offset : null,
    'maxScrollExtent': hasClients ? position.maxScrollExtent : null,
  };

  @override
  void debugFillDescription(List<String> description) {
    super.debugFillDescription(description);
    if (kDebugMode) {
      description.add('paginationThreshold: $_paginationThreshold');
      description.add('isLoadingMore: $_isLoadingMore');
      description.add('hasMore: $_hasMore');
    }
  }
}
