import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(' Dashboard', style: Theme.of(context).textTheme.headline6);
  }
}
