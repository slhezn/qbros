from flask import Flask
from flask_marshmallow import Marshmallow
from flask_sqlalchemy import SQLAlchemy
from deneme01.config import Config
from flask_bcrypt import Bcrypt
from flask_mail import Mail
# from flask_login import LoginManager

db = SQLAlchemy()
ma = Marshmallow()
bcrypt = Bcrypt()

# login_manager = LoginManager()
# login_manager.login_view = 'users.login'
# login_manager.login_message_category = 'info'
# mail = Mail()
 

def create_app(config_class=Config):
    app = Flask(__name__)
    app.config.from_object(Config)

    db.init_app(app)
    ma.init_app(app)
    bcrypt.init_app(app)
    # login_manager.init_app(app)
    # mail.init_app(app)

    from deneme01.questions.routes import questions
    from deneme01.web.routes import web
    # from deneme01.scholls.routes import scholls
    # from deneme01.periods.routes import periods
    # from deneme01.lessons.routes import lessons
    # from deneme01.main.routes import main
    # from deneme01.users.routes import users
    app.register_blueprint(questions)
    app.register_blueprint(web)
    # app.register_blueprint(scholls)
    # app.register_blueprint(periods)
    # app.register_blueprint(lessons)
    # app.register_blueprint(main)
    # app.register_blueprint(users)

    return app