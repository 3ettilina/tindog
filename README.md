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
  - Size
  - Interests
  - Description
- Discover page that shows swippable Dog card to like/dislike
- Dog matching feature

## Nice features to add
- Dog Details View that displays more info of the Dog card
- Dog Profile View + Edit
- Filter Discover Dog's by km round (location) + a special interest


## Setup

### Very Good CLI
This project has several packages to isolate functionalities and external packages, that's why we rely on (very_good_cli)[https://cli.vgv.dev/docs/overview] to fetch all dependencies all at once.

Setup very_good_cli using the following command on your Terminal/Shell

```bash
$ dart pub global activate very_good_cli
```

Once inside the root of the project you can get all dependencies by executing:

```bash
$ very_good packages get -r
```

### Firebase Setup
Firebase is mostly isolated inside packages (`auth_service` and `tindog_data_source`),
but still we're initializing the app inside the main function of our project:

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const TinDogApp());
}
```

To be able to connect TinDog to a Firebase project, simply follow the few steps indicated in the (Official Firebase Website)[https://firebase.google.com/docs/flutter/setup?platform=ios] as follows:

>> Note, the following 2 steps can be done in any path inside the Terminal/Shell

// Authenticate into Firebase to be able to get or create new project
```bash
$ firebase login
```

// Activate the flutterfire_cli plugin to be able to easily setup the project
```bash
$ dart pub global activate flutterfire_cli
```

>> If your not in the root of your project, open a Terminal/Shell inside it 

// The following command will guide you to using an existent project associated to your
// Firebase user (the one you signed in with), or create a new project from scratch.
```bash
your-flutter-project $ flutterfire configure
```

That's all you need to get connected into Firebase!

To setup the logic within the Firebase backend for this particular project, please head over to 
@tpiaggio repository: https://github.com/tpiaggio/tindog-backend.