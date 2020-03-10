from .Database import Database


class DataRepository:
    @staticmethod
    def json_or_formdata(request):
        if request.content_type == 'application/json':
            gegevens = request.get_json()
        else:
            gegevens = request.form.to_dict()
        return gegevens

    #########  Klanten  #########
    @staticmethod
    def read_klanten():
        pass

    @staticmethod
    def read_klant(KlantID):
        pass

    @staticmethod
    def create_klant(naam, voornaam, straat, nr, postcode, gemeente):
        pass

    @staticmethod
    def update_klant(naam, voornaam, straat, nr, postcode, gemeente, klantid):
        pass

    @staticmethod
    def delete_klant(klantid):
        pass
