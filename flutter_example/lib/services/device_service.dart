import 'package:flutter/material.dart';
import 'package:flutter_example/model/smartmodel/smart_light.dart';
import 'package:flutter_example/model/smartmodel/smart_speaker.dart';
import 'package:flutter_example/model/smartmodel/smart_thermostat.dart';

import '../model/smartmodel/smart_device.dart';

class DeviceService with ChangeNotifier{
  final List<SmartDevice> _devices = [
    SmartLight(id: '1', name: 'Living Room Right'),
    SmartThermostat(id: '2', name: 'Bedrom thermostat')
  ];

  List<SmartDevice> get devices => _devices;
  void toggleDevicePower(String id){
    final device = _devices.firstWhere((d)=>d.id==id);
     device.togglePower();
    notifyListeners();
  }

  void updateLightBrightness(String id, int brightness){
    final device =_devices.firstWhere((d)=>d.id ==id);
    if(device is SmartLight){
      device.setBrightness(brightness);
      notifyListeners();
    }
  }

  void updateTemperatureThermostat(String id,double temperature){
    final device = _devices.firstWhere((d)=>d.id==id);
    if (device is SmartThermostat){
      device.setTemperature(temperature);
      notifyListeners();
    }
  }

  void updateVoiceValue(String id,int voiceValue){
    final device = _devices.firstWhere((d)=>d.id ==id);
    if(device is SmartSpeaker){
      device.setVoiceValue(voiceValue);
      notifyListeners();
    }
  }
      void addDevice(SmartDevice device){
      _devices.add(device);
      notifyListeners();
    }

    void removeDevice(String id){
      _devices.removeWhere((d)=>d.id==id);
      notifyListeners();
    }
}