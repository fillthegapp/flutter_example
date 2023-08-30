# Flutter App

In this repository you can find a simple solution with the following features:
* Login Screen
  * First time, user logs in using the following credentials: whatever valid email and a number of 4 digits to get a successful login, otherwise submit button is disabled.
  * Biometric authentication: After a succesful login attempt, user gets a prompt to activate biometric. On boarding flow could be included to explain the user about biometric capabilities.
* Artworks collection Screen
  * Async load of artworks from Rijksmuseum API
  * Integration with native code to send an Amplitude analytic event and print a log when an item is clicked.

 ## Architecture

 This project applies a Bloc architecture, inspired on the same separation of concerns recommended by Google that follows quite close the Android MVVM pattern.

