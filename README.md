# Focus Time ⏱️

A minimalist and aesthetic Pomodoro-style timer app built with Flutter. Focus Time helps you stay productive by alternating between work sessions and rest periods with a playful, high-contrast UI.

## Features

- **Dynamic Timer**: Easily switch between focus and rest modes.
- **Background Lo-Fi**: Beautiful Lo-Fi playlists that change based on your mode (Work vs. Chill).
- **Customizable Settings**: Adjust focus/chill durations and music volume through a sleek settings page.
- **Persistence**: Your preferences are saved automatically using local storage.
- **Visual Feedback**: The background and app bar colors change automatically to reflect your current state (Busy vs. Resting).
- **Audio Notifications**: Plays custom alerts when a session completes.
- **Screen Awake**: Uses Wakelock to keep your screen on while the timer is running.
- **Intuitive Controls**: 
  - **Start**: Begin your focus session.
  - **Pause/Resume**: Toggle your timer without losing progress.
  - **Reset**: Return the timer to its default state.
- **Themed Typography**: Features the bold and stylish *Knewave* font for a unique look.

## Technologies Used

- **Flutter**: Cross-platform UI framework.
- **Provider**: For robust state management.
- **Audioplayers**: For background music and notification sounds.
- **Shared Preferences**: For persistent settings.
- **Wakelock Plus**: To keep the screen active.

## Project Structure

- `lib/main.dart`: Entry point and provider initialization.
- `lib/pages/`: Contains the Timer and Settings screens.
- `lib/providers/`: State management for Timer settings and Audio.
- `assets/sounds/`: Playlists for work and chill modes.

## Setup and Installation

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```


## License
This project is restricted to **Personal and Collaborative Use only**. Commercial use is strictly prohibited. See the [LICENSE](LICENSE) file for details.
