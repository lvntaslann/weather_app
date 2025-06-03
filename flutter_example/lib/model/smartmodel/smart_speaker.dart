import 'package:flutter_example/model/smartmodel/smart_device.dart';

class SmartSpeaker extends SmartDevice{
  int voiceValue;
  SmartSpeaker({
   required super.id,
   required super.name,
   required super.isOn,
   this.voiceValue =50,
  });

  void setVoiceValue(int newVoiceValue){
    voiceValue = newVoiceValue.clamp(0, 100);
  }
}