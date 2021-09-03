import 'dart:math';
import 'package:flutter/material.dart';
import 'package:skeleton/components/card_component.dart';

class SkeletonPage extends StatefulWidget {
  const SkeletonPage({ Key? key }) : super(key: key);

  @override
  _SkeletonPageState createState() => _SkeletonPageState();
}

class _SkeletonPageState extends State<SkeletonPage> with SingleTickerProviderStateMixin {

  var valSwitch = false;

  late AnimationController _animationController;
  late Animation _factorAnimation;
  late double heightSizeContainer;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 3000),
      vsync: this
    );

    _factorAnimation = Tween(
      begin: 0.0,
      end: 1.0
    ).animate(_animationController);

    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          padding: EdgeInsets.all(16),
          child: Column(
            children: [

              // Header
              Container(
                margin: EdgeInsets.only(bottom: 32, top: 16),
                child: Text(
                  "Skeleton Loading with shimmer",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
              ),

              // Lista
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: 
                  List.generate(5, (index) {
                    var random = new Random();
                    var newRandom = random.nextInt(8);

                    return 
                      Container(
                        child: 
                          Stack(
                            children: [
                              CardComponent(),

                              AnimatedBuilder(
                                animation: _animationController, 
                                builder: (BuildContext context, _) {
                                  return Container(
                                    child: 
                                      Positioned(
                                        left: MediaQuery.of(context).size.width * _factorAnimation.value * (newRandom == 0 ? 1 : newRandom),
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.white.withOpacity(0),
                                                Colors.white.withOpacity(0.25),
                                                Colors.white.withOpacity(0.5),
                                                Colors.white.withOpacity(0.8),
                                                Colors.white.withOpacity(0.8),
                                                Colors.white.withOpacity(0.8),
                                                Colors.white.withOpacity(0.5),
                                                Colors.white.withOpacity(0.25),
                                                Colors.white.withOpacity(0),
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight
                                            ),
                                          ),
                                        ),
                                      )
                                  );
                                }
                              )
                            ],
                          )
                      );
                  })
              ),
            ],
          ),
        ),
      );
  }
}