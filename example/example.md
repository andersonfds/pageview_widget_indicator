# Example

```dart
@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('example')),
        body: SingleChildScrollView(
        child: Stack(
            children: [
            SizedBox(
                height: 300,
                child: PageView.builder(
                controller: controller,
                itemBuilder: (context, index) => Container(
                    color: Colors.red[(index + 1) % 10 * 100],
                    child: Image.network(
                    'https://picsum.photos/seed/$index/200',
                    fit: BoxFit.cover,
                    ),
                ),
                ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                child: SizedBox(
                    width: 100,
                    height: 20,
                    child: PageViewIndicator(
                    height: 30,
                    builder: (context, index, isSelected) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                        color: Colors.white.withOpacity(isSelected ? 1.0 : 0.2),
                        shape: BoxShape.circle,
                        ),
                    ),
                    pageController: controller,
                    itemWidth: 15,
                    itemCount: 10,
                    ),
                ),
                ),
            ),
            ],
        ),
        ),
    );
}
```

Result:

<img src="https://github.com/andersonfds/pageview_widget_indicator/blob/main/assets/pageview_dots_example.gif?raw=true" alt="page view dots example" width="200" />

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
            builder: (context, index, isSelected) =>
                _myWidget(index, isSelected),
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

Result:

<img src="https://github.com/andersonfds/pageview_widget_indicator/blob/main/assets/pageview_widget_example.gif?raw=true" alt="page view indicator example" width="200" />

See the complete examples [here](https://github.com/andersonfds/pageview_widget_indicator/tree/main/example/lib).
