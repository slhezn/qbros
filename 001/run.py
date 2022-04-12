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


python anywhere
mkvirtualenv --python=/usr/bin/python3.9 myflaskapi
pip install Flask
pip install flask_bcrypt
pip install flask_mail 
pip install flask_mail flask_login
pip install flask_marshmallow
pip install flask_sqlalchemy
git clone https://github.com/slhezn/qbros.git

"""