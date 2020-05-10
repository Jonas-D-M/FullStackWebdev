from flask_socketio import SocketIO
from flask import Flask, jsonify, request
from flask_cors import CORS
from datetime import datetime, date
from repositories.DataRepository import DataRepository


# Start app
app = Flask(__name__)
app.config['SECRET_KET'] = 'ZeerGeheimeSleutel'

# setting cors
socketio = SocketIO(app, cors_allowed_origins="*")
CORS(app)

# Custom endpoint
endpoint = '/api/v1'


# ROUTES
@app.route('/')
def info():
    return jsonify(info='Please go to the endpoint ' + endpoint)


@app.route(endpoint + "/progress/today", methods=["DELETE"])
def delete_records():
    print("delete records")
    if request.method == "DELETE":
        data = DataRepository.delete_total_progress(date.today())
        if data is not None:
            socketio.emit('B2F_clear', {'amount': 0})
            return jsonify(data)
    else:
        return jsonify(405)


@app.route(endpoint + "/progress", methods=["GET"])
def get_progress():
    print("Get progress")
    if request.method == "GET":
        data = DataRepository.read_logging()
        if data is not None:
            return jsonify(logs=data, status="succes"), 200
        else:
            return jsonify(status="error"), 404
    else:
        return jsonify(status="error"), 405


@app.route(endpoint+"/progress")
# # SOCKET.IO EVENTS
@socketio.on('connect')
def initial_connection():
    print("a new client connected")
    # get value from date
    data = DataRepository.read_total_progress(date.today())
    if data['amount'] is not None:
        previous_progress = data['amount']
    else:
        previous_progress = 0

    # send to the client
    socketio.emit("B2F_connected", {'currentProgress': previous_progress})


@socketio.on('F2B_new_logging')
def F2B_new_logging(payload):
    print(payload)
    current_date = datetime.now()
    amount = payload['amount']

    DataRepository.create_log(current_date, amount)

    socketio.emit("B2F_addProgress", {'amount': amount})
    print("succes?")


# START THE APP
if __name__ == '__main__':
    app.run(debug=True)
