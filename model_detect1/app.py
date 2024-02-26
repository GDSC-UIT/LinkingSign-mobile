import pickle
from flask import Flask, request, render_template, flash, redirect, url_for
import numpy as np
from markupsafe import Markup
from collections.abc import MutableMapping
from keras.models import load_model
app = Flask(__name__)

model = load_model("action.h5")

@app.route("/")
def load_page(): 
    return render_template('index.html')

@app.route("/predict", methods=['POST'])
def predict():
    files = request.files.getlist('data')

    if not files:  
        flash("No files uploaded!")
        return redirect(url_for('load_page'))

    data = []
    for file in files:
        try:
            data.append(np.load(file))
        except Exception as e:
            flash(f"Error loading file {file.filename}: {e}")
            return redirect(url_for('load_page'))

    prediction = model.predict(data)
    character = prediction[0]

    return render_template('index.html', prediction=character, Markup=Markup)

if __name__ == "__main__":
    app.run(host='0.0.0.0',port=5000)
