# FRONTEND BUILD
FROM node:20 AS frontend-builder
WORKDIR /frontend
COPY frontend/package*.json ./
RUN npm install -g vite
RUN npm install
COPY frontend/ ./
RUN npm run build -- --mode production

# BACKEND BUILD
FROM python:3.12-slim AS backend
WORKDIR /backend
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY backend/ ./
COPY --from=frontend-builder /frontend/dist ./static

# SERVE
ENV PORT=80
EXPOSE 80
CMD ["python", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=80"]











