import os
from dotenv import load_dotenv
from groq import Groq

load_dotenv()
client = Groq(
    api_key= os.environ.get("GROQ_API_KEY")
)

def llmresponse(query:str):
    chat_completion = client.chat.completions.create(
        messages=[
            {
                "role": "user",
                "content": query
            }
        ],
        model= "llama-3.3-70b-versatile",
    )
    return chat_completion.choices[0].message.content