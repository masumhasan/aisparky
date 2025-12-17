# 🚀 Quick Start - Build, Dockerize & Deploy

## ✅ Setup Complete!

Your SparkTech Voice Agent is now ready for Docker deployment with the following files:

- ✅ [Dockerfile](Dockerfile) - Multi-stage optimized build
- ✅ [docker-compose.yml](docker-compose.yml) - Easy local deployment
- ✅ [.dockerignore](.dockerignore) - Optimized build context
- ✅ [build-deploy.ps1](build-deploy.ps1) - Automated build script
- ✅ [DOCKER_DEPLOYMENT.md](DOCKER_DEPLOYMENT.md) - Comprehensive deployment guide
- ✅ [next.config.ts](next.config.ts) - Configured for standalone output

---

## 📋 Prerequisites

1. **Install Docker Desktop**
   - Download: https://www.docker.com/products/docker-desktop
   - Install and restart your computer
   - Ensure Docker is running (check system tray)

2. **Set up environment variables**
   - Copy [.env.example](.env.example) to `.env.local`
   - Add your LiveKit credentials

---

## 🎯 Three Ways to Deploy

### Option 1: Automated Build Script (Easiest)

```powershell
.\build-deploy.ps1
```

This interactive script will:
- Build the Docker image
- Let you choose deployment method
- Start the application
- Show helpful commands

### Option 2: Docker Compose (Recommended)

```powershell
# Build and start
pnpm run docker:compose:up

# View logs
pnpm run docker:compose:logs

# Stop
pnpm run docker:compose:down
```

### Option 3: Docker CLI (Manual)

```powershell
# Build
pnpm run docker:build

# Run
pnpm run docker:run

# View logs
pnpm run docker:logs

# Stop
pnpm run docker:stop
```

---

## 🌐 Access Your Application

Once running, open: **http://localhost:3000**

---

## ☁️ Deploy to Cloud

Choose your platform and follow the guide in [DOCKER_DEPLOYMENT.md](DOCKER_DEPLOYMENT.md):

| Platform | Best For | Difficulty | Cost |
|----------|----------|------------|------|
| **Railway** | Beginners | ⭐ Easy | Free tier |
| **Fly.io** | Edge deployment | ⭐⭐ Medium | Free tier |
| **DigitalOcean** | Developer-friendly | ⭐⭐ Medium | $5/month |
| **Google Cloud Run** | Auto-scaling | ⭐⭐ Medium | Pay per use |
| **AWS ECS** | Enterprise | ⭐⭐⭐ Advanced | Variable |
| **Azure ACI** | Microsoft ecosystem | ⭐⭐ Medium | Pay per use |

---

## 🔧 Useful Commands

### Docker Compose
```powershell
docker-compose up -d          # Start in background
docker-compose logs -f        # View logs
docker-compose restart        # Restart
docker-compose down           # Stop and remove
docker-compose ps             # Show status
```

### Docker CLI
```powershell
docker ps                     # Show running containers
docker logs -f sparkyui       # View logs
docker exec -it sparkyui sh   # Access container shell
docker stop sparkyui          # Stop container
docker start sparkyui         # Start container
docker rm sparkyui            # Remove container
docker images                 # List images
```

### NPM Scripts
```powershell
pnpm run docker:build         # Build image
pnpm run docker:run           # Run container
pnpm run docker:stop          # Stop & remove
pnpm run docker:logs          # View logs
pnpm run docker:compose:up    # Start with compose
pnpm run docker:compose:down  # Stop compose
pnpm run docker:compose:logs  # Compose logs
```

---

## 🐛 Troubleshooting

### Docker not found
Install Docker Desktop and ensure it's running

### Port 3000 already in use
```powershell
# Use different port
docker run -d --name sparkyui -p 3001:3000 --env-file .env.local sparkyui:latest
```

### Build fails
```powershell
# Clean and rebuild
docker builder prune -a
pnpm run docker:build
```

### Container exits immediately
```powershell
# Check logs for errors
docker logs sparkyui
```

### Environment variables not working
- Ensure `.env.local` exists with correct values
- Check that variables are prefixed with `NEXT_PUBLIC_` for client-side

---

## 📚 Additional Resources

- [DOCKER_DEPLOYMENT.md](DOCKER_DEPLOYMENT.md) - Detailed cloud deployment guides
- [NETLIFY_DEPLOYMENT.md](NETLIFY_DEPLOYMENT.md) - Netlify deployment
- [.env.example](.env.example) - Required environment variables

---

## 🎉 Next Steps

1. ✅ Install Docker Desktop
2. ✅ Configure `.env.local` with your LiveKit credentials
3. ✅ Run `.\build-deploy.ps1` to build and deploy
4. ✅ Access your app at http://localhost:3000
5. ✅ Deploy to cloud using guides in DOCKER_DEPLOYMENT.md

**Ready to go? Run:** `.\build-deploy.ps1`
