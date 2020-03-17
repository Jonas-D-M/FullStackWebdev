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
    pass


@app.route(endpoint+"/treinen", methods=["GET", "POST"])
def treinen():
    pass


@app.route(endpoint+"/treinen/<trein_id>", methods=["GET", "PUT", "POST", "DELETE"])
def treinen_met_id(trein_id):
    pass


@app.route(endpoint+"/treinen/<trein_id>/vertraging", methods=["PUT"])
def treinen_vertraging(trein_id):
    pass


@app.route(endpoint+"treinen/bestemming/<bestemmings_id>")
def treinen_bestemming(bestemmings_id):
    pass


# Start app
if __name__ == '__main__':
    app.run(debug=True)
