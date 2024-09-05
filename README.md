# GIF Countdown List Application

This Flutter application displays a list of 1000 GIFs, each accompanied by a countdown timer. The app is designed with performance optimizations in mind to ensure smooth scrolling and minimal unnecessary UI rebuilds. It implements the **EventBus** pattern for communication between different parts of the app, allowing efficient and decoupled subscription to countdown events for visible items. When GIFs go off-screen, they automatically unsubscribe from the countdown event to conserve resources.

## Features

- **1000 GIFs List**: A list of 1000 GIFs, each item containing an animated GIF and a countdown timer.
- **Performance Optimized**: Efficient rendering and scrolling of the large list by using lazy loading, caching, and optimized rebuilds.
- **EventBus**: Custom EventBus implementation to handle the countdown events, ensuring that only visible list items subscribe to the countdown.
- **Custom Subscriptions**: Each visible GIF item subscribes to the countdown event and unsubscribes when it goes off-screen, reducing overhead and avoiding unnecessary rebuilds.
- **Clean Architecture**: The app follows Clean Architecture principles, with separation between Data, Domain, and Presentation layers.

## Project Structure

The app is organized into three layers, following Clean Architecture principles:

1. **Data Layer**: Responsible for fetching GIF URIs (simulated in this case).
2. **Domain Layer**: Contains business logic, such as the use case for fetching the list of GIF URIs.
3. **Presentation Layer**: Handles UI and state management, including the `GifListController` and `CountdownController`.

## Performance Handling

Handling a large list of dynamic items such as GIFs and countdown timers requires careful consideration of performance. Here’s how performance is optimized:

1. **Lazy Loading**: The list uses `ListView.builder()`, which ensures that only visible items are built and rendered. As the user scrolls, items are loaded and unloaded based on their visibility.
   
2. **Caching GIFs**: We use `CachedNetworkImage` to cache GIFs and avoid re-fetching them every time the user scrolls back to the item.

3. **Avoiding Unnecessary Rebuilds**: 
    - Each GIF list item only rebuilds when it receives an update via the `EventBus`. This prevents the entire list from rebuilding with every countdown tick.
    - Subscriptions to the countdown events are managed on an individual item basis. Only items visible on the screen subscribe to the countdown events.

4. **Resource Management**: 
    - Each GIF item subscribes to countdown events when it becomes visible and unsubscribes when it is scrolled off the screen, freeing up resources and avoiding unnecessary event handling.

### Key Code for Performance Handling

```dart
// Subscribing to Countdown Event in GifListItem
void _subscribeToCountdown() {
  // Subscribe to the countdown events for this specific item
  _subscription = EventBus().on<CountdownEvent>().listen((event) {
    if (event.index == widget.index) {
      setState(() {
        _remainingTime = event.remainingTime;
      });
    }
  });
}

// Unsubscribing from Countdown Event when off-screen
void _unsubscribeFromCountdown() {
  // Unsubscribe when the widget is disposed
  _subscription.cancel();
}
```

This ensures that only visible items receive countdown updates, improving performance and reducing the load on the application.

## EventBus

The `EventBus` pattern is used to facilitate communication between different parts of the app without direct dependencies. In this app, the `EventBus` allows each GIF item to subscribe to countdown events and only update when it receives relevant data.

### EventBus Setup

```dart
class EventBus {
  EventBus._internal();
  static final EventBus _instance = EventBus._internal();
  factory EventBus() => _instance;

  final _eventBus = StreamController.broadcast();

  Stream<T> on<T>() => _eventBus.stream.where((event) => event is T).cast<T>();

  void publish(event) {
    _eventBus.add(event);
  }
}
```

The `EventBus` allows publishing and subscribing to specific events, such as the `CountdownEvent`, ensuring decoupled communication between UI components and event publishers.

### Countdown Subscription & Unsubscription

Each `GifListItem` subscribes to the `CountdownEvent` via the `EventBus` when it becomes visible. The event provides the remaining countdown time, and the GIF item updates its UI accordingly. When the item is scrolled off-screen, it unsubscribes from the event to prevent unnecessary updates.

### Countdown Event Publisher

The `CountdownController` manages a background timer that periodically publishes countdown events to the `EventBus`. This timer simulates the countdown for all items in the list.

```dart
class CountdownController extends GetxController {
  Timer? _timer;
  int countdownValue = 60;

  @override
  void onInit() {
    super.onInit();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      countdownValue--;

      for (int i = 0; i < 1000; i++) {
        EventBus().publish(CountdownEvent(i, countdownValue));
      }

      if (countdownValue == 0) {
        timer.cancel();
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
```

## Custom Subscribing

The `GifListItem` subscribes to countdown events for its specific index and listens for updates. Once scrolled out of view, the item unsubscribes to free up resources. This ensures that only visible items consume resources, leading to better performance for large lists.

```dart
@override
void initState() {
  super.initState();
  _subscribeToCountdown(); // Subscribe to the event when the item is initialized
}

@override
void dispose() {
  _unsubscribeFromCountdown(); // Unsubscribe from the event when the item is disposed
  super.dispose();
}
```

## GetX for State Management

The application uses **GetX** for state management, dependency injection, and controller handling. This simplifies the overall structure and makes it easy to manage complex application states.

### Example: GifListController

```dart
class GifListController extends GetxController {
  final GetGifUris getGifUris;
  var gifUris = <String>[].obs;

  GifListController(this.getGifUris);

  @override
  void onInit() {
    super.onInit();
    fetchGifs();
  }

  void fetchGifs() async {
    final uris = await getGifUris.execute();
    gifUris.value = uris;
  }
}
```

## Running the App

1. Clone the repository.
2. Install the necessary dependencies:

   ```bash
   flutter pub get
   ```

3. Run the application:

   ```bash
   flutter run
   ```

## Conclusion

This application demonstrates how to efficiently handle a large list of dynamic items in Flutter using performance optimization techniques such as lazy loading, `EventBus` for decoupled communication, and GetX for state management. By managing subscriptions based on item visibility and minimizing unnecessary rebuilds, we ensure smooth scrolling and a fluid user experience, even with a large dataset like 1000 GIFs.