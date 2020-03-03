# importeer de flask library
from flask import Flask
from flask import jsonify
from flask_cors import CORS
import os

# Maak een applicatie-object aan
app = Flask(__name__)
CORS(app)  # zorg dat er geen CORS errors optreden

dict_punten = {
    "Blanck":     [{"module": "Full-stack Web Dev", "punt": 16}, {"module": "Sensors & interfacing", "punt": 15}, {"module": "Data Management", "punt": 17}, {"module": "UI Design", "punt": 15}, {"module": "Project 1", "punt": 18}],
    "Boddin":     [{"module": "Full-stack Web Dev", "punt": 10}, {"module": "Sensors & interfacing", "punt": 7}, {"module": "Data Management", "punt": 10}, {"module": "UI Design", "punt": 1}, {"module": "Project 1", "punt": 9}],
    "Bogaert":    [{"module": "Full-stack Web Dev", "punt": 12}, {"module": "Sensors & interfacing", "punt": 13}, {"module": "Data Management", "punt": 14}, {"module": "UI Design", "punt": 15}, {"module": "Project 1", "punt": 11}],
    "Bossuyt":    [{"module": "Full-stack Web Dev", "punt": 14}, {"module": "Sensors & interfacing", "punt": 20}, {"module": "Data Management", "punt": 19}, {"module": "UI Design", "punt": 19}, {"module": "Project 1", "punt": 17}],
    "Brion":      [{"module": "Full-stack Web Dev", "punt": 13}, {"module": "Sensors & interfacing", "punt": 12}, {"module": "Data Management", "punt": 12}, {"module": "UI Design", "punt": 3}, {"module": "Project 1", "punt": 12}],
    "Brock":      [{"module": "Full-stack Web Dev", "punt": 17}, {"module": "Sensors & interfacing", "punt": 8}, {"module": "Data Management", "punt": 11}, {"module": "UI Design", "punt": 13}, {"module": "Project 1", "punt": 17}],
    "Bruggeman":  [{"module": "Full-stack Web Dev", "punt": 8}, {"module": "Sensors & interfacing", "punt": 11}, {"module": "Data Management", "punt": 10}, {"module": "UI Design", "punt": 20}, {"module": "Project 1", "punt": 13}],
    "Brutyn":     [{"module": "Full-stack Web Dev", "punt": 11}, {"module": "Sensors & interfacing", "punt": 15}, {"module": "Data Management", "punt": 12}, {"module": "UI Design", "punt": 11}, {"module": "Project 1", "punt": 7}],
    "Bulckaen":   [{"module": "Full-stack Web Dev", "punt": 6}, {"module": "Sensors & interfacing", "punt": 5}, {"module": "Data Management", "punt": 11}, {"module": "UI Design", "punt": 1}, {"module": "Project 1", "punt": 3}]
}


# start de Flask server met debug
if __name__ == '__main__':
    app.run(debug=True)
