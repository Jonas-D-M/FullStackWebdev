from repositories.DataRepository import DataRepository
from flask import Flask, jsonify, request
from flask_cors import CORS

# Start app
app = Flask(__name__)
CORS(app)

# Custom endpoint
endpoint = '/api/v1'


# ROUTES
@app.route(endpoint + '/bestemmingen', methods=['GET'])
def get_destinations():
    if request.method == 'GET':
        return jsonify(bestemmingen=DataRepository.read_bestemmingen()), 200
    # het is niet nodig om de andere methods te voorzien.


@app.route(endpoint + '/treinen', methods=['GET', 'POST'])
def get_treinen():
    if request.method == 'GET':
        return jsonify(treinen=DataRepository.read_treinen()), 200
    elif request.method == 'POST':
        gegevens = DataRepository.json_or_formdata(request)
        nieuw_id = DataRepository.create_trein(
            gegevens['vertrek'], gegevens['bestemmingID'], gegevens['spoor'], gegevens['vertraging'], gegevens['afgeschaft'])
        return jsonify(treinid=nieuw_id), 201


@app.route(endpoint + '/treinen/<trein_id>', methods=['GET', 'PUT', 'DELETE'])
def get_trein(trein_id):
    if request.method == 'GET':
        return jsonify(DataRepository.read_trein(trein_id))
    elif request.method == 'PUT':
        gegevens = DataRepository.json_or_formdata(request)
        data = DataRepository.update_trein(gegevens['vertrek'], gegevens['bestemmingID'],
                                           gegevens['spoor'], gegevens['vertraging'], gegevens['afgeschaft'], trein_id)
        print(data)
        return jsonify(trein_id=trein_id), 200
    elif request.method == 'DELETE':
        data = DataRepository.delete_trein(trein_id)
        if data > 0:
            return jsonify(status="success", row_count=data), 201
        else:
            return jsonify(status="no update", row_count=data), 201


''' NOG TOEVOEGEN AAN UITLEG '''
@app.route(endpoint + '/treinen/<trein_id>/vertraging', methods=['PUT'])
def set_trein_vertraging(trein_id):
    if request.method == 'PUT':
        gegevens = DataRepository.json_or_formdata(request)
        data = DataRepository.update_trein_vertraging(
            trein_id, gegevens['vertraging'])
        return jsonify(trein_id=trein_id), 200


@app.route(endpoint + '/treinen/bestemming/<bestemming_id>', methods=['GET'])
def get_trein_per_bestemming(bestemming_id):
    if request.method == 'GET':
        return jsonify(trein=DataRepository.read_treinen_met_bestemming(bestemming_id))


# Start app
if __name__ == '__main__':
    app.run(debug=True)
