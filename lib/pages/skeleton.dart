import 'package:flutter/material.dart';

class SkeletonPage extends StatefulWidget {
  const SkeletonPage({ Key? key }) : super(key: key);

  @override
  _SkeletonPageState createState() => _SkeletonPageState();
}

class _SkeletonPageState extends State<SkeletonPage> {
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        body: Container(
          child: Text("Skeleton"),
        ),
      );
  }
}