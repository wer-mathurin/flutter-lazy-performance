import 'package:flutter/material.dart';

import 'iv_builder_page.dart';
import 'list_view_builder_page.dart';
import 'single_child_scroll_view_page.dart';
import 'procedural_generation_page.dart';

final List<Type> pages = <Type>[
  IVBuilderPage,
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Builder Performance Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: <String, Widget Function(BuildContext)>{
        '/': (BuildContext context) => MyHomePage(),
        IVBuilderPage.routeName: (BuildContext context) => IVBuilderPage(),
        SingleChildScrollViewPage.routeName: (BuildContext context) => SingleChildScrollViewPage(),
        ListViewBuilderPage.routeName: (BuildContext context) => ListViewBuilderPage(),
        ProceduralGenerationPage.routeName: (BuildContext context) => ProceduralGenerationPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generative Performance Demos'),
      ),
      body: ListView(
        children: <Widget>[
          MyListItem(
            route: '/list-view',
            title: 'Naive List Example',
            subtitle: 'Build everything upfront.',
          ),
          MyListItem(
            route: '/list-view-builder',
            title: 'ListView.builder Example',
            subtitle: 'Build only the visible list items.',
          ),
          MyListItem(
            route: '/iv-builder',
            title: 'InteractiveViewer Builder Example',
            subtitle: 'Build only the visible parts.',
          ),
          MyListItem(
            route: '/procedural-generation',
            title: 'InteractiveViewer Procedural Generation Example',
            subtitle: 'Generate the content to build.',
          ),
        ],
      ),
    );
  }
}

class MyListItem extends StatelessWidget {
  MyListItem({
    Key key,
    @required this.route,
    @required this.subtitle,
    @required this.title,
  }) : super(key: key);

  final String route;
  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Card(
        margin: EdgeInsets.all(12.0),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
          ),
        ),
      ),
    );
  }
}
