# Build and Deploy Script for SparkTech Voice Agent
# Run this script after installing Docker

Write-Host "🚀 SparkTech Voice Agent - Docker Build & Deploy" -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host ""

# Check if Docker is installed
if (!(Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Docker is not installed!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Docker Desktop from:" -ForegroundColor Yellow
    Write-Host "https://www.docker.com/products/docker-desktop" -ForegroundColor Blue
    Write-Host ""
    exit 1
}

# Check if .env.local exists
if (!(Test-Path ".env.local")) {
    Write-Host "⚠️  Warning: .env.local not found!" -ForegroundColor Yellow
    Write-Host "Creating .env.local from .env.example..." -ForegroundColor Yellow
    
    if (Test-Path ".env.example") {
        Copy-Item ".env.example" ".env.local"
        Write-Host "✅ Created .env.local - Please update with your LiveKit credentials" -ForegroundColor Green
        Write-Host ""
        Write-Host "Edit .env.local and add your:" -ForegroundColor Cyan
        Write-Host "  - LIVEKIT_API_KEY" -ForegroundColor White
        Write-Host "  - LIVEKIT_API_SECRET" -ForegroundColor White
        Write-Host "  - LIVEKIT_URL" -ForegroundColor White
        Write-Host ""
        Read-Host "Press Enter after updating .env.local"
    } else {
        Write-Host "❌ .env.example not found!" -ForegroundColor Red
        exit 1
    }
}

Write-Host "📦 Building Docker image..." -ForegroundColor Cyan
docker build -t sparkyui:latest .

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Docker build failed!" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Docker image built successfully!" -ForegroundColor Green
Write-Host ""

# Ask user what they want to do
Write-Host "What would you like to do next?" -ForegroundColor Cyan
Write-Host "1. Run locally with Docker Compose (recommended)" -ForegroundColor White
Write-Host "2. Run locally with Docker CLI" -ForegroundColor White
Write-Host "3. Push to Docker Hub" -ForegroundColor White
Write-Host "4. Deploy to cloud (show instructions)" -ForegroundColor White
Write-Host "5. Exit" -ForegroundColor White
Write-Host ""

$choice = Read-Host "Enter your choice (1-5)"

switch ($choice) {
    "1" {
        Write-Host ""
        Write-Host "🚀 Starting with Docker Compose..." -ForegroundColor Cyan
        docker-compose up -d
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host ""
            Write-Host "✅ Application is running!" -ForegroundColor Green
            Write-Host "🌐 Open http://localhost:3000 in your browser" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "Useful commands:" -ForegroundColor Yellow
            Write-Host "  View logs:    docker-compose logs -f" -ForegroundColor White
            Write-Host "  Stop app:     docker-compose down" -ForegroundColor White
            Write-Host "  Restart app:  docker-compose restart" -ForegroundColor White
        } else {
            Write-Host "❌ Failed to start application" -ForegroundColor Red
        }
    }
    
    "2" {
        Write-Host ""
        Write-Host "🚀 Starting with Docker CLI..." -ForegroundColor Cyan
        docker run -d --name sparkyui -p 3000:3000 --env-file .env.local sparkyui:latest
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host ""
            Write-Host "✅ Application is running!" -ForegroundColor Green
            Write-Host "🌐 Open http://localhost:3000 in your browser" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "Useful commands:" -ForegroundColor Yellow
            Write-Host "  View logs:     docker logs -f sparkyui" -ForegroundColor White
            Write-Host "  Stop app:      docker stop sparkyui" -ForegroundColor White
            Write-Host "  Remove:        docker rm sparkyui" -ForegroundColor White
        } else {
            Write-Host "❌ Failed to start application" -ForegroundColor Red
        }
    }
    
    "3" {
        Write-Host ""
        $username = Read-Host "Enter your Docker Hub username"
        
        Write-Host "🏷️  Tagging image..." -ForegroundColor Cyan
        docker tag sparkyui:latest "$username/sparkyui:latest"
        
        Write-Host "🔐 Logging in to Docker Hub..." -ForegroundColor Cyan
        docker login
        
        Write-Host "📤 Pushing to Docker Hub..." -ForegroundColor Cyan
        docker push "$username/sparkyui:latest"
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host ""
            Write-Host "✅ Successfully pushed to Docker Hub!" -ForegroundColor Green
            Write-Host "Image: $username/sparkyui:latest" -ForegroundColor Cyan
        } else {
            Write-Host "❌ Failed to push to Docker Hub" -ForegroundColor Red
        }
    }
    
    "4" {
        Write-Host ""
        Write-Host "☁️  Cloud Deployment Options:" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "Detailed instructions available in DOCKER_DEPLOYMENT.md" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "Quick options:" -ForegroundColor Cyan
        Write-Host "  • AWS ECS/Fargate - Enterprise-grade, scalable" -ForegroundColor White
        Write-Host "  • Google Cloud Run - Serverless, auto-scaling" -ForegroundColor White
        Write-Host "  • Azure Container Instances - Simple, fast deployment" -ForegroundColor White
        Write-Host "  • DigitalOcean App Platform - Developer-friendly" -ForegroundColor White
        Write-Host "  • Fly.io - Edge deployment, global CDN" -ForegroundColor White
        Write-Host "  • Railway - GitHub integration, automatic deploys" -ForegroundColor White
        Write-Host ""
        Write-Host "See DOCKER_DEPLOYMENT.md for step-by-step guides" -ForegroundColor Green
    }
    
    "5" {
        Write-Host ""
        Write-Host "👋 Goodbye!" -ForegroundColor Cyan
    }
    
    default {
        Write-Host ""
        Write-Host "Invalid choice. Run the script again." -ForegroundColor Red
    }
}

Write-Host ""
