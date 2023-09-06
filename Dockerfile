FROM python:3.10-bullseye

RUN apt-get update && \
    apt-get install -y ffmpeg

EXPOSE 7865

WORKDIR /app

COPY . .

RUN pip3 cache purge

RUN pip3 install -r requirements.txt

RUN pip uninstall ffmpy gradio -y

RUN pip install ffmpy gradio

CMD ["python3.10", "./infer-web.py"]
