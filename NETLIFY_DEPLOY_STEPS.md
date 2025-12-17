# Step-by-Step Netlify Deployment Guide

## ✅ Step 1: Git Committed Successfully!

Your code has been committed locally with 83 files.

---

## 📋 Step 2: Create GitHub Repository & Push Code

### A. Create GitHub Repository

1. **Go to:** https://github.com/new
2. **Repository name:** `sparkyai-voice-agent` (or your preferred name)
3. **Visibility:** Public or Private (your choice)
4. **DO NOT check:** "Add a README file" (we already have one)
5. Click **"Create repository"**

### B. Push Code to GitHub

After creating the repository, run these commands:

```powershell
# Add GitHub as remote (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/sparkyai-voice-agent.git

# Push your code
git branch -M main
git push -u origin main
```

**Example:**
```powershell
git remote add origin https://github.com/johndoe/sparkyai-voice-agent.git
git branch -M main
git push -u origin main
```

---

## 📋 Step 3: Deploy to Netlify

### Option A: Via Netlify Dashboard (Recommended - No Windows Issues!)

1. **Go to:** https://app.netlify.com
2. Click **"Add new site"** → **"Import an existing project"**
3. Click **"Deploy with GitHub"**
4. Authorize Netlify to access your GitHub account
5. Select your repository: `sparkyai-voice-agent`
6. **Build settings are auto-detected** from `netlify.toml`
   - Build command: `pnpm build`
   - Publish directory: `.next`
7. Click **"Deploy site"**

### Step 4: Configure Environment Variables

**CRITICAL:** Add these in Netlify before your app will work:

1. In Netlify dashboard, go to **Site Settings → Environment Variables**
2. Click **"Add a variable"** and add:

```
LIVEKIT_API_KEY = your_livekit_api_key_here
LIVEKIT_API_SECRET = your_livekit_api_secret_here
LIVEKIT_URL = wss://your-project.livekit.cloud
NEXT_PUBLIC_LIVEKIT_URL = wss://your-project.livekit.cloud
```

3. Click **"Save"**
4. Go to **Deploys** and click **"Trigger deploy"** → **"Deploy site"**

---

## ✅ Step 5: Verify Deployment

1. Once deployed, Netlify gives you a URL like: `https://random-name-123456.netlify.app`
2. Click the URL to open your app
3. Test the voice agent functionality

---

## 🎨 Step 6: Custom Domain (Optional)

1. In Netlify: **Site Settings → Domain Management**
2. Click **"Add custom domain"**
3. Follow DNS configuration instructions

---

## 🔄 Continuous Deployment

Now every time you push to GitHub:
```powershell
git add .
git commit -m "Update feature"
git push
```

Netlify will automatically rebuild and deploy! 🎉

---

## 🐛 Troubleshooting

### Build fails on Netlify
- Check build logs in Netlify dashboard
- Verify environment variables are set correctly
- Ensure `netlify.toml` is in repository root

### App loads but doesn't connect
- Verify `LIVEKIT_URL` and `NEXT_PUBLIC_LIVEKIT_URL` are identical
- Check LiveKit API keys are valid
- Ensure variables are prefixed with `NEXT_PUBLIC_` for client-side

### Need to update dependencies
```powershell
pnpm update
git add .
git commit -m "Update dependencies"
git push
```

---

## 📚 Quick Reference

| Action | Command |
|--------|---------|
| Check status | `git status` |
| Commit changes | `git add . && git commit -m "message"` |
| Push to GitHub | `git push` |
| View Netlify logs | Check Netlify dashboard |
| Rebuild | Netlify dashboard → Trigger deploy |

---

## 🎉 You're All Set!

Your deployment workflow:
1. ✅ Make code changes locally
2. ✅ Test with `npm run dev`
3. ✅ Commit: `git add . && git commit -m "message"`
4. ✅ Push: `git push`
5. ✅ Netlify auto-deploys!

**Need help?** Check the full guides:
- [NETLIFY_DEPLOYMENT.md](NETLIFY_DEPLOYMENT.md) - Detailed Netlify guide
- [DOCKER_DEPLOYMENT.md](DOCKER_DEPLOYMENT.md) - Docker deployment options
- [QUICKSTART.md](QUICKSTART.md) - Quick reference
