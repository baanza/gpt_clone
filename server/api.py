from fastapi import FastAPI, WebSocket, WebSocketDisconnect
from fastapi.responses import HTMLResponse
from model import llmresponse

with open("response.html", "r") as file:
    response = file.read()


app = FastAPI()

@app.get("/")
def welcome():
    return HTMLResponse(response)
@app.websocket("/ws")
async def chat(websocket: WebSocket):
    await websocket.accept()
    while True:
        try:
            query = await websocket.receive_text()
            res = llmresponse(query)
            await websocket.send_text(res)
        except WebSocketDisconnect:
            print("socket disconnected")
            await websocket.close()