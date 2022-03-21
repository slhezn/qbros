from flask import Blueprint, redirect, render_template, request, jsonify, url_for
from deneme01.models import Question
from deneme01.schema import QuestionSchema
from deneme01 import db

questions = Blueprint('questions', __name__)

question_schema = QuestionSchema()
questions_schema = QuestionSchema(many=True)


@questions.route('/api/question', methods=['POST'])
def add_question():
    question = request.json['question']
    answer = request.json['answer']
    opt_A = request.json['opt_A']
    opt_B = request.json['opt_B']
    opt_C = request.json['opt_C']
    opt_D = request.json['opt_D']
    opt_E = request.json['opt_E']
    user_id = request.json['user_id']
    lesson_id = request.json['lesson_id']

    new_question = Question(question, answer, opt_A, opt_B, opt_C, opt_D,
                            opt_E, user_id, lesson_id)

    db.session.add(new_question)
    db.session.commit()

    return question_schema.jsonify(new_question)


# Get All Questions API
@questions.route('/api/questions', methods=['GET'])
def get_questions():
    all_questions = Question.query.all()
    result = questions_schema.dump(all_questions)
    return jsonify(result)


# Get Single Questions API
@questions.route('/api/question/<id>', methods=['GET'])
def get_question(id):
    question = Question.query.get(id)
    return question_schema.jsonify(question)


# Update a Question API
@questions.route('/api/question/<id>', methods=['GET', 'PUT'])
def update_question(id):
    get_question = Question.query.get(id)

    question = request.json['question']
    answer = request.json['answer']
    opt_A = request.json['opt_A']
    opt_B = request.json['opt_B']
    opt_C = request.json['opt_C']
    opt_D = request.json['opt_D']
    opt_E = request.json['opt_E']
    user_id = request.json['user_id']
    lesson_id = request.json['lesson_id']

    get_question.question = question
    get_question.answer = answer
    get_question.opt_A = opt_A
    get_question.opt_B = opt_B
    get_question.opt_C = opt_C
    get_question.opt_D = opt_D
    get_question.opt_E = opt_E
    get_question.user_id = user_id
    get_question.lesson_id = lesson_id

    db.session.commit()

    return question_schema.jsonify(get_question)


# Delete Question API
@questions.route('/api/question/<id>', methods=['DELETE'])
def delete_question(id):
    question = Question.query.get(id)
    db.session.delete(question)
    db.session.commit()

    return question_schema.jsonify(question)
