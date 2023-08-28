import sqlite3

with open('./quiz.sql', 'r') as f:
    script = f.read()

db = sqlite3.connect('./quiz.db')
cursor = db.cursor()
cursor.executescript(script)
db.commit()
db.close()

