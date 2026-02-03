# Focus Time ⏱️

A minimalist and aesthetic Pomodoro-style timer app built with Flutter. Focus Time helps you stay productive by alternating between work sessions and rest periods with a playful, high-contrast UI.

## Features

- **Dynamic Timer**: Easily switch between focus and rest modes.
- **Visual Feedback**: The background and app bar colors change automatically to reflect your current state (Busy vs. Resting).
- **Audio Notifications**: Plays "cute" custom alerts when a session completes.
- **Intuitive Controls**: 
  - **Start**: Begin your focus session.
  - **Pause/Resume**: Toggle your timer without losing progress.
  - **Reset**: Return the timer to its default state.
- **Themed Typography**: Features the bold and stylish *Knewave* font for a unique look.

## Technologies Used

- **Flutter**: Cross-platform UI framework.
- **Audioplayers**: For high-quality sound notifications.
- **Dart Timer**: Precise periodic updates for the countdown logic.

## Project Structure

- `lib/main.dart`: Contains the core application logic, state management, and UI.
- `assets/sounds/`: Custom MP3 files for session alerts.
- `assets/fonts/`: Font assets including the *Knewave* family.

## Setup and Installation

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Assets**: Ensure your `assets` folder contains the following:
   - `assets/sounds/cute_alarm.mp3`
   - `assets/sounds/cute_anime_ringtone.mp3`
   - `assets/fonts/Knewave/Knewave-Regular.ttf`

4. **Run the app**:
   ```bash
   flutter run
   ```


## License
This project is open-source. Feel free to modify and use it as you wish!
