# Docker Deployment Guide for SparkTech Voice Agent

## Quick Start

### Prerequisites
- Docker installed ([Get Docker](https://docs.docker.com/get-docker/))
- Docker Compose installed (included with Docker Desktop)
- Environment variables configured in `.env.local`

### Build and Run with Docker Compose (Easiest)

```powershell
# Build and start the container
docker-compose up -d

# View logs
docker-compose logs -f

# Stop the container
docker-compose down
```

Your app will be available at: http://localhost:3000

### Build and Run with Docker CLI

```powershell
# Build the image
docker build -t sparkyui:latest .

# Run the container
docker run -d `
  --name sparkyui `
  -p 3000:3000 `
  --env-file .env.local `
  sparkyui:latest

# View logs
docker logs -f sparkyui

# Stop and remove
docker stop sparkyui
docker rm sparkyui
```

## Deployment Options

### 1. Deploy to Docker Hub

```powershell
# Tag your image
docker tag sparkyui:latest yourusername/sparkyui:latest

# Login to Docker Hub
docker login

# Push to Docker Hub
docker push yourusername/sparkyui:latest
```

### 2. Deploy to AWS ECS/Fargate

1. **Create ECR Repository**:
   ```powershell
   aws ecr create-repository --repository-name sparkyui
   ```

2. **Build and push**:
   ```powershell
   # Get login token
   aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin YOUR_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com

   # Tag and push
   docker tag sparkyui:latest YOUR_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/sparkyui:latest
   docker push YOUR_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/sparkyui:latest
   ```

3. **Create ECS Task Definition and Service** via AWS Console or CLI

### 3. Deploy to Google Cloud Run

```powershell
# Build and push to GCR
gcloud builds submit --tag gcr.io/YOUR_PROJECT_ID/sparkyui

# Deploy to Cloud Run
gcloud run deploy sparkyui `
  --image gcr.io/YOUR_PROJECT_ID/sparkyui `
  --platform managed `
  --region us-central1 `
  --allow-unauthenticated `
  --set-env-vars="LIVEKIT_API_KEY=your-key,LIVEKIT_API_SECRET=your-secret,LIVEKIT_URL=your-url,NEXT_PUBLIC_LIVEKIT_URL=your-url"
```

### 4. Deploy to Azure Container Instances

```powershell
# Create container registry
az acr create --resource-group myResourceGroup --name sparkyuiregistry --sku Basic

# Build and push
az acr build --registry sparkyuiregistry --image sparkyui:latest .

# Deploy to ACI
az container create `
  --resource-group myResourceGroup `
  --name sparkyui `
  --image sparkyuiregistry.azurecr.io/sparkyui:latest `
  --dns-name-label sparkyui-app `
  --ports 3000 `
  --environment-variables `
    LIVEKIT_API_KEY=your-key `
    LIVEKIT_API_SECRET=your-secret `
    LIVEKIT_URL=your-url `
    NEXT_PUBLIC_LIVEKIT_URL=your-url
```

### 5. Deploy to DigitalOcean App Platform

1. Push your code to GitHub
2. Go to [DigitalOcean Apps](https://cloud.digitalocean.com/apps)
3. Create new app from GitHub repo
4. Select "Dockerfile" as build method
5. Add environment variables
6. Deploy!

### 6. Deploy to Fly.io

```powershell
# Install flyctl
iwr https://fly.io/install.ps1 -useb | iex

# Login
flyctl auth login

# Launch app
flyctl launch

# Set secrets
flyctl secrets set LIVEKIT_API_KEY=your-key
flyctl secrets set LIVEKIT_API_SECRET=your-secret
flyctl secrets set LIVEKIT_URL=your-url
flyctl secrets set NEXT_PUBLIC_LIVEKIT_URL=your-url

# Deploy
flyctl deploy
```

### 7. Deploy to Railway

1. Go to [Railway.app](https://railway.app)
2. Create new project from GitHub repo
3. Railway auto-detects Dockerfile
4. Add environment variables
5. Deploy!

## Environment Variables

Required environment variables for production:

```env
LIVEKIT_API_KEY=your_livekit_api_key
LIVEKIT_API_SECRET=your_livekit_api_secret
LIVEKIT_URL=wss://your-project.livekit.cloud
NEXT_PUBLIC_LIVEKIT_URL=wss://your-project.livekit.cloud
```

Optional:
```env
NEXT_PUBLIC_APP_CONFIG_ENDPOINT=
SANDBOX_ID=
```

## Production Best Practices

1. **Use secrets management**: Don't hardcode secrets
2. **Enable HTTPS**: Use reverse proxy (nginx, Traefik) or cloud provider SSL
3. **Set resource limits**: Configure CPU/memory limits in production
4. **Health checks**: Endpoint `/` can be used for health checks
5. **Logging**: Use `docker logs` or cloud provider logging
6. **Monitoring**: Set up monitoring with Prometheus/Grafana or cloud tools

## Troubleshooting

### Build fails
```powershell
# Clean Docker cache and rebuild
docker builder prune -a
docker-compose build --no-cache
```

### Container exits immediately
```powershell
# Check logs
docker logs sparkyui

# Run interactively to debug
docker run -it --entrypoint /bin/sh sparkyui:latest
```

### Port already in use
```powershell
# Use different port
docker run -p 3001:3000 sparkyui:latest
```

### Environment variables not working
- Ensure `.env.local` exists with correct variables
- Check `docker-compose.yml` env_file path
- Use `docker exec sparkyui env` to verify env vars

## Docker Image Size Optimization

Current multi-stage build produces ~200MB image. To optimize further:

1. Use alpine base images ✓ (already done)
2. Remove unnecessary dependencies
3. Use `.dockerignore` effectively ✓ (already done)
4. Enable Next.js standalone output ✓ (already done)

## Useful Commands

```powershell
# View running containers
docker ps

# View all containers
docker ps -a

# View images
docker images

# Remove unused images
docker image prune

# View container stats
docker stats sparkyui

# Execute command in container
docker exec -it sparkyui /bin/sh

# Copy files from container
docker cp sparkyui:/app/file.txt ./local-file.txt
```
