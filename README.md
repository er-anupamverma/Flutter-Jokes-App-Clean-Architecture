# jokes_app_clean_architecture

This is a sample project using Clean Architecture & Bloc. 

# Functionality

- I have used the jokes API and displayed it on Home Screen.
- Every minute takes a joke from an open API (https://geek-jokes.sameerkumar.website/api?format=json)
- Adding it (the joke) at the end of the list
- Maximum of 10 jokes on the list
- The new jokes replace old ones
- When you open the app again, all old jokes should be displayed (for storing I have used Shared Preference here because I want to show only 10 jokes at a time. Otherwise for large set of data we should go with local Database storage)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
