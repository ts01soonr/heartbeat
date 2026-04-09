# Hearbeat Control system

Deploy Hearbeat Control system together with NextCloud


# Nextcloud + MariaDB + phpMyAdmin + Heartbeat Server & Client

This repository contains a Docker Compose setup that deploys a complete environment consisting of:

- **Nextcloud** (self‑hosted cloud storage)
- **MariaDB** (database)
- **phpMyAdmin** (DB management UI just-in-case)
- **Heartbeat Server** (task distribution service)
- **Heartbeat Client** (agent that polls and executes tasks)

All services communicate through a shared internal Docker network.

## 🚀 Features

✅ Fully containerized Nextcloud stack  
✅ Persistent MariaDB storage  
✅ phpMyAdmin for easy DB administration  
✅ Heartbeat Server for distributing tasks  
✅ Heartbeat Client for polling and executing tasks  
✅ Internal bridge network for secure communication  
✅ Environment‑variable‑driven configuration  

## 📂 Project Structure
```
.
├── docker-compose.yml
├── db/                     # MariaDB data storage
├── initdb/                 # Database initialization scripts
├── www/                    # Nextcloud persistent files
└── README.md
```

## 🛠️ Prerequisites

- Docker  
- Docker Compose v2 or newer  
- `.env` file containing:
```
MYSQL_ROOT_PASSWORD=your_password
MYSQL_DATABASE=your_nextcloud_db
MYSQL_USER=your_user
MYSQL_PASSWORD=your_password

HB_USER=your_hb_user
HB_PWD=your_hb_password
HB_DATABASE=your_hb_db
```

## 📦 Services Overview

### 1. MariaDB (`db`)
- Image: `mariadb:10.11`
- Stores data in `./db`
- Initializes using scripts from `./initdb`
- Used by both Nextcloud and the Heartbeat Server

### 2. Nextcloud (`app`)
- Image: `nextcloud`
- Accessible at **http://localhost:8080**
- Stores files in `./www`
- Connects to the MariaDB instance

### 3. phpMyAdmin (`phpmyadmin`)
- Image: `phpmyadmin/phpmyadmin`
- Accessible at **http://localhost:8081**
- For managing the MariaDB database
- Note: Enable PMA_PASSWORD: ${MYSQL_ROOT_PASSWORD} in [ docker-compose.yml ](docker-compose.yml#L46) 


### 4. Heartbeat Server (`hbserver`)
- Image: `ts01soonr/hbs`
- Accessible at **http://localhost:8082**
- Uses MariaDB for storing heartbeat task data
- Requires HB credentials via environment variables

### 5. Heartbeat Client (`hbagent`)
- Image: `ts01soonr/hbc`
- Accessible at **tcp://localhost:8088**
- Polls the Heartbeat Server for tasks

## ▶️ How to Run

Start all services:
```bash
docker compose up -d
```
Stop all services:
```bash
docker compose down
```
View logs:
```bash
docker compose logs -f
```

## 🌐 Access Points

| Service            | URL                         |
|--------------------|-----------------------------|
| Nextcloud          | http://localhost:8080       |
| phpMyAdmin         | http://localhost:8081       |
| Heartbeat Server   | http://localhost:8082       |
| Heartbeat Client   | tcp://localhost:8088       |

## 🧹 Clean Up

To remove containers but keep data:
```bash
docker compose down
```
To remove everything including volumes:
```bash
docker compose down -v
```

## 📘 Notes

- All services run on an isolated internal Docker network.
- Modify ports in `docker-compose.yml` if needed.
- Ensure your `.env` file exists before launching the stack. 

 **Warning:** Running services locally or under a private network. Do not recommended for public access. Ensure that appropriate security measures are in place if exposing services to the internet. Using Traefik reverse proxies can be good choice to HTTPS services
