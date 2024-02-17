import unittest
from app import app

class TestApp(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()

    def test_index_page(self):
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'John Doe', response.data)
        self.assertIn(b'Software Engineer', response.data)
        self.assertIn(b'Email: john.doe@example.com', response.data)
        self.assertIn(b'Phone: 123-456-7890', response.data)

if __name__ == '__main__':
    unittest.main()
