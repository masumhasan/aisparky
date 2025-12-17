# 🎉 Final Deployment Steps - Netlify Dashboard

## ✅ Completed So Far:
- ✅ ESLint errors fixed
- ✅ Code committed to Git
- ✅ GitHub repository created: `https://github.com/masumhasan/aisparky`
- ✅ Code pushed to GitHub successfully

---

## 📋 Step 4: Connect Netlify to GitHub Repository

Your browser should now be open to Netlify. Follow these steps:

### 1. Import Your Project
- Click **"Import from Git"** or **"Add new site"** → **"Import an existing project"**
- Select **"GitHub"**

### 2. Authorize GitHub (if needed)
- If prompted, click **"Authorize Netlify"**
- Grant access to your repositories

### 3. Select Repository
- Find and click on: **`masumhasan/aisparky`**

### 4. Configure Build Settings
Netlify will auto-detect these from your `netlify.toml`:
```
Build command: pnpm build
Publish directory: .next
```
✅ These are correct - **DO NOT CHANGE**

### 5. Click "Deploy"
- Click the **"Deploy [site-name]"** button
- **IMPORTANT:** The first deploy will FAIL - this is expected!
- Why? Because we haven't added environment variables yet

---

## 📋 Step 5: Add Environment Variables

After the initial deploy attempt:

### 1. Go to Site Settings
- In your Netlify site dashboard, click **"Site configuration"** or **"Site settings"**

### 2. Navigate to Environment Variables
- In the left sidebar, click **"Environment variables"**
- OR go to: `https://app.netlify.com/sites/YOUR-SITE-NAME/configuration/env`

### 3. Add Required Variables
Click **"Add a variable"** for each:

#### Required Variables:
```
Variable: LIVEKIT_API_KEY
Value: [Your LiveKit API Key from LiveKit Cloud Dashboard]

Variable: LIVEKIT_API_SECRET
Value: [Your LiveKit API Secret from LiveKit Cloud Dashboard]

Variable: LIVEKIT_URL
Value: wss://your-project-name.livekit.cloud

Variable: NEXT_PUBLIC_LIVEKIT_URL
Value: wss://your-project-name.livekit.cloud
(Must match LIVEKIT_URL)
```

#### Optional Variables (if using LiveKit Sandbox):
```
Variable: NEXT_PUBLIC_APP_CONFIG_ENDPOINT
Value: [Leave blank or add your endpoint]

Variable: SANDBOX_ID
Value: [Your sandbox ID if using LiveKit Sandbox]
```

### 4. Save All Variables
- Click **"Save"** after adding each variable

---

## 📋 Step 6: Trigger New Deploy

### 1. Go to Deploys Tab
- Click **"Deploys"** in the top navigation

### 2. Trigger Deploy
- Click **"Trigger deploy"** dropdown
- Select **"Deploy site"**

### 3. Watch the Build
- The build will take 2-3 minutes
- You can click on the deploy to see live logs
- Look for: ✅ "Site is live"

---

## 🎉 Step 7: Access Your Live Site!

### Once Deploy Completes:
1. You'll see a URL like: `https://random-name-123456.netlify.app`
2. Click the URL to open your live site
3. Test the voice agent by clicking **"Talk To Sparky"**

### Optional: Custom Domain
1. In Site Settings → **"Domain management"**
2. Click **"Add custom domain"**
3. Follow DNS setup instructions

---

## 🔄 Future Deployments (Automatic!)

Now every time you make changes:
```powershell
git add .
git commit -m "Your update message"
git push
```

**Netlify automatically rebuilds and deploys!** 🚀

---

## 📝 Where to Get LiveKit Credentials

### Getting Your LiveKit Keys:
1. Go to: https://cloud.livekit.io/projects
2. Select or create your project
3. Go to **"Settings"** → **"Keys"**
4. Copy your:
   - API Key
   - API Secret
5. Your LiveKit URL is shown at the top: `wss://your-project.livekit.cloud`

---

## 🐛 Troubleshooting

### Build Fails
- Check **"Deploy log"** in Netlify for errors
- Verify `netlify.toml` is in repository root
- Ensure all files are committed and pushed

### Site Loads But Connection Fails
- Verify environment variables are set correctly
- Check that `NEXT_PUBLIC_LIVEKIT_URL` matches `LIVEKIT_URL`
- Ensure LiveKit API keys are valid and not expired

### Changes Not Showing
- Check **"Deploys"** tab - new deploy should trigger automatically
- If not, manually trigger: **"Trigger deploy"** → **"Deploy site"**
- Clear browser cache (Ctrl+Shift+R or Cmd+Shift+R)

---

## 📞 Need Help?

- **Netlify Docs:** https://docs.netlify.com
- **LiveKit Docs:** https://docs.livekit.io
- **Project Guides:**
  - [NETLIFY_DEPLOYMENT.md](NETLIFY_DEPLOYMENT.md)
  - [DOCKER_DEPLOYMENT.md](DOCKER_DEPLOYMENT.md)
  - [QUICKSTART.md](QUICKSTART.md)

---

## ✅ Deployment Checklist

- [x] Fix ESLint errors
- [x] Commit code to Git
- [x] Create GitHub repository
- [x] Push to GitHub
- [ ] Import project to Netlify
- [ ] Add environment variables
- [ ] Trigger successful deploy
- [ ] Test live site
- [ ] (Optional) Add custom domain

**You're almost there! Follow the steps above in the Netlify dashboard.** 🎊
