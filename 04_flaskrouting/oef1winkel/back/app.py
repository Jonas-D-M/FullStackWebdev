from flask import Flask
from flask import request
from flask import jsonify
from flask_cors import CORS


app = Flask(__name__)

dictStock = {100: {'naam': 't-shirt', 'prijs': 18},
             101: {'naam': 'pull', 'prijs': 22},
             102: {'naam': 'koffie tas', 'prijs': 11}
             }


@app.route('/')
def hello_world():
    return 'ga naar de API url'


if __name__ == '__main__':
    app.run()