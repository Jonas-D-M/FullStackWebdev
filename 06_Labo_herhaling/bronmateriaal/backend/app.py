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


# Start app
if __name__ == '__main__':
    app.run(debug=True)
