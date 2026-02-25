# Stock Watchlist App

A Flutter-based mobile application that allows users to search for stocks and add them to a personalized watchlist. The app fetches real-time stock data using the AlphaVantage API and stores selected stocks locally using Hive Database.

🚀 Objective
Build a mobile application with:

Live stock search

Real-time stock price fetching

Local watchlist storage

Clean UI 

API integration with AlphaVantage (Free Tier)

🏗️ Architecture Overview

Frontend: Flutter

State Management:  Provider 

API Integration: AlphaVantage REST API

Local Storage: Hive Database

Networking: http package

Data Format: JSON


Features

1 . Title bar: Home

  Search bar to search stocks

  Dynamic search results

  Real-time stock price display

  “+” button to add stock to Watchlist

2 . Title bar: Watchlist

  Displays saved stocks

  Shows latest share price (fetched from API)

  Delete option to remove stock from local database


Functional Flow

User types stock/company name (e.g., TAT)

API call triggers:

https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=TAT&$apikey

Matching companies populate dynamically

User clicks +

Stock saved locally in Hive

Fetch saved stocks from Hive

For each stock:

Call AlphaVantage API

Display latest price

User can delete stock

Stock removed from Hive


⚙️ Installation & Setup
1️⃣ Clone Repository
git clone https://github.com//stock-watchlist.git
cd stock-watchlist
2️⃣ Install Dependencies
flutter pub get
3️⃣ Add API Key

Create a free API key from:
https://www.alphavantage.co/support/#api-key

Add it inside:
alphavantage_service.dart

const String apiKey = "QUNJQC8PUCTW2VY3";
4️⃣ Run Application
flutter run
🧠 Key Concepts Implemented

REST API Integration

JSON Parsing

Debounced Search

State Management

Local Storage (Hive)

Async Programming (Future & async/await)

ListView Builder

Clean Architecture Separation

⚠️ Limitations

Free AlphaVantage API has rate limits

No real-time streaming (poll-based updates)

No authentication system


👨‍💻 Author

Abhinav S

Flutter Developer

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
