from flask import Flask, jsonify, request
from flask_cors import CORS
from openai import OpenAI
from dotenv import load_dotenv
import os 

load_dotenv()

app = Flask(__name__)
CORS(app)

API_KEY = os.environ.get("DEEPSEEK_API_KEY")
if not API_KEY:
    print("Error: DEEPSEEK_API_KEY environment variable not set.")

client = OpenAI(
    api_key=API_KEY,
    base_url="https://api.deepseek.com/v1",
)

chat_history = [
    {"role": "system", "content": "You are a helpful assistant."}
]

@app.route('/chat', methods=['POST'])
def handle_chat():
    try:
        new_message = request.json
        if 'role' not in new_message or 'content' not in new_message:
            return jsonify({"error": "Format pesan salah. Perlu 'role' dan 'content'."}), 400

        chat_history.append(new_message)

        response = client.chat.completions.create(
            model="deepseek-chat",
            messages=chat_history,
            stream=False
        )

        ai_response_message = response.choices[0].message
        ai_response_dict = {"role": ai_response_message.role, "content": ai_response_message.content}


        chat_history.append(ai_response_dict)


        return jsonify(ai_response_dict), 200

    except Exception as e:

        return jsonify({"error": str(e)}), 500
    
@app.route('/chat', methods=['GET'])
def get_chat_history():
    return jsonify(chat_history)

if __name__ == '__main__':
    app.run(debug=True)