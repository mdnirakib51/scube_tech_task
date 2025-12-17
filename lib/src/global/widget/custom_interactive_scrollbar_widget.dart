import 'package:flutter/material.dart';
import 'package:scube_technologies_task/src/global/constants/colors_resources.dart';

class CustomScrollbarList extends StatefulWidget {
  final List<Widget> children;
  final EdgeInsets? padding;
  final Color? scrollbarColor;
  final Color? scrollbarBackgroundColor;
  final double scrollbarWidth;
  final double scrollbarThumbWidth;

  const CustomScrollbarList({
    super.key,
    required this.children,
    this.padding,
    this.scrollbarColor,
    this.scrollbarBackgroundColor,
    this.scrollbarWidth = 6,
    this.scrollbarThumbWidth = 6,
  });

  @override
  State<CustomScrollbarList> createState() => _CustomScrollbarListState();
}

class _CustomScrollbarListState extends State<CustomScrollbarList> {
  final ScrollController _scrollController = ScrollController();
  double _scrollbarPosition = 0;
  double _scrollbarHeight = 100;
  bool _isDragging = false;
  bool _isScrollable = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateScrollbarPosition);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateScrollbarHeight();
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateScrollbarPosition);
    _scrollController.dispose();
    super.dispose();
  }

  void _calculateScrollbarHeight() {
    if (!mounted || !_scrollController.hasClients) return;

    final viewportHeight = _scrollController.position.viewportDimension;
    final contentHeight = _scrollController.position.maxScrollExtent + viewportHeight;

    setState(() {
      _isScrollable = contentHeight > viewportHeight;

      if (_isScrollable) {
        _scrollbarHeight = (viewportHeight / contentHeight) * viewportHeight;
        if (_scrollbarHeight < 40) _scrollbarHeight = 40; // Minimum height
      }
    });
  }

  void _updateScrollbarPosition() {
    if (_isDragging || !_scrollController.hasClients) return;

    final maxScrollExtent = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    final viewportHeight = _scrollController.position.viewportDimension;

    if (maxScrollExtent > 0) {
      final scrollPercentage = currentScroll / maxScrollExtent;
      final maxScrollbarPosition = viewportHeight - _scrollbarHeight;

      setState(() {
        _scrollbarPosition = scrollPercentage * maxScrollbarPosition;
      });
    }
  }

  void _onVerticalDragStart(DragStartDetails details) {
    setState(() {
      _isDragging = true;
    });
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    if (!_scrollController.hasClients) return;

    final viewportHeight = _scrollController.position.viewportDimension;
    final maxScrollExtent = _scrollController.position.maxScrollExtent;
    final maxScrollbarPosition = viewportHeight - _scrollbarHeight;

    setState(() {
      _scrollbarPosition += details.delta.dy;
      _scrollbarPosition = _scrollbarPosition.clamp(0.0, maxScrollbarPosition);
    });

    if (maxScrollbarPosition > 0) {
      final scrollPercentage = _scrollbarPosition / maxScrollbarPosition;
      final targetScrollPosition = scrollPercentage * maxScrollExtent;

      _scrollController.jumpTo(targetScrollPosition.clamp(0.0, maxScrollExtent));
    }
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    setState(() {
      _isDragging = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main scrollable content
        Padding(
          padding: EdgeInsets.only(right: _isScrollable ? widget.scrollbarWidth + 4 : 0),
          child: ListView(
            controller: _scrollController,
            padding: widget.padding ?? EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: widget.children,
          ),
        ),

        if (_isScrollable)
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: GestureDetector(
              onVerticalDragStart: _onVerticalDragStart,
              onVerticalDragUpdate: _onVerticalDragUpdate,
              onVerticalDragEnd: _onVerticalDragEnd,
              child: Container(
                width: widget.scrollbarWidth,
                decoration: BoxDecoration(
                  color: widget.scrollbarBackgroundColor ??
                      ColorRes.grey.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(widget.scrollbarWidth / 2),
                ),
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: _isDragging
                          ? Duration.zero
                          : const Duration(milliseconds: 100),
                      curve: Curves.easeOut,
                      top: _scrollbarPosition,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: widget.scrollbarThumbWidth,
                        height: _scrollbarHeight,
                        decoration: BoxDecoration(
                          gradient: widget.scrollbarColor == null
                              ? const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF4E91FD), // #4E91FD
                              Color(0xFF080B7F), // #080B7F
                            ],
                          )
                              : null,
                          color: widget.scrollbarColor,
                          borderRadius: BorderRadius.circular(
                              widget.scrollbarThumbWidth / 2
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF4E91FD).withValues(alpha: 0.3),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}