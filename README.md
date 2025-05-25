
# Building the Classic Snake Game with Python

This repository accompanies the LinkedIn Learning course **Building the Classic Snake Game with Python** by Robin Andrews.
Full course available at [LinkedIn Learning][lil-course-url].

![Course Thumbnail][lil-thumbnail-url]

Learn to build the classic Snake game with Python’s Turtle graphics, including animation, keyboard controls, scoring, and more!

---

## 🐍 Snake Game (Turtle Graphics) – Dockerized for Windows with VcXsrv

This project demonstrates how to containerize a Python Turtle graphics app with Docker and run it on Windows by forwarding the GUI via an X11 server (VcXsrv).

---

## 🛠️ Prerequisites

* [Docker Desktop](https://www.docker.com/products/docker-desktop) installed and running
* [VcXsrv X Server for Windows](https://sourceforge.net/projects/vcxsrv/) installed and configured

---

## 🖥️ Setup VcXsrv

1. Launch **VcXsrv** (XLaunch)
2. Select:

   * **Multiple windows**
   * **Start no client**
   * **Disable access control**
3. Click **Finish** and allow firewall access when prompted

---

## 🐳 Build Docker Image

Place your Python game (`snake_game_with_graphics.py`) and assets (images) inside a directory with this `Dockerfile`:

```dockerfile
FROM python:3.9

# Install tkinter dependencies for Turtle GUI
RUN apt-get update && apt-get install -y python3-tk

WORKDIR /app
COPY . .

CMD ["python", "snake_game_with_graphics.py"]
```

Build the image with:

```bash
docker build -t snake-game:v2 .
```

---

## ▶️ Run the Game Container

Run the Docker container with the DISPLAY environment variable pointing to your Windows host’s X server:

```bash
docker run -it --rm -e DISPLAY=host.docker.internal:0.0 snake-game:v2
```

> If `host.docker.internal` does not work, replace it with your Windows machine IP address (find it via `ipconfig`):

```bash
docker run -it --rm -e DISPLAY=YOUR_IP_HERE:0.0 snake-game:v2
```

---

## ✅ Expected Result

A new window opens (via VcXsrv) showing the Snake game. Use **arrow keys** to control the snake and enjoy!

---

## 🧹 Cleanup

The container removes itself after exit (`--rm` flag), but you can delete the Docker image manually with:

```bash
docker rmi snake-game:v2
```

---

## 📂 Project Directory Structure

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

[lil-course-url]: https://www.linkedin.com/learning/building-the-classic-snake-game-with-python
[lil-thumbnail-url]: https://cdn.lynda.com/course/2896343/2896343-1634664622455-16x9.jpg

---

