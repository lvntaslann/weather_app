import 'smart_device.dart';
class SmartThermostat extends SmartDevice{
  double temperature;

  SmartThermostat({
    required super.id,
    required super.name,
    this.temperature = 22.0,
    super.isOn = false,
  });

  void setTemperature(double newTemp){
    temperature = newTemp.clamp(10.0,30.0);
  }
}