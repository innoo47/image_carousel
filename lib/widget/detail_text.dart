import 'package:flutter/material.dart';

class DetailText extends StatefulWidget {
  const DetailText({super.key});

  @override
  State<DetailText> createState() => DetailTextState();
}

class DetailTextState extends State<DetailText> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(5.0),
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(
              child: Row(
                children: [
                  Text(
                    'example user name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
