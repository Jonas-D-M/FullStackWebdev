from .Database import Database


class DataRepository:
    @staticmethod
    def json_or_formdata(request):
        if request.content_type == 'application/json':
            gegevens = request.get_json()
        else:
            gegevens = request.form.to_dict()
        return gegevens

    #########  logging  #########
    @staticmethod
    def read_logging():
        sql = "SELECT * from logging ORDER BY date DESC"
        return Database.get_rows(sql)

    @staticmethod
    def read_total_progress(date):
        sql = "SELECT CAST(SUM(`amount`) as SIGNED) amount  from `logging` WHERE date LIKE %s"
        params = [str(date)+"%"]
        return Database.get_one_row(sql, params)

    @staticmethod
    def delete_total_progress(date):
        sql = "DELETE FROM `logging` WHERE date LIKE %s"
        params = [str(date)+"%"]
        return Database.execute_sql(sql, params)

    @staticmethod
    def create_log(date, amount):
        sql = "INSERT INTO logging(date, amount) VALUES(%s,%s)"
        params = [date, amount]
        return Database.execute_sql(sql, params)

    # Onderstaande methods worden in deze oefening niet gebruikt.
    # @staticmethod
    # def read_log_by_id(idlog):
    #     sql = "SELECT * from logging WHERE id = %s"
    #     params = [idlog]
    #     return Database.get_one_row(sql, params)

    # @staticmethod
    # def read_log_by_date(date):
    #     sql = "SELECT * from logging WHERE date LIKE %s"
    #     params = [str(date)+"%"]
    #     return Database.get_rows(sql, params)

    # @staticmethod
    # def update_log(date, amount, idlog):
    #     sql = "UPDATE logging SET date = %s, amount = %s WHERE id = %s"
    #     params = [date, amount, idlog]
    #     print(sql)
    #     return Database.execute_sql(sql, params)

    # @staticmethod
    # def delete_log(idlog):
    #     sql = "DELETE from logging WHERE idlog = %s"
    #     params = [idlog]
    #     return Database.execute_sql(sql, params)
