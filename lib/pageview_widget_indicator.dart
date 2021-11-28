library pageview_widget_indicator;

import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

/// The alignment of the PageView items
///
/// When scrolling the widget it will stick to the chosen position
enum PageViewAlignment {
  start,
  center,
  end,
}

class PageViewIndicator extends StatefulWidget {
  /// The builder function to the elements
  /// [context] is the context of the widget
  /// [index] is the index of the current element
  /// [isSelected] is true if the current element is selected
  final Widget Function(
    BuildContext context,
    int index,
    bool isSelected,
  ) builder;

  /// The page controller
  final PageController pageController;

  /// The Alignment to the scroll
  final PageViewAlignment alignment;

  /// The width of the item
  final double itemWidth;

  /// The height of the item
  final double height;

  /// The itemCount for the builder property
  final int itemCount;

  const PageViewIndicator({
    Key key,
    @required this.builder,
    @required this.pageController,
    @required this.itemWidth,
    @required this.itemCount,
    this.height = kToolbarHeight,
    this.alignment = PageViewAlignment.center,
  }) : super(key: key);

  @override
  _PageViewIndicatorState createState() => _PageViewIndicatorState();
}

class _PageViewIndicatorState extends State<PageViewIndicator> {
  final ItemScrollController _scrollController = ItemScrollController();
  int _page = 0;

  Future<void> setPage(int value) async {
    if (_page != value) {
      await _scrollController.scrollTo(
        index: value,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        alignment: alignment,
      );
      _page = value;
    }
  }

  double get alignment {
    switch (widget.alignment) {
      case PageViewAlignment.start:
        return 0.0;
      case PageViewAlignment.end:
        return 1.0;
      default:
        // Calculating the percentage we should use considering the width of the widget
        final screenWidth = MediaQuery.of(context).size.width;
        final startOffset = (screenWidth - widget.itemWidth) / 2;
        final inPercentage = startOffset * 100 / screenWidth / 100;
        return inPercentage;
    }
  }

  _onPageControllerChanged() async {
    final newPage = widget.pageController.page?.round();
    if (newPage != null && newPage != _page) {
      await setPage(newPage);
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.pageController.removeListener(_onPageControllerChanged);
    widget.pageController.addListener(_onPageControllerChanged);
  }

  @override
  void dispose() {
    super.dispose();
    widget.pageController.removeListener(_onPageControllerChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.height,
      child: ScrollablePositionedList.builder(
        physics: ClampingScrollPhysics(),
        itemScrollController: _scrollController,
        itemCount: widget.itemCount,
        initialScrollIndex: widget.pageController.initialPage,
        initialAlignment: alignment,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => SizedBox(
          width: widget.itemWidth,
          child: widget.builder(
            context,
            index,
            index == _page,
          ),
        ),
      ),
    );
  }
}
