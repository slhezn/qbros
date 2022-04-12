from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, RadioField
from wtforms.validators import DataRequired


class QuestionForm(FlaskForm):
    question = StringField('Soru', validators=[DataRequired()])
    answer = RadioField('Cevap', validators=[DataRequired()], choices=['A', 'B', 'C', 'D', 'E'])
    opt_A = StringField('A', validators=[DataRequired()])
    opt_B = StringField('B', validators=[DataRequired()])
    opt_C = StringField('C')
    opt_D = StringField('D')
    opt_E = StringField('E')
    submit = SubmitField('Kaydet')
