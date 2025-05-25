FROM python:3.9

WORKDIR /app

COPY . .

ENV DISPLAY=host.docker.internal:0.0

CMD ["python", "snake_game_with_graphics.py"]



