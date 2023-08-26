from flask import Flask, request, jsonify
from flask.logging import create_logger
import logging
import traceback

import pandas as pd
from sklearn.externals import joblib
from sklearn.preprocessing import StandardScaler

app = Flask(__name__)
LOG = create_logger(app)
LOG.setLevel(logging.INFO)


def scale(payload):
    """Scales Payload"""
    LOG.info("Scaling Payload: %s payload")
    scaler = StandardScaler().fit(payload)
    scaled_adhoc_predict = scaler.transform(payload)
    return scaled_adhoc_predict


@app.route("/")
def home():
    html = (
        "Server Up!"
    )
    return html.format(format)


# TO DO:  Log out the prediction value
@app.route("/predict", methods=["POST"])
def predict():
    try:
        clf = joblib.load("boston_housing_prediction.joblib")
    except Exception as e:
        LOG.error("Error loading model: %s", str(e))
        LOG.error("Exception traceback: %s", traceback.format_exc())
        return "Model not loaded"
    json_payload = request.json
    LOG.info("JSON payload: %s json_payload")
    inference_payload = pd.DataFrame(json_payload)
    LOG.info("inference payload DataFrame: %s inference_payload")
    scaled_payload = scale(inference_payload)
    prediction = clf.predict(scaled_payload)
    prediction_list = list(prediction)
    return jsonify({"prediction": prediction_list})


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, debug=True)
