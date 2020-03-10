from repositories.DataRepository import DataRepository
from flask import Flask, request, jsonify, redirect
from flask_cors import CORS

app = Flask(__name__)
CORS(app)


# Custom endpoint
endpoint = '/api/v1'


@app.route('/')
def index():
    pass


@app.route(endpoint + '/klanten')
def klanten():
    pass


@app.route(endpoint + '/klanten/<id>')
def klant(id):
    pass


if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)
