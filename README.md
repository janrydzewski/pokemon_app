# Pokemon App

Flutter-based Pokedex application using PokeAPI with offline caching.

## Features

- Paginated Pokemon list
- Type-based filtering
- Detailed Pokemon stats and images
- Offline support with local caching

## Tech Stack

- **Flutter** - Cross-platform framework
- **BLoC** - State management
- **Dio** - HTTP client with caching
- **Hive** - Local NoSQL database
- **Freezed** - Immutable models
- **GoRouter** - Navigation
- **GetIt** - Dependency injection
- **Cached Network Image** - Image caching

## Setup

```bash
flutter pub get
flutter run
```

## Architecture

Data flows from PokeAPI through Dio HTTP client to Hive cache, managed by BLoC state management with repository pattern for data abstraction.
