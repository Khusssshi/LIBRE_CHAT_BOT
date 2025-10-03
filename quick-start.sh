#!/bin/bash

# LibreChat with Gemini Quick Start Script
echo "🚀 Starting LibreChat with Gemini setup..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js v18 or higher."
    echo "   Visit: https://nodejs.org/"
    exit 1
fi

# Check Node.js version
NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo "❌ Node.js version $NODE_VERSION is too old. Please install Node.js v18 or higher."
    exit 1
fi

echo "✅ Node.js version: $(node -v)"

# Check if MongoDB is running
if ! command -v mongod &> /dev/null; then
    echo "⚠️  MongoDB is not installed. Please install MongoDB:"
    echo "   macOS: brew install mongodb-community"
    echo "   Ubuntu: sudo apt-get install mongodb"
    echo "   Windows: Download from https://www.mongodb.com/try/download/community"
    echo ""
    echo "   Or use MongoDB Atlas (cloud): https://www.mongodb.com/atlas"
    echo ""
    read -p "Do you want to continue without MongoDB? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Install dependencies
echo "📦 Installing dependencies..."
npm install

if [ $? -ne 0 ]; then
    echo "❌ Failed to install dependencies. Please check the error messages above."
    exit 1
fi

echo "✅ Dependencies installed successfully!"

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo "📝 Creating .env file from template..."
    cp env.template .env
    echo "✅ Created .env file. Please edit it with your configuration."
    echo ""
    echo "🔑 IMPORTANT: You need to:"
    echo "   1. Get a Gemini API key from: https://aistudio.google.com/app/apikey"
    echo "   2. Edit .env file and set GOOGLE_KEY=your_api_key_here"
    echo "   3. Set JWT_SECRET and JWT_REFRESH_SECRET to secure random strings"
    echo ""
    echo "📖 For detailed instructions, see: setup-gemini.md"
    echo ""
    read -p "Press Enter to continue after configuring .env file..."
fi

# Check if MongoDB is running
if command -v mongod &> /dev/null; then
    if ! pgrep -x "mongod" > /dev/null; then
        echo "⚠️  MongoDB is not running. Please start MongoDB:"
        echo "   macOS: brew services start mongodb-community"
        echo "   Ubuntu: sudo systemctl start mongod"
        echo "   Windows: net start MongoDB"
        echo ""
        read -p "Press Enter after starting MongoDB..."
    else
        echo "✅ MongoDB is running"
    fi
fi

echo ""
echo "🎉 Setup complete! You can now start LibreChat:"
echo ""
echo "   Development mode:"
echo "   npm run backend:dev    # Terminal 1"
echo "   npm run frontend:dev   # Terminal 2"
echo ""
echo "   Production mode:"
echo "   npm run frontend       # Build frontend"
echo "   npm run backend        # Start server"
echo ""
echo "   Then open: http://localhost:3080"
echo ""
echo "📚 For more information, see: setup-gemini.md"


