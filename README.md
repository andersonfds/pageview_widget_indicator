# PageView Widget Indicator

This is a widget that syncronizes with your pageView and display a nice indicator on a widget.

<img src="https://github.com/andersonfds/pageview_widget_indicator/blob/main/assets/pageview_widget_example.gif?raw=true" alt="page view indicator example" width="200" />

<img src="https://github.com/andersonfds/pageview_widget_indicator/blob/main/assets/pageview_dots_example.gif?raw=true" alt="page view dots example" width="200" />

Usage:

[example/pageview_widget_example](https://github.com/andersonfds/pageview_widget_indicator/blob/db5a51c3cb5d4e7f8ca7f5a6d4b8a111d8ff9393/example/pageview_widget_example/pageview_widget_example.dart#L62-L94)

```dart
@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(widget.title),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: PageViewIndicator(
            pageController: controller,
            itemWidth: 50.0,
            itemCount: 10,
            builder: (context, index, isSelected) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Material(
                color: Colors.white.withOpacity(isSelected ? 0.25 : 0.0),
                borderRadius: BorderRadius.circular(12.0),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                    onTap: () {
                    controller.jumpToPage(index);
                    },
                    child: Center(
                    child: Text(
                        '${index + 1}',
                        textAlign: TextAlign.center,
                    ),
                    ),
                ),
                ),
            ),
            ),
        ),
        ),
        body: PageView.builder(
        controller: controller,
        itemCount: 10,
        itemBuilder: (context, index) => Container(
            color: Colors.red[(index + 1) % 10 * 100],
            child: Center(
            child: Text(
                'shade ' + ((index + 1) % 10 * 100).toString(),
                style:
                    CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
            ),
            ),
        ),
        ),
    );
}
```

To see all examples, head to [this link](https://github.com/andersonfds/pageview_widget_indicator/tree/main/example/lib).

**Sidenotes:**

This project is licensed under MIT.
Feel free to open issues or make pull requests.
