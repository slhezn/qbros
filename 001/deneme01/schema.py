from deneme01 import ma


class QuestionSchema(ma.Schema):

    class Meta:
        fields = ('questionId', 'question', 'answer', 'opt_A', 'opt_B',
                  'opt_C', 'opt_D', 'opt_E', 'user_id')


class SchollSchema(ma.Schema):

    class Meta:
        fields = ('schollName', 'periods')


class PeriodSchema(ma.Schema):

    class Meta:
        fields = ('periodName', 'lessons', 'scholl_id')


class LessonSchema(ma.Schema):

    class Meta:
        fields = ('lessonName', 'questions', 'period_id')