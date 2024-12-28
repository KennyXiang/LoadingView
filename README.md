# LoadingView

A SwiftUI loading screen with a smooth fade-in animation for each character of an inspirational quote, designed for iOS applications.

## Features
- Displays a random inspirational quote in a vertical arrangement.
- Animates each character with a sequential fade-in effect, creating a visually appealing loading experience.
- Dynamically adapts to the system's color scheme (light or dark mode).
- Automatically transitions to the main content view after a short loading period.

## Preview
The loading screen will show a vertically arranged quote, with each character fading in one by one, providing a dynamic and elegant loading experience.

## Usage
1. Copy the `LoadingView.swift` file into your SwiftUI project.
2. Set `LoadingView()` as the initial view in your app.
3. Customize the quotes array with your own content if desired.

```swift
private let quotes = [
    "Your custom quote 1",
    "Your custom quote 2",
    ...
]