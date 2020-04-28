from .Database import Database


class DataRepository:
    @staticmethod
    def json_or_formdata(request):
        if request.content_type == 'application/json':
            gegevens = request.get_json()
        else:
            gegevens = request.form.to_dict()
        return gegevens

    #########  treinen  #########
    @staticmethod
    def read_treinen():
        sql = "SELECT * from treinen"
        return Database.get_rows(sql)

    @staticmethod
    def read_trein(idtrein):
        sql = "SELECT * from treinen WHERE idtrein = %s"
        params = [idtrein]
        return Database.get_one_row(sql, params)

    @staticmethod
    def read_treinen_met_bestemming(idtrein):
        sql = "SELECT * FROM treinen t INNER JOIN bestemmingen b ON t.bestemmingID = b.idbestemming WHERE idbestemming = %s"
        params = [idtrein]
        return Database.get_rows(sql, params)

    @staticmethod
    def create_trein(vertrek, bestemmingID, spoor, vertraging, afgeschaft):
        sql = "INSERT INTO treinen(vertrek, bestemmingID, spoor, vertraging, afgeschaft) VALUES(%s,%s,%s,%s,%s)"
        params = [vertrek, bestemmingID, spoor, vertraging, afgeschaft]
        return Database.execute_sql(sql, params)

    @staticmethod
    def update_trein(vertrek, bestemmingID, spoor, vertraging, afgeschaft, idtrein):
        sql = "UPDATE treinen SET vertrek = %s, bestemmingID = %s, spoor = %s, vertraging = %s, afgeschaft = %s WHERE idtrein = %s"
        params = [vertrek, bestemmingID, spoor,
                  vertraging, afgeschaft, idtrein]
        print(sql)
        return Database.execute_sql(sql, params)

    @staticmethod
    def update_trein_vertraging(idtrein, vertraging):
        sql = "UPDATE treinen SET vertraging = %s WHERE idtrein = %s"
        params = [vertraging, idtrein]
        print(params)
        return Database.execute_sql(sql, params)

    @staticmethod
    def delete_trein(idtrein):
        sql = "DELETE from treinen WHERE idtrein = %s"
        params = [idtrein]
        return Database.execute_sql(sql, params)

     #########  Bestemmingen  #########
    @staticmethod
    def read_bestemmingen():
        sql = "SELECT * from bestemmingen"
        return Database.get_rows(sql)
