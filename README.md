# LoadingView

A Swift start page. Displays a loading screen with a vertically fading animation of a quote, followed by a transition to the main page of your app. 

## Features
- **Dynamic Quotes:** Displays a random motivational quote.
- **Smooth Animation:** Gradual fade-in effect for each character of the quote.
- **Light & Dark Mode Support:** Adapts background and text colors based on the system color scheme.
- **Customizable Transition:** Easily transition to your app's main page after the loading screen.

## Installation
1. Clone or download this repository.
2. Copy the `LoadingView.swift` file into your project.

## Usage

### Basic Setup
To use `LoadingView`, follow these steps:

1. **Integrate into Your App:** Replace the main view of your app with `LoadingView` in the `@main` struct:

```swift
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            LoadingView()
        }
    }
}
```

2. **Customize Transition:** The `LoadingView` transitions to your main page after a delay. Replace `ContentView()` in the following code snippet with your main page:

```swift
DispatchQueue.main.asyncAfter(deadline: .now() + 2.22) {
    if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        let window = scene.windows.first
        window?.rootViewController = UIHostingController(rootView: ContentView()) // Replace `ContentView()` with your main page
        window?.makeKeyAndVisible()
    }
}
```

### Detailed Explanation

- **Purpose of `DispatchQueue.main.asyncAfter`:** This introduces a delay (`2.22` seconds in this example) to simulate loading time, giving the `LoadingView` enough time to display the full quote before transitioning to the main page.

- **Replacing `ContentView()`:** Replace `ContentView()` with the SwiftUI `View` that represents the main screen or entry point of your app.

- **Accessing the `UIWindowScene`:** The `UIApplication.shared.connectedScenes.first as? UIWindowScene` retrieves the current active window. This is required for manually updating the `rootViewController`.

### Light & Dark Mode
`LoadingView` dynamically adjusts its appearance based on the system's color scheme:
- **Dark Mode:** A dark background with white text.
- **Light Mode:** A white background with dark gray text.

### Animation Details
Each character of the quote fades in sequentially with a slight delay, creating a smooth and engaging loading animation. The animation parameters can be customized in the `LoadingView` file.

### Example Use Case
Here’s how it might look when integrated into a simple app:

```swift
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            LoadingView()
        }
    }
}
```

Once the `LoadingView` finishes its animation, the app transitions to your main page (e.g., `HomeView` or `DashboardView`).

## License
This project is licensed under the [MIT License](LICENSE).
