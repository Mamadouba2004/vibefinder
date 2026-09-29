FROM python:3.11-slim

WORKDIR /app
ENV PYTHONUNBUFFERED=1

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py vibefinder_ui.html ./
COPY src ./src
COPY data ./data

EXPOSE 8501
# ANTHROPIC_API_KEY is supplied at runtime (docker run -e ...), never baked in.
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0", "--server.headless=true"]
