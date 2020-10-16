import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class ContainerTransform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (_, index) {
          //return MailPreviewCard();
          return OpenContainer(
            tappable: false,
            closedBuilder: (_, openContainer) {
              return ListTile(
                onTap: openContainer,
                title: Text('test $index'),
              );
            },
            openBuilder: (_, __) {
              return DetailPage(index);
            },
          );
        },
        separatorBuilder: (_, __) => Divider(
          thickness: 0.7,
          height: 1,
        ),
        itemCount: 5,
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final int index;

  DetailPage(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          child: Text('index $index is clicked'),
        ),
      ),
    );
  }
}
