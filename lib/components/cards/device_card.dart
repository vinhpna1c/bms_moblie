import 'package:flutter/material.dart';

class DeviceCard extends StatelessWidget {
  final String cameraName;
  final String zone;
  const DeviceCard({
    super.key,
    this.cameraName = '',
    this.zone = '',
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
              child: Image.asset(
                'assets/images/cctv_background.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.camera_indoor,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      cameraName,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.place,
                  color: Colors.red,
                ),
                SizedBox(width: 100, child: Text(zone)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
