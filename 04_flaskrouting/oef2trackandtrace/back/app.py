from flask import Flask
from flask import jsonify
from flask import request
from flask_cors import CORS
import os

app = Flask(__name__)
CORS(app)

dict_postpakketten = {
    "s007": {
        "naam": "laprudence",
        "postcode": 9000,
        "afgifte": "2019-01-01",
        "sorteercentrum": "2019-01-02",
        "onderweg": None,
        "bezorgd": None
    },
    "s008": {
        "naam": "waeyaert",
        "postcode": 8500,
        "afgifte": "2018-11-11",
        "sorteercentrum": "2018-11-15",
        "onderweg": "2018-11-16",
        "bezorgd": "2018-11-17"
    },
    "s009": {
        "naam": "laprudence",
        "postcode": 9000,
        "afgifte": "2019-02-02",
        "sorteercentrum": None,
        "onderweg": None,
        "bezorgd": None
    },
    "s010": {
        "naam": "roobrouck",
        "postcode": 8500,
        "afgifte": "2019-01-05",
        "sorteercentrum": "2019-01-06",
        "onderweg": "2019-01-06",
        "bezorgd": None
    }
}


@app.route('/')
def hello_world():
    return 'gebruik de api om de data op te vragen'


@app.route('/api/v1/trace', methods=['GET'])
def track_alles():
    return jsonify(dict_postpakketten)


@app.route('/api/v1/trace/<nr>', methods=['GET'])
def track_packet(nr):
    if nr in dict_postpakketten.keys():
        return jsonify(detail=dict_postpakketten[nr], trackcode=nr), 200
    else:
        return jsonify(status="error"), 404


if __name__ == '__main__':
    app.run(debug=True)
