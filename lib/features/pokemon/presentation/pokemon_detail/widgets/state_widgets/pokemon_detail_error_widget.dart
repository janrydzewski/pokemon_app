import 'package:flutter/material.dart';
import 'package:pokemon_app/core/utils/context_extensions.dart';

import '../../../../../../theme/theme.dart';

/// Error state widget for Pokemon detail screen
class PokemonDetailErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const PokemonDetailErrorWidget({
    super.key,
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.contrastCardBackground,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.brightRed, width: 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Error icon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.brightRed.withOpacity(0.2),
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.brightRed, width: 2),
              ),
              child: Icon(
                Icons.error_outline,
                size: 40,
                color: AppColors.brightRed,
              ),
            ),

            const SizedBox(height: 16),

            // Error title
            Text(
              'SCAN ERROR',
              style: context.titleLarge.copyWith(
                color: AppColors.brightRed,
                fontSize: 16,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 8),

            // Error message
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.highContrastDark,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: AppColors.brightRed, width: 1),
              ),
              child: Text(
                message,
                style: context.bodySmall.copyWith(
                  color: AppColors.brightRed.withOpacity(0.8),
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            if (onRetry != null) ...[
              const SizedBox(height: 16),

              // Retry button
              GestureDetector(
                onTap: onRetry,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.brightRed.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.brightRed, width: 2),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.refresh, size: 16, color: AppColors.brightRed),
                      const SizedBox(width: 4),
                      Text(
                        'RETRY SCAN',
                        style: context.labelLarge.copyWith(
                          color: AppColors.brightRed,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
