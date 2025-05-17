# Weather Aplication

## Project Description
A simple weather query application created using the OpenWeather API. The application allows users to search for weather information.

## Screenshots
### Home Screen
![Home Screen](/weather_app/screenshots/weatherhomepage.png)

### Loading Screen
![Loading Screen](/weather_app/screenshots/weatherappresultwait.png)

### Result Screen
![Result Screen](/weather_app/screenshots/weatherappresult.png)

## Resources and Websites Used

- Lottie Animations: [Lottie Files](https://lottiefiles.com/)
  - To add the Lottie library to Flutter:
    Open the terminal and run:
    ```bash
    flutter pub add lottie
    ```

- API Site: [OpenWeatherMap](https://openweathermap.org/)

# TIC TAC TOE GAME

## Project Description
A simple tic tac toe game

## Screenshots
#### Screens
<table align="center">
  <tr>
    <td align="center" style="width: 25%; padding: 10px;">
      <img src="/tic-tac-toe_app/appimages/tictahomepage.png" alt="Home Screen" style="width: 100%; height: auto; max-width: 300px;">
      <br><strong>Home Screen</strong>
    </td>
    <td align="center" style="width: 25%; padding: 10px;">
      <img src="/tic-tac-toe_app/appimages/tictacgame.png" alt="Choose Screen" style="width: 100%; height: auto; max-width: 300px;">
      <br><strong>Game Screen</strong>
    </td>
    <td align="center" style="width: 25%; padding: 10px;">
      <img src="/tic-tac-toe_app/appimages/tictacwonscreen.png" alt="Questions Screen" style="width: 100%; height: auto; max-width: 200;">
      <br><strong>Result Screen</strong>
    </td>

  </tr>
</table>


# Araç Fiyat Tahmin Uygulaması

## Proje Açıklaması
Farklı araç modellerinin çeşitli özelliklerine dayanarak fiyatlarını tahmin eden basit bir araç fiyat tahmin uygulaması.

## Ekran Görüntüleri
#### Ekranlar
<table align="center">
  <tr>
    <td align="center" style="width: 25%; padding: 10px;">
      <img src="/car-price-predict/app_car_price_predict/assets/homepage.png" alt="Ana Ekran" style="width: 100%; height: auto; max-width: 300px;">
      <br><strong>Ana Ekran</strong>
    </td>
    <td align="center" style="width: 25%; padding: 10px;">
      <img src="/car-price-predict/app_car_price_predict/assets/form.png" alt="Form Ekranı" style="width: 100%; height: auto; max-width: 300px;">
      <br><strong>Form Ekranı</strong>
    </td>
    <td align="center" style="width: 25%; padding: 10px;">
      <img src="/car-price-predict/app_car_price_predict/assets/result.png" alt="Sonuç Ekranı" style="width: 100%; height: auto; max-width: 300px;">
      <br><strong>Sonuç Ekranı</strong>
    </td>
  </tr>
</table>

## Kaynaklar

- Lottie Animasyonları: [Lottie Files](https://lottiefiles.com/)
  - Lottie kütüphanesini Flutter'a eklemek için:
    Terminali açın ve şu komutu çalıştırın:
    ```bash
    flutter pub add lottie
    ```

## Özellikler

- Detaylı veri seti analizi
- Eksik veri kontrolü
- Vites türlerine göre dağılım analizi
- Araçların yaş dağılımı (2024 yılına göre)
- İlan tarihlerine göre dağılım analizi
- Fiyat ile kilometre arasındaki ilişkinin incelenmesi
- Şanzıman türleri için sayısal kodlama: Otomatik (1), Manuel (2), Yarı Otomatik (3), Diğer (4)
- Farklı makine öğrenimi algoritmaları kullanılarak model eğitimi:
  - Doğrusal Regresyon
  - Karar Ağacı Regresyonu
  - Rastgele Orman Regresyonu
  - K-En Yakın Komşu (KNN) Regresyonu
  - XGBoost Regresyonu

## Flask API

Flask api ile kullanımı gerçekleştirildi model eğitim dosyasına ulaşmak isterseniz [repo linki](https://github.com/lvntaslann/car_price_predict_model).


# Quiz App

## Project Description
A simple quiz application about the four major football teams in the Turkish league.

## Screenshots
#### Screens
<table align="center">
  <tr>
    <td align="center" style="width: 25%; padding: 10px;">
      <img src="/quiz-app/quizappimages/start.png" alt="Home Screen" style="width: 100%; height: auto; max-width: 300px;">
      <br><strong>Home Screen</strong>
    </td>
    <td align="center" style="width: 25%; padding: 10px;">
      <img src="/quiz-app/quizappimages/choose.png" alt="Choose Screen" style="width: 100%; height: auto; max-width: 300px;">
      <br><strong>Choose Screen</strong>
    </td>
    <td align="center" style="width: 25%; padding: 10px;">
      <img src="/quiz-app/quizappimages/questions.png" alt="Questions Screen" style="width: 100%; height: auto; max-width: 200;">
      <br><strong>Questions Screen</strong>
    </td>
    <td align="center" style="width: 25%; padding: 10px;">
      <img src="/quiz-app/quizappimages/result.png" alt="Result Screen" style="width: 100%; height: auto; max-width: 300px;">
      <br><strong>Result Screen</strong>
    </td>
  </tr>
</table>

## Resources 

- Lottie Animations: [Lottie Files](https://lottiefiles.com/)
  - To add the Lottie library to Flutter:
    Open the terminal and run:
    ```bash
    flutter pub add lottie
    ```


# TO-DO APP

This is a simple TO-DO app created using Flutter. The app allows users to create, update, and delete tasks. The main purpose is to illustrate that the saving process is performed using a local database, Hive.
## Video Demonstration

You can watch the video demonstration by clicking [here](https://drive.google.com/file/d/1R7TNBqMUUFIUEdWc8719flOb4IZ9-H8j/view?usp=sharing).

## Dependencies

Below are the dependencies used in this project:

### Application Dependencies

```yaml
dependencies:
  flutter_slidable: ^3.1.0
  hive: ^2.2.3
  hive_flutter: ^1.1.0



# HTTP Request

BTK Akademi eğitimlerinden Engin DEMİROG tarafından hazırlanan Flutter eğitimindeki, HTTP ile bir JSON dosyasından veri getirme işleminin uygulama örneği. Verdiği bilgilerden dolayı Engin DEMİROG hocama teşekkür ederim.

## Uygulama Videosu

Uygulamanın videosu: [Video Linki](https://drive.google.com/file/d/1IeuScbVkli9-Qw-lUvDPfLj9oGOunpXR/view?usp=sharing)

## Projede kullanılan örnek database json dosyası
Uygulamanın videosu: [db.json](https://drive.google.com/file/d/1UnrFf9Vh_yrH0rTgNYlcDz4JMf-3g6xd/view?usp=sharing)

## Kaynaklar

- HTTP kütüphanesini Flutter'a eklemek için:
  Terminali açın ve şu komutu çalıştırın:
  ```bash
  flutter pub add http



# firebase_flutter

BTK akademi üzerinden Google flutter ile mobil uygulama eğitimindeki flutter üzerinden firebase kullanımının bir örnek uygulaması.



# BTK akademi eğitimlerdeki öğrenci takip sistemi
BTK akademi eğitimlerinden Engin DEMİROG tarafından hazırlanan flutter eğitimindeki yapılan uygulama örneği. Verdiği bilgilerden dolayı Engin DEMİROG hocama teşekkür ederim.
## Uygulama videosu

Uygulamanın videsu: [video linki](https://drive.google.com/file/d/1inzEEUqyU_0jvfX1FD9TyWPffvYml-DE/view?usp=sharing).