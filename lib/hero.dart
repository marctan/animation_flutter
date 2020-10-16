import 'package:flutter/material.dart';

class HeroTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Container(
        height: 50,
        width: 50,
        child: Hero(
          tag: "hero",
          child: FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return Scaffold(
                  appBar: AppBar(title: Text('test2')),
                  body: Center(
                    child: Hero(
                      tag: "hero",
                      child: Icon(Icons.add),
                    ),
                  ),
                );
              }));
            },
            child: Icon(
              Icons.add,
            ),
          ),
        ),
      ),
    );
  }
}
