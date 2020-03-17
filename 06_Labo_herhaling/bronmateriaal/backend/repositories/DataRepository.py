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
        sql = "SELECT * FROM treinen WHERE idtrein = %s"
        params = [treinid]
        return Database.get_one_row(sql, params)

    @staticmethod
    def create_trein(vertrek, bestemmingsID, spoor):
        sql = "INSERT INTO treinen (vertrek, bestemmingsID, spoor) VALUES (%s, %s, %s)"
        params = [vertrek, bestemmingsID, spoor]
        return Database.execute_sql(sql, params)

    @staticmethod
    def update_trein(vertrek, bestemmingsID, spoor, vertraging, afgeschaft, idtrein):
        sql = "UPDATE treinen SET vertrek = %s, bestemmingsID = %s, spoor = %s, vertraging = %s, afgeschaft = %s WHERE idtrein = %s"
        params = [vertrek, bestemmingsID, spoor,
                  vertraging, afgeschaft, idtrein]
        return Database.execute_sql(sql, params)

    @staticmethod
    def delete_trein(idtrein):
        sql = "DELETE FROM treinen WHERE idtrein = %s"
        params = [idtrein]
        return Database.execute_sql(sql, params)

    @staticmethod
    def update_trein_vertraging(idtrein, vertraging):
        sql = "UPDATE treinen SET vertraging = %s WHERE idtrein= %s"
        params = [vertraging, idtrein]
        return Database.execute_sql(sql, params)

    #########  Bestemmingen  #########
    @staticmethod
    def read_bestemmingen():
        sql = "SELECT * FROM bestemmingen"
        return Database.get_rows(sql)

    @staticmethod
    def read_treinen_met_bestemming(bestemmingid):
        sql = "SELECT * FROM treinen t INNER JOIN bestemmingen b ON t.bestemmingID = b.idbestemming WHERE idbestemming = %s"
        params = [bestemmingid]
        return Database.get_rows(sql, params)
