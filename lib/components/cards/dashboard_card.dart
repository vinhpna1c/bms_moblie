import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String uri;
  final String time;
  final String personName;
  final String cameraName;
  const DashboardCard({
    super.key,
    this.uri = '',
    this.time = '',
    this.personName = '',
    this.cameraName = '',
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
              child: Image.asset(
                uri,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 2.0),
                    child: Icon(Icons.access_time, size: 14),
                  ),
                  SizedBox(
                    width: 130,
                    child: Text(
                      time,
                      style:
                          TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 2.0),
                      child: Icon(
                        Icons.person,
                        size: 14,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                        child: Text(
                      personName,
                      style: TextStyle(fontSize: 12),
                    )),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 2.0),
                  child: Icon(
                    Icons.camera,
                    size: 14,
                  ),
                ),
                SizedBox(
                    child: Text(
                  cameraName,
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
