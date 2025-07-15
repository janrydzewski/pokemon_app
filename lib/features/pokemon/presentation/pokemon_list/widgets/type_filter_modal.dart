import 'package:flutter/material.dart';
import 'package:pokemon_app/core/utils/context_extensions.dart';

import '../../../../../theme/theme.dart';
import '../../../data/pokemon_type_models.dart';

/// Modal dialog for selecting Pokemon type filter
/// Game Boy/Pokédex inspired design with monospace fonts and green glow
class TypeFilterModal extends StatefulWidget {
  final PokemonTypeBasic? selectedType;
  final Function(PokemonTypeBasic?) onTypeSelected;

  const TypeFilterModal({
    super.key,
    this.selectedType,
    required this.onTypeSelected,
  });

  @override
  State<TypeFilterModal> createState() => _TypeFilterModalState();
}

class _TypeFilterModalState extends State<TypeFilterModal> {
  PokemonTypeBasic? _selectedType;

  @override
  void initState() {
    super.initState();
    _selectedType = widget.selectedType;
  }

  void _onTypeSelected(PokemonTypeBasic? type) {
    setState(() {
      _selectedType = type;
    });
  }

  void _onConfirm() {
    widget.onTypeSelected(_selectedType);
    Navigator.of(context).pop();
  }

  void _onClear() {
    setState(() {
      _selectedType = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: AppColors.pokedexSilver,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.8),
              blurRadius: 20,
              offset: const Offset(5, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header
            _FilterHeader(),

            // Screen area
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.highContrastDark,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.brightGreen, width: 3),
                ),
                child: Column(
                  children: [
                    // Screen header
                    _ScreenHeader(selectedType: _selectedType),

                    // Types grid
                    Expanded(
                      child: _TypesGrid(
                        selectedType: _selectedType,
                        onTypeSelected: _onTypeSelected,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Control buttons
            _ControlButtons(
              onConfirm: _onConfirm,
              onClear: _onClear,
              onCancel: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}

/// Header with title and status indicator
class _FilterHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.pokedexSilver,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          // Power indicator
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: AppColors.brightGreen,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: AppColors.brightGreen, blurRadius: 8),
              ],
            ),
          ),
          const SizedBox(width: 12),

          // Title
          Text(
            'TYPE FILTER',
            style: context.titleLarge.copyWith(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),

          const Spacer(),

          // Close button indicator
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: AppColors.brightRed,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}

/// Screen header showing selected type
class _ScreenHeader extends StatelessWidget {
  final PokemonTypeBasic? selectedType;

  const _ScreenHeader({required this.selectedType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.contrastCardBackground,
        border: Border(
          bottom: BorderSide(color: AppColors.brightGreen, width: 2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SELECTED TYPE:',
            style: context.labelSmall.copyWith(
              color: AppColors.brightGreen,
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            selectedType != null
                ? PokemonTypes.getTypeDisplayName(selectedType!.name)
                : 'NONE',
            style: context.bodyMedium.copyWith(
              color: selectedType != null
                  ? AppColors.brightGreen
                  : AppColors.brightGreen.withValues(alpha: 0.5),
              fontSize: 14,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

/// Grid of type selection buttons
class _TypesGrid extends StatelessWidget {
  final PokemonTypeBasic? selectedType;
  final Function(PokemonTypeBasic?) onTypeSelected;

  const _TypesGrid({required this.selectedType, required this.onTypeSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2.5,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
        ),
        itemCount: PokemonTypes.predefinedTypes.length,
        itemBuilder: (context, index) {
          final type = PokemonTypes.predefinedTypes[index];
          final isSelected = selectedType?.name == type.name;

          return _TypeButton(
            type: type,
            isSelected: isSelected,
            onTap: () => onTypeSelected(isSelected ? null : type),
          );
        },
      ),
    );
  }
}

/// Individual type button
class _TypeButton extends StatefulWidget {
  final PokemonTypeBasic type;
  final bool isSelected;
  final VoidCallback onTap;

  const _TypeButton({
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_TypeButton> createState() => _TypeButtonState();
}

class _TypeButtonState extends State<_TypeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _animationController.reverse();
    widget.onTap();
  }

  void _onTapCancel() {
    _animationController.reverse();
  }

  Color get _getTypeColor {
    switch (widget.type.name.toLowerCase()) {
      case 'fire':
        return const Color(0xFFFF6B35);
      case 'water':
        return const Color(0xFF4FC3F7);
      case 'grass':
        return const Color(0xFF66BB6A);
      case 'electric':
        return const Color(0xFFFFEB3B);
      case 'psychic':
        return const Color(0xFFE91E63);
      case 'ice':
        return const Color(0xFF81D4FA);
      case 'dragon':
        return const Color(0xFF7B1FA2);
      case 'dark':
        return const Color(0xFF424242);
      case 'fairy':
        return const Color(0xFFF8BBD9);
      case 'fighting':
        return const Color(0xFFD32F2F);
      case 'poison':
        return const Color(0xFF9C27B0);
      case 'ground':
        return const Color(0xFFBCAAA4);
      case 'flying':
        return const Color(0xFF90CAF9);
      case 'bug':
        return const Color(0xFF8BC34A);
      case 'rock':
        return const Color(0xFF8D6E63);
      case 'ghost':
        return const Color(0xFF673AB7);
      case 'steel':
        return const Color(0xFF607D8B);
      default:
        return AppColors.brightGreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            onTapDown: _onTapDown,
            onTapUp: _onTapUp,
            onTapCancel: _onTapCancel,
            child: Container(
              decoration: BoxDecoration(
                color: widget.isSelected
                    ? _getTypeColor
                    : AppColors.contrastCardBackground,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: widget.isSelected ? Colors.white : _getTypeColor,
                  width: widget.isSelected ? 3 : 2,
                ),
                boxShadow: widget.isSelected
                    ? [
                        BoxShadow(
                          color: _getTypeColor.withValues(alpha: 0.5),
                          blurRadius: 8,
                          offset: const Offset(0, 0),
                        ),
                      ]
                    : null,
              ),
              child: Center(
                child: Text(
                  PokemonTypes.getTypeDisplayName(widget.type.name),
                  style: context.bodySmall.copyWith(
                    color: widget.isSelected ? Colors.black : _getTypeColor,
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Control buttons at the bottom
class _ControlButtons extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onClear;
  final VoidCallback onCancel;

  const _ControlButtons({
    required this.onConfirm,
    required this.onClear,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // Clear button
          Expanded(
            child: _ControlButton(
              label: 'CLEAR',
              color: AppColors.brightRed,
              onTap: onClear,
            ),
          ),

          const SizedBox(width: 8),

          // Cancel button
          Expanded(
            child: _ControlButton(
              label: 'CANCEL',
              color: Colors.blueGrey,
              onTap: onCancel,
            ),
          ),

          const SizedBox(width: 8),

          // Confirm button
          Expanded(
            child: _ControlButton(
              label: 'CONFIRM',
              color: Colors.green,
              onTap: onConfirm,
            ),
          ),
        ],
      ),
    );
  }
}

/// Individual control button
class _ControlButton extends StatefulWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ControlButton({
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  State<_ControlButton> createState() => _ControlButtonState();
}

class _ControlButtonState extends State<_ControlButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            onTapDown: (_) => _animationController.forward(),
            onTapUp: (_) {
              _animationController.reverse();
              widget.onTap();
            },
            onTapCancel: () => _animationController.reverse(),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: widget.color.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: widget.color, width: 2),
              ),
              child: Center(
                child: Text(
                  widget.label,
                  style: context.labelLarge.copyWith(
                    color: widget.color,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
