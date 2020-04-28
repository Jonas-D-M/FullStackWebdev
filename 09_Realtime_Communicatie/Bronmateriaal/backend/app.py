#from flask_socketio import SocketIO
#from repositories.DataRepository import DataRepository
from flask import Flask, jsonify, request
from flask_cors import CORS
#from datetime import datetime, date

# Start app
app = Flask(__name__)
CORS(app)

# Custom endpoint
endpoint = '/api/v1'


# ROUTES
@app.route('/')
def info():
    return jsonify(info='Please go to the endpoint ' + endpoint)


# # SOCKET.IO EVENTS


# START THE APP
if __name__ == '__main__':
    app.run()
