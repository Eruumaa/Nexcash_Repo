from flask import Flask, jsonify, request
from flask_cors import CORS
from openai import OpenAI
import os

from dotenv import load_dotenv
load_dotenv()

app = Flask(__name__)
CORS(app)


API_KEY = os.environ.get("DEEPSEEK_API_KEY")
if not API_KEY:

    raise ValueError("Error: DEEPSEEK_API_KEY environment variable not set.")

client = OpenAI(
    api_key=API_KEY,
    base_url="https://api.deepseek.com/v1",
)

@app.route('/chat', methods=['POST'])
def handle_chat():
    try:
        data = request.json
       
        chat_history = data.get('messages')

        if not chat_history or not isinstance(chat_history, list):
            return jsonify({"error": "Format request salah. Perlu 'messages' berisi array history."}), 400

        response = client.chat.completions.create(
            model="deepseek-chat",
            messages=chat_history,
            stream=False
        )

        ai_response_message = response.choices[0].message
        ai_response_dict = {"role": ai_response_message.role, "content": ai_response_message.content}
        

        return jsonify(ai_response_dict), 200

    except Exception as e:
        print(f"Error: {e}") 
        return jsonify({"error": str(e)}), 500

@app.route('/')
def index():
    return jsonify({"status": "API is running"})
