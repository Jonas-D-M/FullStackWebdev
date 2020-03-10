from flask_cors import CORS
from flask import Flask, request, jsonify, redirect
from repositories.DataRepository import DataRepository

app = Flask(__name__)
CORS(app)


# Custom endpoint
endpoint = '/api/v1'


@app.route('/')
def index():
    pass


@app.route(endpoint + '/klanten', methods=["GET", "POST"])
def klanten():
    if request.method == "GET":
        data = jsonify(DataRepository.read_klanten())
        return data
    elif request.method == "POST":
        gegevens = DataRepository.json_or_formdata(request)
        data = jsonify(DataRepository.create_klant(
            gegevens["FNaam"], gegevens["VNaam"], gegevens["Straat"], gegevens["Nummer"], gegevens["Postcode"], gegevens["Gemeente"]))
        return data


@app.route(endpoint + '/klanten/<id>', methods=["GET", "PUT", "DELETE"])
def klant(id):
    if request.method == "GET":
        data = jsonify(DataRepository.read_klant(id))
        return data
    elif request.method == "PUT":
        gegevens = DataRepository.json_or_formdata(request)
        data = jsonify(DataRepository.update_klant(
            gegevens["FNaam"], gegevens["VNaam"], gegevens["Straat"], gegevens["Nr"], gegevens["Postcode"], gegevens["Gemeente"], id))
        return data
    elif request.method == "DELETE":
        data = jsonify(DataRepository.delete_klant(id))
        return data


if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)
