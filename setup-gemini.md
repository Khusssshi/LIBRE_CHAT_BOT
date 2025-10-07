# LibreChat with Gemini Setup Guide

This guide will help you set up LibreChat with Google's Gemini AI models.

## Prerequisites

1. **Node.js** (v18 or higher)
2. **MongoDB** (local or cloud instance)
3. **Google AI API Key** (for Gemini)

## Step 1: Get Your Gemini API Key

1. Go to [Google AI Studio](https://aistudio.google.com/app/apikey)
2. Sign in with your Google account
3. Create a new API key
4. Copy the key for later use

## Step 2: Install Dependencies

```bash
# Install all dependencies
npm install

# Or if you prefer using bun (faster)
bun install
```

## Step 3: Configure Environment Variables

Create a `.env` file in the root directory with the following content:

```env
# Database Configuration
MONGO_URI=mongodb://localhost:27017/LibreChat
DB_CONNECTION_STRING=mongodb://localhost:27017/LibreChat

# Google/Gemini Configuration
GOOGLE_KEY=your_gemini_api_key_here

# Server Configuration
HOST=localhost
PORT=3080
DOMAIN_CLIENT=http://localhost:3080
DOMAIN_SERVER=http://localhost:3080

# Security (generate secure random strings)
JWT_SECRET=your_jwt_secret_here
JWT_REFRESH_SECRET=your_jwt_refresh_secret_here
JWT_EXPIRES_IN=7d
JWT_REFRESH_EXPIRES_IN=30d
```

## Step 4: Start MongoDB

Make sure MongoDB is running on your system:

```bash
# On macOS with Homebrew
brew services start mongodb-community

# On Ubuntu/Debian
sudo systemctl start mongod

# On Windows
net start MongoDB
```

## Step 5: Start LibreChat

### Development Mode (Recommended for testing)

```bash
# Start the backend
npm run backend:dev

# In another terminal, start the frontend
npm run frontend:dev
```

### Production Mode

```bash
# Build everything
npm run frontend

# Start the production server
npm run backend
```

## Step 6: Access LibreChat

1. Open your browser and go to `http://localhost:3080`
2. Create an account or log in
3. In the model selection, you should see Google/Gemini models available

## Available Gemini Models

LibreChat supports the following Gemini models:

### Gemini 2.5 Models
- `gemini-2.5-pro`
- `gemini-2.5-flash`
- `gemini-2.5-flash-lite`

### Gemini 2.0 Models
- `gemini-2.0-flash`
- `gemini-2.0-flash-exp`
- `gemini-2.0-flash-lite`
- `gemini-2.0-pro-exp-02-05`

### Latest Aliases
- `gemini-flash-latest`
- `gemini-flash-lite-latest`
- `gemini-pro-latest`

## Advanced Configuration

### Using Vertex AI (Google Cloud)

If you want to use Google Cloud's Vertex AI instead of the direct Gemini API:

1. Set up a Google Cloud Project
2. Enable the Vertex AI API
3. Create a service account and download the JSON key
4. Set these environment variables:

```env
GOOGLE_SERVICE_KEY_FILE=./data/auth.json
GOOGLE_PROJECT_ID=your_project_id
GOOGLE_LOC=us-central1
```

### Custom Configuration

You can customize the Gemini integration by modifying the `librechat.yaml` file:

```yaml
endpoints:
  google:
    # Custom model parameters
    model_parameters:
      temperature: 0.7
      topP: 0.9
      topK: 40
      maxOutputTokens: 1024
    
    # Enable thinking mode for supported models
    thinking: true
    thinkingBudget: 1000
```

## Troubleshooting

### Common Issues

1. **"Provider google not supported" error**
   - Make sure `GOOGLE_KEY` is set in your `.env` file
   - Restart the server after setting the environment variable

2. **Database connection issues**
   - Ensure MongoDB is running
   - Check the `MONGO_URI` in your `.env` file

3. **API key issues**
   - Verify your Gemini API key is correct
   - Check if you have sufficient quota in Google AI Studio

### Logs

Check the server logs for detailed error messages:

```bash
# View logs in development
npm run backend:dev

# Check specific log files in production
tail -f logs/error.log
```

## Features Available

With Gemini integration, you get:

- ✅ **Text Generation**: All Gemini models for chat
- ✅ **Vision Support**: Image analysis with Gemini Pro Vision
- ✅ **Code Generation**: Excellent code writing capabilities
- ✅ **Multilingual**: Support for multiple languages
- ✅ **Streaming**: Real-time response streaming
- ✅ **Context Management**: Long conversation memory
- ✅ **File Uploads**: Support for various file types

## Next Steps

1. **Test the basic chat functionality**
2. **Try different Gemini models** to see which works best for your use case
3. **Configure additional features** like file uploads, agents, or custom endpoints
4. **Set up production deployment** if needed

## Support

- [LibreChat Documentation](https://www.librechat.ai/docs)
- [Google AI Studio](https://aistudio.google.com/)
- [GitHub Issues](https://github.com/danny-avila/LibreChat/issues)

Happy chatting with Gemini! 🚀
