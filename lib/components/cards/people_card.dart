import 'package:flutter/material.dart';

class PeopleCard extends StatelessWidget {
  final String avatar;
  final String peopleName;
  final String position;
  const PeopleCard({
    super.key,
    this.avatar = '',
    this.peopleName = '',
    this.position = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: 160,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black38, width: 0.5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 80,
              width: 150,
              child: Image.network(
                avatar,
                fit: BoxFit.contain,
                errorBuilder: (c, o, s) => Image.asset(
                  'assets/images/person_placeholder_1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 140,
                    child: Text(
                      peopleName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: 140,
                    child: Text(
                      position,
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
