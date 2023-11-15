import 'package:flutter/material.dart';

class ZoneCard extends StatelessWidget {
  final String avatar;
  final String zoneName;
  const ZoneCard({
    super.key,
    this.avatar = '',
    this.zoneName = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: 180,
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
              height: 120,
              width: 170,
              child: Image.network(
                avatar,
                errorBuilder: (context, o, s) => Image.asset(
                  'assets/images/zone_placeholder.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.place,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      zoneName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
