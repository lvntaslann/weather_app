import 'package:flutter/material.dart';
import 'package:flutter_example/model/smartmodel/smart_device.dart';
import 'package:flutter_example/model/smartmodel/smart_light.dart';
import 'package:flutter_example/model/smartmodel/smart_speaker.dart';
import 'package:flutter_example/model/smartmodel/smart_thermostat.dart';
import 'package:flutter_example/services/device_service.dart';

class UpdateDeviceDialog extends StatefulWidget {
  final SmartDevice device;
  final DeviceService deviceService;

  const UpdateDeviceDialog({
    Key? key,
    required this.device,
    required this.deviceService,
  }) : super(key: key);

  @override
  State<UpdateDeviceDialog> createState() => _UpdateDeviceDialogState();
}

class _UpdateDeviceDialogState extends State<UpdateDeviceDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.device is SmartLight
          ? (widget.device as SmartLight).brightness.toString()
          : widget.device is SmartThermostat
              ? (widget.device as SmartThermostat).temperature.toString()
              : widget.device is SmartSpeaker
                  ? (widget.device as SmartSpeaker).voiceValue.toString()
                  : '',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final label = widget.device is SmartLight
        ? 'Brightness'
        : widget.device is SmartThermostat
            ? 'Temperature'
            : 'Voice Value';

    return AlertDialog(
      title: Text('Update ${widget.device.name}'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: label),
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: Text("Cancel")),
        ElevatedButton(
          onPressed: () {
            final value = _controller.text;
            if (widget.device is SmartLight) {
              widget.deviceService.updateLightBrightness(
                  widget.device.id, int.parse(value));
            } else if (widget.device is SmartThermostat) {
              widget.deviceService.updateTemperatureThermostat(
                  widget.device.id, double.parse(value));
            } else if (widget.device is SmartSpeaker) {
              widget.deviceService
                  .updateVoiceValue(widget.device.id, int.parse(value));
            }
            Navigator.pop(context);
          },
          child: Text('Update'),
        ),
      ],
    );
  }
}
