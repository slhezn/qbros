from deneme01 import create_app


app = create_app()

if __name__ == '__main__':
    app.run(debug=True)


"""
for creating db
cmd
python
from deneme01 import db, create_app
db.create_all(app=create_app())
"""