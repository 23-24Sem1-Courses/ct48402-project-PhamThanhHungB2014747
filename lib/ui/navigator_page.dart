import 'package:flutter/material.dart';

import 'detail_route.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({
    super.key,
    required this.navigatorKey,
    required this.title,
  });

  final Widget title;
  final GlobalKey navigatorKey;

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  late final TextEditingController _textEditingController;

  int _currentRoute = 0;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: widget.title,
                centerTitle: true,
              ),
              body: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: ListView(
                  children: List.generate(
                    50,
                    (index) {
                      return Card(
                        child: ListTile(
                          leading: const FlutterLogo(),
                          title: Text('${index + 1} Item'),
                          enabled: true,
                          onTap: () {
                            if (_currentRoute != index) {
                              _textEditingController = TextEditingController();
                            }
                            _currentRoute = index;
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return DetailRoute(
                                    textEditingController:
                                        _textEditingController,
                                    index: index,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
