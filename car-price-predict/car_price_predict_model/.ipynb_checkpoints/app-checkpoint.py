from flask import Flask, request, jsonify
import joblib
import numpy as np
from sklearn.preprocessing import MinMaxScaler

app = Flask(__name__)
model = joblib.load('xgboost_model.pkl')
scaler = joblib.load('scaler.pkl')

#burada bir index.html dosyası vererek web sitesinde de kullanım yapılabilir ben flaskı flutter üzerinden kullandım
@app.route('/')
def index():
    return "Araç fiyat tahmini"

@app.route('/', methods=['POST'])
def tahmin():
    yil = float(request.form["Yıl"])
    sanziman = float(request.form["Şanzıman"])
    kilometre = float(request.form["Kilometre"])
    vergi = float(request.form["Vergi"])
    mpg = float(request.form["Mil Başına Galon"])
    motor_hacmi = float(request.form["Motor Hacmi"])
    veri = np.array([[yil, sanziman, kilometre, vergi, mpg, motor_hacmi]])
    veri_normalized = scaler.transform(veri)
    tahmin = model.predict(veri_normalized)
    return jsonify(tahmin=float(tahmin[0]))

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=True)
