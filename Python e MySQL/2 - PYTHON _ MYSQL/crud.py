import MySQLdb

host = 'localhost'
user = 'aplicacao'
password = '123456'
db = 'escola_curso'
port = 3306

con = MySQLdb.connect(host, user, password, db, port)

# REALIZAR CRUD

# CRUD SELECT
c = con.cursor(MySQLdb.cursors.DictCursor)
# MySQLdb.cursors.DictCursor força as sáidas serem uma tupla de dicionários

def select(fields, tables, where = None):

    global c

    query = "SELECT " + fields + " FROM " + tables
    if(where):
        query = query + " WHERE " + where
    
    c.execute(query)
    return c.fetchall()

# print(select("nome, cpf", "alunos", "id_aluno = 1"))
result = select("nome, cpf", "alunos")
# print(result[0]['cpf'])

# CRUD INSERT
def insert(values, table, fields = None):
    global c, con

    # INSERT INTO <table> (fields) VALUES (),(),()

    query = 'INSERT INTO ' + table
    if(fields):
        query = query + ' (' + fields + ') '

    query = query + ' VALUES ' + ','.join(['(' + v + ')' for v in values])

    # print(query)
    c.execute(query)
    con.commit()


values = ["DEFAULT, 'João Pedro', '2000-01-01', 'Av das Pedras, 123', 'Betim', 'MG', '12345678911'",
        "DEFAULT, 'Maria Pedro', '2000-01-01', 'Av das Pedras, 123', 'Betim', 'MG', '12345678910'"]

insert(values, "alunos")

# print(select("*", "alunos"))

# CRUD UPDATE
# UPADTE table
# SET fields  = value, field = value
# WHERE 

def update(sets, table, where = None):
    global c, con
    query = "UPDATE " + table
    query = query + " SET " + ', '.join([field + " = '" + value + "'" for field, value in sets.items()])
    if(where):
        query = query + " WHERE " + where

    c.execute(query)
    con.commit()

update({"nome":"João Martins", "cidade":"Curitiba"}, "alunos", "id_aluno = 8")
# print(select("*", "alunos", "id_aluno = 8"))

# CRUD DELETE
# DELETE FROM table WHERE
def delete(table, where):
    global c, con
    query = "DELETE FROM " + table + " WHERE " + where

    c.execute(query)
    con.commit()

print(select("*", "alunos", "id_aluno = 9"))
print(delete("alunos", "id_aluno = 9"))
print(select("*", "alunos", "id_aluno = 9"))
