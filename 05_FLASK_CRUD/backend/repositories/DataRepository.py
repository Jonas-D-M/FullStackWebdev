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
        sql = "SELECT * FROM tblklant"
        return Database.get_rows(sql)

    @staticmethod
    def read_klant(KlantID):
        sql = "SELECT * FROM tblklant WHERE klantid = %s"
        params = [KlantID]
        return Database.get_one_row(sql, params)

    @staticmethod
    def create_klant(naam, voornaam, straat, nr, postcode, gemeente):
        sql = "INSERT INTO tblklant (Fnaam, VNaam, Straat, Nummer, Postcode, Gemeente) VALUES (%s, %s, %s, %s, %s,%s)"
        params = [naam, voornaam, straat, nr, postcode, gemeente]
        return Database.execute_sql(sql, params)

    @staticmethod
    def update_klant(naam, voornaam, straat, nr, postcode, gemeente, klantid):
        sql = "UPDATE tblklant SET FNaam = %s, VNaam = %s, Straat = %s, Nummer = %s, Postcode = %s, Gemeente = %s WHERE KlantID = %s"
        params = [naam, voornaam, straat, nr, postcode, gemeente, klantid]
        return Database.execute_sql(sql, params)

    @staticmethod
    def delete_klant(klantid):
        sql = "DELETE FROM tblklant WHERE klantid = %s"
        params = [klantid]
        return Database.execute_sql(sql, params)

    #########  Bestemmingen  #########
    @staticmethod
    def read_bestemmingen():
        sql = "SELECT * FROM tblbestemmingen"
        return Database.get_rows(sql)

    @staticmethod
    def create_bestemming():
        pass
