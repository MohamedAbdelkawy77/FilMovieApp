import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:filmovies/Constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Stack(
        children: [
          // Shadow layer
          Container(
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.black.withOpacity(0.5)
                      : Colors.grey.withOpacity(0.3),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
                if (isDark)
                  BoxShadow(
                    color: colorlike[0].withOpacity(0.1),
                    blurRadius: 40,
                    spreadRadius: -5,
                  ),
              ],
            ),
          ),
          // Glass container
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: isDark
                        ? [
                            Colors.white.withOpacity(0.15),
                            Colors.white.withOpacity(0.05),
                          ]
                        : [
                            Colors.white.withOpacity(0.8),
                            Colors.white.withOpacity(0.4),
                          ],
                  ),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    width: 1.5,
                    color: isDark
                        ? Colors.white.withOpacity(0.2)
                        : Colors.white.withOpacity(0.5),
                  ),
                ),
                child: Stack(
                  children: [
                    // Light reflection on top
                    Positioned(
                      top: 0,
                      left: 40,
                      right: 40,
                      child: Container(
                        height: 25,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white.withOpacity(isDark ? 0.2 : 0.4),
                              Colors.transparent,
                            ],
                          ),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(40),
                          ),
                        ),
                      ),
                    ),
                    // Content
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildItem(Icons.home_outlined, 0, isDark),
                        _buildItem(Icons.tv, 1, isDark),
                        _buildItem(Icons.search, 2, isDark),
                        _buildItem(Icons.favorite, 3, isDark),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Bottom shine
          Positioned(
            bottom: 0,
            left: 30,
            right: 30,
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    (isDark ? Colors.white : colorlike[0]).withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(IconData icon, int index, bool isDark) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? colorlike[0].withOpacity(isDark ? 0.25 : 0.15)
              : Colors.transparent,
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(
                  color: colorlike[0].withOpacity(0.4),
                  width: 1.5,
                )
              : null,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: colorlike[0].withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 0,
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: Icon(
                icon,
                color: isSelected
                    ? colorlike[0]
                    : isDark
                        ? Colors.white.withOpacity(0.6)
                        : Colors.black.withOpacity(0.5),
                size: isSelected ? 28 : 24,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isSelected ? 6 : 4,
              height: isSelected ? 6 : 4,
              decoration: BoxDecoration(
                color: isSelected
                    ? colorlike[0]
                    : isDark
                        ? Colors.white.withOpacity(0.3)
                        : Colors.black.withOpacity(0.2),
                shape: BoxShape.circle,
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: colorlike[0].withOpacity(0.6),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ]
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
