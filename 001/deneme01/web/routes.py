from flask import (Blueprint, redirect, render_template, request, jsonify,
                   url_for, flash)
from deneme01.models import Question
from deneme01 import db
from deneme01.web.forms import QuestionForm

web = Blueprint('web', __name__)


@web.route('/<int:lesson_id>', methods=['GET', 'POST'])
def add_question(lesson_id):
    form = QuestionForm()
    if form.validate_on_submit():
        question = form.question.data
        answer = form.answer.data
        opt_A = form.opt_A.data
        opt_B = form.opt_B.data
        opt_C = form.opt_C.data
        opt_D = form.opt_D.data
        opt_E = form.opt_E.data
        answered = ''

        new_question = Question(question, answer, opt_A, opt_B, opt_C, opt_D,
                                opt_E, answered, 1, lesson_id)

        db.session.add(new_question)
        db.session.commit()
        flash('Soru Eklendi', 'success'),
        return redirect(url_for('web.home'))
    return render_template('add_question.html',
                           title='Soru Ekle',
                           form=form,
                           legend='Soru Ekle')

@web.route('/')
def home():
    questions = Question.query.all()
    return render_template('index.html', questions = questions)



"""
redirect(url_for('web.add_question')) çalışmıyor. Listele sayfası falan oluştur.
"""