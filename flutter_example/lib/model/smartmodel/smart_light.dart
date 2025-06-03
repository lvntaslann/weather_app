import 'smart_device.dart';

class SmartLight extends SmartDevice {
  int brightness;
  SmartLight({
    required super.id,
    required super.name,
    this.brightness = 50,
    super.isOn = false,
  });


  void setBrightness(int newBrightness){
    brightness = newBrightness.clamp(0, 100);
  }
}
