# Building the Classic Snake Game with Python
This is the repository for the LinkedIn Learning course `Building the Classic Snake Game with Python`. The full course is available from [LinkedIn Learning][lil-course-url].

![lil-thumbnail-url]

Are you looking for a fun, meaningful way to level up your Python programming skills? In this course, instructor Robin Andrews shows you how to put together what you need to know to build the Python version of a classic Snake game. Robin introduces you to turtle graphics and how you can use and control animation using Python turtle graphics. He explains global variables and shows you how to draw with turtle graphics by using stamps. With these pieces in place, it’s time to work on the game itself! Robin walks you through how to represent the snake, move it around the screen, and control the snake’s direction. He discusses the game loop that is used to control the game and also goes over how to add snake food to the game, implement a scoring system, and reset the game. Robin finishes up with advice on how to use Lambda expressions to avoid repetition in your game and some fun ways to personalize your game.

Here’s a step-by-step **README.md** to run your Dockerized Python GUI Snake Game on **Windows using VcXsrv**:

---

## 🐍 Snake Game (Turtle Graphics) – Dockerized

This project is a classic Snake Game built with Python's Turtle Graphics. It runs inside a Docker container and displays the GUI on your Windows machine using **VcXsrv** (X Server).

---

## 🛠️ Prerequisites

1. **Docker Desktop** installed and running
2. **VcXsrv** (X11 server) for Windows
   👉 [Download VcXsrv](https://vcxsrv.com/)

---

## 🖥️ Setup VcXsrv

1. Open **VcXsrv**
2. Select:

   * ✅ *Multiple Windows*
   * ✅ *Start no client*
   * ✅ *Disable access control*
3. Click **Finish**
4. Allow through **Windows Firewall** when prompted

---

## 🐳 Build Docker Image

Place your Python game file (e.g., `snake_game_with_graphics.py`) and assets in a directory and create a `Dockerfile` like:

```dockerfile
FROM python:3.9

# Install Tkinter
RUN apt-get update && \
    apt-get install -y python3-tk

WORKDIR /app
COPY . .

CMD ["python", "snake_game_with_graphics.py"]
```

Then build the image:

```bash
docker build -t snake-game:v2 .
```

---

## ▶️ Run the Game

```bash
docker run -it --rm -e DISPLAY=host.docker.internal:0.0 snake-game:v2
```

If `host.docker.internal` doesn’t work, use your **host IP address**:

```bash
ipconfig   # Find IPv4 Address
docker run -it --rm -e DISPLAY=YOUR_IP_HERE:0.0 snake-game:v2
```

---

## ✅ Expected Result

A game window should open via VcXsrv showing the Snake Game.
Use **arrow keys** to play.

---

## 🧹 Clean Up

No cleanup needed for `--rm`, but you can manually remove the image:

```bash
docker rmi snake-game:v2
```

---

## 📂 Project Structure Example

```
/snake-game
│
├── Dockerfile
├── snake_game_with_graphics.py
└── assets/
    ├── bg2.gif
    ├── snake-food-32x32.gif
    └── snake-head-20x20.gif
```

---


[0]: # (Replace these placeholder URLs with actual course URLs)

[lil-course-url]: https://www.linkedin.com/learning/building-the-classic-snake-game-with-python
[lil-thumbnail-url]: https://cdn.lynda.com/course/2896343/2896343-1634664622455-16x9.jpg

