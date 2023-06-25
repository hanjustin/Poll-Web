import datetime

from django.test import TestCase
from django.utils import timezone
from django.urls import reverse

from polls.models import Question
from .test_index_view import create_question


class QuestionDetailViewTests(TestCase):
    def test_future_question_show_404(self):
        future_question = create_question(question_text="Future question.", offset_days=5)
        url = reverse("polls:detail", args=(future_question.id,))
        response = self.client.get(url)
        self.assertEqual(response.status_code, 404)

    def test_past_question_visible(self):
        past_question = create_question(question_text="Past Question.", offset_days=-5)
        url = reverse("polls:detail", args=(past_question.id,))
        response = self.client.get(url)
        self.assertContains(response, past_question.question_text)