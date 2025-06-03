import 'package:flutter/material.dart';
import 'package:flutter_example/model/smartmodel/smart_speaker.dart';
import 'package:flutter_example/model/smartmodel/smart_thermostat.dart';
import 'package:flutter_example/services/device_service.dart';
import 'package:flutter_example/widget/update_device_dialog.dart';
import 'package:provider/provider.dart';

import '../../model/smartmodel/smart_light.dart';

// ignore: must_be_immutable
class DevicePage extends StatelessWidget {
  DevicePage({Key? key}) : super(key: key);
  TextEditingController temperatureController = TextEditingController();
  TextEditingController brightnessController = TextEditingController();
  TextEditingController voiceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceServices = Provider.of<DeviceService>(context);
    final devices = deviceServices.devices;
    final smartSpeaker = SmartSpeaker(id: '3', name: 'JBL', isOn: false);
    return Scaffold(
      backgroundColor: Colors.purple.shade300,
      body: ListView.builder(
        itemCount: deviceServices.devices.length,
        itemBuilder: (context, index) {
          return Card(
              elevation: 5,
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("${devices[index].name}"),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => UpdateDeviceDialog(
                                  device: devices[index],
                                  deviceService: deviceServices,
                                ),
                              );
                            },
                            icon: Icon(Icons.update_outlined)),
                        IconButton(
                            onPressed: () {
                              deviceServices.removeDevice(devices[index].id);
                            },
                            icon: Icon(Icons.clear))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        devices[index] is SmartLight
                            ? Text(
                                "Brightness: ${(devices[index] as SmartLight).brightness}%")
                            : SizedBox(),
                        devices[index] is SmartThermostat
                            ? Text(
                                "Temperature: ${(devices[index] as SmartThermostat).temperature}°C")
                            : SizedBox(),
                        devices[index] is SmartSpeaker
                            ? Text(
                                "Voice Value: ${(devices[index] as SmartSpeaker).voiceValue}%")
                            : SizedBox(),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        deviceServices.toggleDevicePower(devices[index].id);
                      },
                      icon: Icon(
                        devices[index].isOn ? Icons.power : Icons.power_off,
                        color: devices[index].isOn ? Colors.green : Colors.red,
                      ))
                ],
              ));
        },
      ),
      floatingActionButton: IconButton(
          onPressed: () {
            deviceServices.addDevice(smartSpeaker);
          },
          icon: Icon(Icons.add)),
    );
  }
}
