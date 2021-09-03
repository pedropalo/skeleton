import 'package:flutter/material.dart';

class CardComponent extends StatefulWidget {
  const CardComponent({ Key? key }) : super(key: key);

  @override
  _CardComponentState createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  @override
  Widget build(BuildContext context) {
    return 
      Container(
        margin: EdgeInsets.only(bottom: 16),
        width: MediaQuery.of(context).size.width,
        child: 
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 16),
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(64)
                )
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(64)
                    )
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 8),
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(64)
                    )
                  ),
                ],
              )
            ],
          )
        
      );
  }
}