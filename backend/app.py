import sys
import os
from fastapi import FastAPI, Request, HTTPException
from fastapi.responses import FileResponse, JSONResponse
from fastapi.middleware.cors import CORSMiddleware
import numpy as np

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

STATIC_DIR = "static"

@app.get("/{full_path:path}")
async def serve_frontend(full_path: str):
    path = os.path.join(STATIC_DIR, full_path)
    if full_path and os.path.exists(path):
        return FileResponse(path)
    else:
        return FileResponse(os.path.join(STATIC_DIR, "index.html"))

@app.post("/api/random_number")
async def list_databases(request: Request):
    data = await request.json()
    try:
        nOut = np.random.randint(1,9)
        while data["currentN"] == nOut:
            print("SAME!!", nOut, data["currentN"] )
            nOut = np.random.randint(1,9)
        response = {"randN" : nOut}
    except Exception:
        response = {"randN" : 999}
    return JSONResponse(content=response)