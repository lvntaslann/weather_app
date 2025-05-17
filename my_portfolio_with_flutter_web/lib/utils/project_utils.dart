class ProjectUtils {
  final String image;
  final String title;
  final String subTitle;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

List<ProjectUtils> myProjectUtils = [
  ProjectUtils(
      image: "ehliyetsim.jpeg",
      title: "Driving License Simulation",
      subTitle:
          "A driving simulation mimics real-world conditions, enabling driver candidates to practice traffic rules, handle real-life problems, and develop vehicle control skills, while reducing costs and issues."),
  ProjectUtils(
      image: "food.png",
      title: "Flavor Harmony",
      subTitle:
          "Flavor Harmony is an app that uses object recognition to help users add foods to meals, track exercise and water intake, and aims to simplify daily life by saving time."),
];

List<ProjectUtils> myHobyProjectUtils = [
  ProjectUtils(
      image: "carpredict.png",
      title: "Car Price Predict",
      subTitle:
          "A simple car price prediction application that estimates the prices of different car models based on various features."),
  ProjectUtils(
      image: "quizapp.png",
      title: "Quiz App",
      subTitle:
          "A simple quiz application about the four major football teams in the Turkish league."),
  ProjectUtils(
      image: "weatherapp.jpeg",
      title: "Weather App",
      subTitle:
          "A simple weather query application created using the OpenWeather API. The application allows users to search for weather information."),
  ProjectUtils(
      image: "tictacgame.png",
      title: "Tic Tac Toe Game",
      subTitle: "A simple tic tac toe game"),
];
