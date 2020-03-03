from flask import Flask
from flask import request
from flask import jsonify
# from flask_cors import CORS


app = Flask(__name__)

dictStock = {100: {'naam': 't-shirt', 'prijs': 18},
             101: {'naam': 'pull', 'prijs': 22},
             102: {'naam': 'koffie tas', 'prijs': 11}
             }


@app.route('/')
def hello_world():
    return 'ga naar de API url'


@app.route('/api/v1/products')
def products():
    return dictStock, 200


@app.route('/api/v1/payment', methods=['POST'])
def payment():
    try:
        product_id = int(request.form["product"])
        product_aantal = int(request.form["aantal"])

        prijs = str(dictStock[product_id]['prijs'] * product_aantal)
        if 0 < product_aantal < 1000 and product_id in dictStock.keys:
            print(
                f"{dictStock[product_id]['naam']}:\n\t-Besteld: {product_aantal} \n\t-Totaal prijs: {prijs}")
            # status created, oké en iets gedaan
            return jsonify(status="succes"), 201
        else:
            return jsonify(status="error"), 400
    except Exception as e:
        print(e)
        return jsonify(status="error"), 500


if __name__ == '__main__':
    app.run(debug=True)
