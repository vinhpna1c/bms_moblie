import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  final String uri;
  final String time;
  final String personName;
  final String actions;
  final String cameraName;
  const ActionCard({
    super.key,
    this.uri = '',
    this.time = '',
    this.personName = '',
    this.actions = '',
    this.cameraName = '',
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
                  Padding(
                    padding: const EdgeInsets.only(right: 2.0),
                    child: Icon(Icons.access_time, size: 10),
                  ),
                  SizedBox(
                    width: 130,
                    child: Text(
                      time,
                      style: TextStyle(fontSize: 12),
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
                    Icon(Icons.person, size: 12),
                    SizedBox(
                        child: Text(
                      personName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12),
                    )),
                  ],
                ),
                SizedBox(
                    child: Text(
                  "63%",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12),
                )),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  size: 12,
                ),
                SizedBox(
                    child: Text(
                  "Actions: ",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12),
                )),
                Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 20,
                    child: Text(
                      actions,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(4),
                    ))
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.camera,
                  size: 12,
                ),
                SizedBox(
                    child: Text(
                  cameraName,
                  overflow: TextOverflow.ellipsis,
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
