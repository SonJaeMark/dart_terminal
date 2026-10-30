
Future<void> fetchWeatherData() async {
  // Simulates a 2-second network request and returns a string
  String data = await Future.delayed(Duration(seconds: 2), () {
    return "Sunny Weather Data";
  });

  print(data); // Prints "Sunny Weather Data" after 2 seconds
}

void main() async {
  print("Fetching...");
  fetchWeatherData();
  print("Done!");
}
