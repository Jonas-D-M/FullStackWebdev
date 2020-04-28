from repositories.DataRepository import DataRepository
from flask import Flask, jsonify
from flask_socketio import SocketIO
from flask_cors import CORS


app = Flask(__name__)
app.config['SECRET_KEY'] = 'Hier mag je om het even wat schrijven, zolang het maar geheim blijft en een string is'

socketio = SocketIO(app, cors_allowed_origins="*")
CORS(app)


# THREAD


# API ENDPOINTS
@app.route('/')
def hallo():
    return "Server is running, er zijn momenteel geen API endpoints beschikbaar."


# SOCKET IO


if __name__ == '__main__':
    socketio.run(app, debug=True, host='0.0.0.0')
