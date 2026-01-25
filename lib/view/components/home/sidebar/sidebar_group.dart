import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/controller/home/home_layout_controller.dart';
import 'package:web_project2/view/components/home/sidebar/sidebar_item.dart';

import '../triangle.dart';

class SidebarGroup extends StatelessWidget {
  final int index;
  final IconData icon;
  final String title;
  final List<SidebarItem> children;

  const SidebarGroup({
    super.key,
    required this.index,
    required this.icon,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLayoutController>(
      builder: (controller) {
       bool isSelected = (controller.currentPrimarySideBar == index && controller.selectedChildIndex != -1);
        bool isExpanded = controller.expandedSidebarIndex == index;
        final isRTL = Directionality.of(context) == TextDirection.rtl;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                controller.toggleExpandedSidebar(index);
              },
              child: Stack(
                children: [
                  Container(
                    color: isSelected ? const Color(0xFF33C8CE) : Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        Icon(icon, color: isSelected ? Colors.white : Colors.grey[400]),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.grey[400],
                              fontWeight: isSelected ? FontWeight.bold : null,
                            ),
                          ),
                        ),
                        Icon(
                          isExpanded ? Icons.expand_less : Icons.expand_more,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),

                  ),

                  // Triangle indicator when selected
                  if (isSelected)
                    Positioned(
                      left: isRTL ? -4 : null,
                      right: isRTL ? null : -4,
                      top: 10,
                      bottom: 10,
                      child: TriangleWidget(isRTL: isRTL),
                    ),


                ],
              ),
            ),
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: Container(
                width: double.infinity, // same width as parent
                color: Colors.blue.withOpacity(0.1), // background spans full width
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children,
                  ),
                ),
              ),
              crossFadeState:
              isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200),
            ),
          ],
        );
      },
    );
  }
}


class SidebarGroupCollapsed extends StatelessWidget {
  final int index;
  final IconData icon;
  final String title;
  final List<SidebarItem> children;

  const SidebarGroupCollapsed({
    super.key,
    required this.index,
    required this.icon,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLayoutController>(
      builder: (controller) {
        OverlayEntry? overlayEntry;
        bool isHoveringDropdown = false;

        bool isSelected =
            controller.currentPrimarySideBar == index &&
                controller.selectedChildIndex != -1;

        void removeOverlay() {
          overlayEntry?.remove();
          overlayEntry = null;
        }

        void showOverlay(RenderBox box) {
          final position = box.localToGlobal(Offset.zero);

          overlayEntry = OverlayEntry(
            builder: (_) => Positioned(
              left: position.dx + 50,
              top: position.dy,
              child: MouseRegion(
                onEnter: (_) => isHoveringDropdown = true,
                onExit: (_) {
                  isHoveringDropdown = false;
                  removeOverlay();
                },
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xFF212D3B),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(color: Colors.black26, blurRadius: 4)
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Parent title
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            title,
                            style:  TextStyle(
                              color: isSelected ? Colors.white  :Colors.grey[400],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // Children
                        ...children.map((child) {
                          return InkWell(
                            onTap: () {
                              if (!controller.isOpen) {
                                controller.toggleSideBar();
                              }
                              child.onTap();
                              removeOverlay();
                            },
                            child: Container(
                              height: 32,
                              padding:
                              const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Icon(child.icon,
                                      color: isSelected ? Colors.white : Colors.grey[400], size: 16),
                                  const SizedBox(width: 8),
                                  Text(
                                    child.title,
                                    style:  TextStyle(color: isSelected ? Colors.white : Colors.grey[400]),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );

          Overlay.of(context).insert(overlayEntry!);
        }

        return Builder(
          builder: (context) {
            return MouseRegion(
              onEnter: (_) {
                if (overlayEntry == null) {
                  final box =
                  context.findRenderObject() as RenderBox;
                  showOverlay(box);
                }
              },
              onExit: (_) {
                Future.delayed(const Duration(milliseconds: 100), () {
                  if (!isHoveringDropdown) removeOverlay();
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Icon(
                  icon,
                  color: isSelected
                      ? const Color(0xFF33C8CE)
                      : Colors.grey[400],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

