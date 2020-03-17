from .Database import Database


class DataRepository:
    @staticmethod
    def json_or_formdata(request):
        if request.content_type == 'application/json':
            gegevens = request.get_json()
        else:
            gegevens = request.form.to_dict()
        return gegevens

    #########  Treinen  #########
    @staticmethod
    def read_treinen():
        sql = "SELECT * FROM treinen"
        return Database.get_rows(sql)

    @staticmethod
    def read_trein(treinid):
        pass

    @staticmethod
    def create_trein():
        pass

    @staticmethod
    def update_trein():
        pass

    @staticmethod
    def delete_trein():
        pass

    @staticmethod
    def update_trein_vertraging(idtrein, vertraging):
        pass

    #########  Bestemmingen  #########
    @staticmethod
    def read_bestemmingen():
        sql = "SELECT * FROM bestemmingen"
        return Database.get_rows(sql)

    @staticmethod
    def read_treinen_met_bestemming(bestemmingid):
        pass
