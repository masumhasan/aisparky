# Netlify Deployment Guide for SparkTech Voice Agent

## ⚠️ Important: Windows Deployment Note

**If you're on Windows**, deploying via Netlify CLI locally may fail due to symlink permission errors. 

**Recommended Solution:** Deploy via Git (see Option 2 below) - Netlify's cloud build environment handles this correctly.

## Prerequisites
✅ pnpm installed globally (if deploying locally)
✅ Netlify CLI installed (optional)
✅ netlify.toml configuration created
✅ Git repository (for continuous deployment)

## Environment Variables Required

You'll need to set these in Netlify (Settings → Environment Variables):

### LiveKit Configuration
- `LIVEKIT_API_KEY` - Your LiveKit API key
- `LIVEKIT_API_SECRET` - Your LiveKit API secret
- `LIVEKIT_URL` - Your LiveKit server URL (e.g., wss://your-project.livekit.cloud)
- `NEXT_PUBLIC_LIVEKIT_URL` - Same as LIVEKIT_URL (client-side)

### Optional (for LiveKit Cloud Sandbox)
- `NEXT_PUBLIC_SANDBOX_ID` - Your sandbox ID
- `NEXT_PUBLIC_AGENT_NAME` - Your agent name

## Deployment Steps

### Option 1: Deploy via Netlify CLI (Recommended for first-time)

1. **Login to Netlify**
   ```powershell
   & "$env:APPDATA\npm\pnpm.cmd" exec netlify login
   ```

2. **Initialize Netlify site**
   ```powershell
   & "$env:APPDATA\npm\pnpm.cmd" exec netlify init
   ```
   - Choose "Create & configure a new site"
   - Select your team
   - Enter a site name (or leave blank for auto-generated)

3. **Set environment variables**
   ```powershell
   & "$env:APPDATA\npm\pnpm.cmd" exec netlify env:set LIVEKIT_API_KEY "your-key"
   & "$env:APPDATA\npm\pnpm.cmd" exec netlify env:set LIVEKIT_API_SECRET "your-secret"
   & "$env:APPDATA\npm\pnpm.cmd" exec netlify env:set LIVEKIT_URL "your-url"
   & "$env:APPDATA\npm\pnpm.cmd" exec netlify env:set NEXT_PUBLIC_LIVEKIT_URL "your-url"
   ```

4. **Deploy**
   ```powershell
   & "$env:APPDATA\npm\pnpm.cmd" exec netlify deploy --prod
   ```

### Option 2: Deploy via Git (Continuous Deployment)

1. **Push to GitHub/GitLab/Bitbucket**
   ```powershell
   git add .
   git commit -m "Add Netlify configuration"
   git push
   ```

2. **Connect to Netlify**
   - Go to https://app.netlify.com
   - Click "Add new site" → "Import an existing project"
   - Connect your Git provider
   - Select your repository
   - Build settings are auto-detected from netlify.toml

3. **Set environment variables in Netlify UI**
   - Go to Site Settings → Environment Variables
   - Add all required variables

4. **Deploy**
   - Netlify will automatically build and deploy
   - Future commits will trigger automatic deployments

## Post-Deployment

1. **Verify deployment**
   - Check the deployment URL provided by Netlify
   - Test the voice agent functionality

2. **Set up custom domain (optional)**
   - In Netlify: Site Settings → Domain Management
   - Add your custom domain
   - Update DNS records as instructed

## Troubleshooting

- **Build fails**: Check build logs in Netlify UI
- **Environment variables not working**: Ensure they're set in Netlify and prefixed with `NEXT_PUBLIC_` for client-side access
- **API routes failing**: Verify serverless function region matches your LiveKit region

## Useful Commands

- Check deployment status: `pnpm exec netlify status`
- View site info: `pnpm exec netlify sites:list`
- Open site in browser: `pnpm exec netlify open`
- View logs: `pnpm exec netlify logs`
