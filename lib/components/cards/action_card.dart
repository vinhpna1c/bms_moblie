import 'package:bms_moblie/controllers/api/device_ctrl.dart';
import 'package:bms_moblie/controllers/api/face_ctrl.dart';
import 'package:bms_moblie/controllers/api/people_ctrl.dart';
import 'package:bms_moblie/models/device/camera.dart';
import 'package:bms_moblie/models/person/person.dart';
import 'package:bms_moblie/r.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionCard extends StatefulWidget {
  final String uri;
  final String time;
  final int? faceId;
  final String actions;
  final int? cameraId;
  final String image;
  const ActionCard({
    super.key,
    this.uri = '',
    this.time = '',
    this.faceId,
    this.actions = '',
    this.cameraId,
    this.image = '',
  });

  @override
  State<ActionCard> createState() => _ActionCardState();
}

class _ActionCardState extends State<ActionCard> {
  Rx<Person?> person = Rx(null);
  Rx<Camera?> camera = Rx(null);

  @override
  void initState() {
    if (widget.cameraId != null) {
      DeviceController.getDeviceDetail(widget.cameraId.toString())
          .then((value) => camera.value = value);
    }
    if (widget.faceId != null) {
      FaceController.getFaceByID(widget.cameraId.toString()).then((face) {
        if (face?.personId != null) {
          PeopleController.getPeopleByID(face!.personId.toString())
              .then((p) => person.value = p);
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: 12.0, left: 12, top: 16, bottom: 16),
      child: Container(
        height: 200,
        width: 180,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black38, width: 0.5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 100,
              width: 170,
              child: Image.network(
                widget.image,
                errorBuilder: (context, o, s) => Image.asset(
                  AssetImages.personPlaceholder2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 2.0),
                        child: Icon(Icons.access_time, size: 12),
                      ),
                      Text(
                        'Time:',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      widget.time,
                      style: const TextStyle(
                          fontSize: 11, fontStyle: FontStyle.italic),
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
                    Padding(
                      padding: const EdgeInsets.only(right: 2.0),
                      child: const Icon(
                        Icons.person,
                        size: 14,
                        color: Colors.blue,
                      ),
                    ),
                    Obx(
                      () => Text(
                        person.value?.name ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const Text(
                  "63%",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 2.0),
                  child: const Icon(
                    Icons.directions_walk,
                    size: 14,
                    color: Colors.yellow,
                  ),
                ),
                const SizedBox(
                    child: Text(
                  "Actions: ",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12),
                )),
                Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      widget.actions,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ))
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 2.0),
                  child: Icon(
                    Icons.camera,
                    size: 14,
                  ),
                ),
                Obx(
                  () => SizedBox(
                      child: Text(
                    camera.value?.name ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12),
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
