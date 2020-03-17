from repositories.DataRepository import DataRepository
from flask import Flask, jsonify, request
from flask_cors import CORS

# Start app
app = Flask(__name__)
CORS(app)

# Custom endpoint
endpoint = '/api/v1'


# ROUTES
@app.route('/')
def index():
    return "PLEASE VISIT API ROUTE"


@app.route(endpoint+'/')
def api():
    return "Welcome to API"


@app.route(endpoint+"/bestemmingen")
def bestemmingen():
    if request.method == "GET":
        data = DataRepository.read_bestemmingen()
        if data is not None:
            return jsonify(bestemmingen=data, status="succes"), 200
        else:
            return jsonify(status="error"), 404
    else:
        return jsonify(status="error"), 405


@app.route(endpoint+"/treinen", methods=["GET", "POST"])
def treinen():
    if request.method == "GET":
        data = DataRepository.read_treinen()
        if data is not None:
            return jsonify(treinen=data, status="succes"), 200

        else:
            return jsonify(status="error"), 404
    elif request.method == "POST":
        gegevens = DataRepository.json_or_formdata(request)
        data = DataRepository.create_trein(
            gegevens["vertrek"], gegevens["bestemmingsid"], gegevens["spoor"])
        return jsonify(treinID=data), 201
    else:
        return jsonify(status="error"), 405


@app.route(endpoint+"/treinen/<trein_id>", methods=["GET", "PUT", "DELETE"])
def treinen_met_id(trein_id):
    if request.method == "GET":
        data = DataRepository.read_trein(trein_id)
        if data is not None:
            return jsonify(treinID=data, status="succes"), 200
        else:
            return jsonify(status="error"), 404
    elif request.method == "PUT":
        gegevens = DataRepository.json_or_formdata(request)
        data = DataRepository.update_trein(gegevens["vertrek"], gegevens["bestemmingsID"],
                                           gegevens["spoor"], gegevens["vertraging"], gegevens["afgeschaft"], trein_id)
        if data is not None:
            if data > 0:
                return jsonify(treinID=trein_id), 200
            else:
                return jsonify(status=data), 200
        else:
            return jsonify(status="error")
    elif request.method == "DELETE":
        data = DataRepository.delete_trein(trein_id)
        return jsonify(data), 204
    else:
        return jsonify(status="error"), 405


@app.route(endpoint+"/treinen/<trein_id>/vertraging", methods=["PUT"])
def treinen_vertraging(trein_id):
    if request.method == "PUT":
        gegevens = DataRepository.json_or_formdata(request)
        data = DataRepository.update_trein_vertraging(
            gegevens["vertraging"], trein_id)
        if data is not None:
            if data > 0:
                return jsonify(treinID=trein_id), 200
            else:
                return jsonify(status=data), 200
    else:
        return jsonify(status="error"), 405


@app.route(endpoint+"treinen/bestemming/<bestemmings_id>")
def treinen_bestemming(bestemmings_id):
    if request.method == "GET":
        data = DataRepository.read_treinen_met_bestemming(bestemmings_id)
        if data is not None:
            return jsonify(treinID=data, status="succes"), 200
        else:
            return jsonify(status="error"), 404
    else:
        return jsonify(status="error"), 405


# Start app
if __name__ == '__main__':
    app.run(debug=True)
