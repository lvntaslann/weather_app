# Araç Fiyat Tahmin Uygulaması

Bu proje, araç fiyatlarını tahmin etmek amacıyla çeşitli makine öğrenimi modelleri kullanılarak geliştirilmiş bir uygulamadır. Proje kapsamında kullanılan veri seti, GitHub deposunda mevcuttur.

## İçerik

- [Veri Seti İncelemesi](#veri-seti-incelemesi)
- [Veri Ön İşleme](#veri-ön-işleme)
- [Model Eğitimi ve Değerlendirme](#model-eğitimi-ve-değerlendirme)
- [Kullanılan Modeller](#kullanılan-modeller)
- [Flask API](#flask-api)
- [Sonuçlar](#sonuçlar)

## Veri Seti İncelemesi

- Veri seti detaylı bir şekilde incelendi.
- Eksik veri kontrolü yapıldı.
- Veri setindeki araçların vites türlerine göre dağılımı belirlendi.
- Araçların yaş dağılımı, günümüz yılı olan 2024'e göre belirlendi.
- Araçların ilan tarihlerine göre dağılımı belirlendi.
- Fiyat ile kilometre arasındaki ilişki incelendi.

## Veri Ön İşleme

- Şanzıman türleri için `Automatic`, `Manual`, `Semi Auto` ve `Other` kategorileri sırasıyla 1, 2, 3 ve 4 gibi sayısal değerlere dönüştürüldü.

## Model Eğitimi ve Değerlendirme

Aşağıdaki modeller kullanılarak eğitim yapıldı ve performansları değerlendirildi:

- Linear Regression (Doğrusal Regresyon)
- Decision Tree Regression (Karar Ağacı Regresyonu)
- Random Forest Regression (Rastgele Orman Regresyonu)
- K-Nearest Neighbors (KNN) Regression
- XGBoost Regression

## Kullanılan Modeller

### Linear Regression
Doğrusal regresyon modeli, bağımsız değişkenler ile bağımlı değişken (araç fiyatı) arasındaki doğrusal ilişkiyi modellendi.

### Decision Tree Regression
Karar ağacı modeli, veri setindeki örnekleri belirli kurallara göre dallara ayırarak tahmin yaptı.

### Random Forest Regression
Rastgele orman modeli, birden fazla karar ağacının birlikte kullanılmasıyla daha sağlam tahminler yapıldı.

### K-Nearest Neighbors (KNN) Regression
KNN modeli, en yakın komşulara göre tahmin yaparak araç fiyatlarını belirledi.

### XGBoost Regression
XGBoost modeli, gradient boosting yöntemini kullanarak yüksek performanslı tahminler yapıldı.

## Flask API

Bu projede, araç fiyat tahminlerini dış dünyaya sunmak için bir Flask API kullanıldı. Flask, Python ile yazılmış hafif bir web uygulama çatısıdır ve bu proje için tahmin modellerinin entegre edildiği bir API sağladı.

### Flask API Kullanımı

Flask API ile flutter üzerinde oluşturulan bir app ile local host üzerinden test edildi.
