# TinDog

A Tinder-based app for Dogs on where to find the perfect match for playing, walking, breeding, etc.

This application was built for FlutterCon Berlin 2024 by @3ettilina 🐦,
and @tpiaggio on the server side 🔥.

## Tools

The app uses Flutter as the UI framework and runs on mobile (Android or iOS).
It stores the data in Firestore no-SQL database and uses the new Gemini AI SDK 
from Firebase to add suggestions on some features described below.
For registration and authentication it uses Firebase Auth, which ensures
credentials are stored in a safety way.

## Features
- Registration/Authentication (required)
- Dog Info Setup (required at onboarding - only 1 dog by now)
  - Name
  - Breed
  - Age
  - Interests
  - Qualities
- Dog Profile View + Edit
- Discover page that shows swippable Dog card to like/dislike
  - Dog Details View that displays more info of the Dog card
- Dog matching feature
- (desired) Feed Dog's filter by km round (location) + a special interest

