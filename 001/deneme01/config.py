import os


class Config:
    """
    Nasıl os tan çekilir görmek için
    https://www.youtube.com/watch?v=IolxqkL7cD8&t=0s
    SECRET_KEY = os.environ.get('SECRET_KEY')
    SQLALCHEMY_DATABASE_URI = os.environ.get('SQLALCHEMY_DATABASE_URI')
    """
    SECRET_KEY = '7fd530adce43e46fb46d01e22644fbb110ec0ebbb619ccb55eaf0872570d3318'
    SQLALCHEMY_DATABASE_URI = 'sqlite:///deneme01.db'
    # MAIL_SERVER = 'smtp.googlemail.com'
    # MAIL_PORT = 587
    # MAIL_USE_TLS = True
    # MAIL_USERNAME = os.environ.get('EMAIL_USER')
    # MAIL_PASSWORD = os.environ.get('EMAIL_PASS')