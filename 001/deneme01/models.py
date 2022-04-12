from deneme01 import db
from flask_login import UserMixin

class User(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(20), nullable=False, unique=True)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password = db.Column(db.String(200),
                         primary_key=False,
                         unique=False,
                         nullable=False)
    image_file = db.Column(db.String(120),
                           default='default.jpg',
                           nullable=False)

    posts = db.relationship('Question', backref='owner', lazy=True)

    def __init__(self, username, email, password, image_file='default.jpg'):
        self.username = username
        self.email = email
        self.password = password
        self.image_file = image_file

    def withId(self, id, username, email, password, image_file='default.jpg'):
        self.id = id
        self.username = username
        self.email = email
        self.password = password
        self.image_file = image_file

class Scholl(db.Model):
    schollId = db.Column(db.Integer, primary_key=True)
    schollName = db.Column(db.String, nullable=False, unique=True)
    periods = db.relationship('Period', backref='scholl', lazy=True)

    def __init__(self, schollname):
        self.schollName = schollname


class Period(db.Model):
    periodId = db.Column(db.Integer, primary_key=True)
    periodName = db.Column(db.String, nullable=False)
    scholl_id = db.Column(db.Integer,
                          db.ForeignKey('scholl.schollId'),
                          nullable=False)
    lessons = db.relationship('Lesson', backref='period', lazy=True)

    def __init__(self, periodName, scholl_id):
        self.periodName = periodName
        self.scholl_id = scholl_id


class Lesson(db.Model):
    lessonId = db.Column(db.Integer, primary_key=True)
    lessonName = db.Column(db.String, nullable=False)
    period_id = db.Column(db.Integer,
                          db.ForeignKey('period.periodId'),
                          nullable=False)
    questions = db.relationship('Question', backref='lesson', lazy=True)

    def __init__(self, lessonName, period_id):
        self.lessonName = lessonName
        self.period_id = period_id

class Question(db.Model):
    questionId = db.Column(db.Integer, primary_key=True)
    question = db.Column(db.String, nullable=False)
    answer = db.Column(db.String, nullable=False)
    opt_A = db.Column(db.String, nullable=False)
    opt_B = db.Column(db.String, nullable=False)
    opt_C = db.Column(db.String)
    opt_D = db.Column(db.String)
    opt_E = db.Column(db.String)
    answered = db.Column(db.String)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    lesson_id = db.Column(db.Integer,
                          db.ForeignKey('lesson.lessonId'),
                          nullable=False)

    def __init__(self, question, answer, opt_A, opt_B, opt_C, opt_D, opt_E, answered,
                 user_id, lesson_id):
        self.question = question
        self.answer = answer
        self.opt_A = opt_A
        self.opt_B = opt_B
        self.opt_C = opt_C
        self.opt_D = opt_D
        self.opt_E = opt_E
        self.answered = answered
        self.user_id = user_id
        self.lesson_id = lesson_id


