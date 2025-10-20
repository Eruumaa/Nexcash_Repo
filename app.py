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


SYSTEM_INSTRUCTION = {
    "role": "system",
    "content": "Oke, fokus utama kamu adalah membantu pengembangan aplikasi NEXCASH. Aplikasi ini bertujuan untuk mengatasi rendahnya literasi keuangan remaja di Indonesia yang rentan terhadap pinjaman online, judi, dan gaya hidup konsumtif. Tugas utamamu adalah membantu proses pengembangan game edukasi finansial ini agar remaja dapat belajar mengelola uang dan membangun kebiasaan finansial yang sehat. PENTING: Selalu berikan jawaban kamu secara singkat dan jelas, maksimal 20 kata."
}


@app.route('/chat', methods=['POST'])
def handle_chat():
    try:
        data = request.json
        
        user_chat_history = data.get('messages')

        if not user_chat_history or not isinstance(user_chat_history, list):
            return jsonify({"error": "Format request salah. Perlu 'messages' berisi array history."}), 400

        messages_to_send = [SYSTEM_INSTRUCTION] + user_chat_history

        response = client.chat.completions.create(
            model="deepseek-chat",
            messages=messages_to_send, 
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

if __name__ == '__main__':
    app.run()