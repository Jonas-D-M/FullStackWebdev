from flask_cors import CORS
from flask import Flask, request, jsonify, redirect
from repositories.DataRepository import DataRepository

app = Flask(__name__)
CORS(app)


# Custom endpoint
endpoint = '/api/v1'


@app.route('/')
def index():
    return redirect(endpoint+"/klanten", 301)


@app.route(endpoint + '/klanten', methods=["GET", "POST"])
def klanten():
    if request.method == "GET":
        data = DataRepository.read_klanten()
        if data is not None:
            return jsonify(klanten=data, status="succes"), 200
        else:
            return jsonify(status="error"), 404
    elif request.method == "POST":
        gegevens = DataRepository.json_or_formdata(request)
        data = DataRepository.create_klant(
            gegevens["FNaam"], gegevens["VNaam"], gegevens["Straat"], gegevens["Nummer"], gegevens["Postcode"], gegevens["Gemeente"])
        return jsonify(KlantID=data), 201


@app.route(endpoint + '/klanten/<id>', methods=["GET", "PUT", "DELETE"])
def klant(id):
    if request.method == "GET":
        data = jsonify(DataRepository.read_klant(id))
        if data is not None:
            return jsonify(klant=data, status="succes"), 200
        else:
            return jsonify(status="error"), 404
    elif request.method == "PUT":
        gegevens = DataRepository.json_or_formdata(request)
        data = DataRepository.update_klant(
            gegevens["FNaam"], gegevens["VNaam"], gegevens["Straat"], gegevens["Nr"], gegevens["Postcode"], gegevens["Gemeente"], id)
        if data is not None:
            if data > 0:
                return jsonify(KlantID=id), 200
            else:
                return jsonify(status=data), 200
        else:
            return jsonify(status="error")
    elif request.method == "DELETE":
        data = DataRepository.delete_klant(id)
        return jsonify(data), 204


@app.route(endpoint + '/bestemmingen', methods=["GET", "POST"])
def bestemmingen():
    if request.method == "GET":
        data = DataRepository.read_bestemmingen()
        if data is not None:
            return jsonify(bestemmingen=data, status="succes"), 200
        else:
            return jsonify(status="error"), 404
    elif request.method == "POST":
        gegevens = DataRepository.json_or_formdata(request)
        data = DataRepository.create_bestemming()
        return jsonify(BestemmingID=data), 201


@app.route(endpoint + '/bestemming/<id>', methods=["GET", "PUT", "POST"])
def bestemming():
    pass


if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)
