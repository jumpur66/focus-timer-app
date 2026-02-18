import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../design.dart';
import '../providers/settings_provider.dart';
import '../providers/audio_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<TimerSettings>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Design.lightText),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
            fontFamily: "Knewave",
            color: Design.lightText,
            fontSize: 24,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: Design.focusGradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionHeader("Timer Configuration"),
                const SizedBox(height: 20),

                // Work Duration Setting
                _buildGlassContainer(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Focus Duration",
                            style: TextStyle(
                              color: Design.lightText,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "${settings.focusDuration ~/ 60} min",
                            style: const TextStyle(
                              color: Design.accent,
                              fontFamily: "Knewave",
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Design.accent,
                          inactiveTrackColor: Colors.white24,
                          thumbColor: Colors.white,
                          overlayColor: Design.accent.withOpacity(0.2),
                          trackHeight: 4,
                        ),
                        child: Slider(
                          value: (settings.focusDuration ~/ 60).toDouble(),
                          min: 5,
                          max: 60,
                          divisions: 11,
                          label: "${settings.focusDuration ~/ 60} min",
                          onChanged: (value) {
                            context.read<TimerSettings>().setFocusDuration(
                              value.toInt(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Chill Duration Setting
                _buildGlassContainer(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Chill Duration",
                            style: TextStyle(
                              color: Design.lightText,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "${settings.chillDuration ~/ 60} min",
                            style: const TextStyle(
                              color: Design.accent,
                              fontFamily: "Knewave",
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Design.secondary,
                          inactiveTrackColor: Colors.white24,
                          thumbColor: Colors.white,
                          trackHeight: 4,
                        ),
                        child: Slider(
                          value: (settings.chillDuration ~/ 60).toDouble(),
                          min: 1,
                          max: 30,
                          divisions: 29,
                          label: "${settings.chillDuration ~/ 60} min",
                          onChanged: (value) {
                            context.read<TimerSettings>().setChillDuration(
                              value.toInt(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
                _buildSectionHeader("Sound & Vibes"),
                const SizedBox(height: 20),

                // Music Toggle
                _buildGlassContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Background Lo-Fi",
                            style: TextStyle(
                              color: Design.lightText,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Chill beats to focus/relax to",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Switch(
                        value: settings.isBackgroundMusicEnabled,
                        onChanged: (value) {
                          context.read<TimerSettings>().toggleBackgroundMusic(
                            value,
                          );
                          if (!value) {
                            context.read<AudioProvider>().stopMusic();
                          }
                        },
                        activeColor: Design.accent,
                        activeTrackColor: Design.accent.withOpacity(0.4),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Volume Setting
                if (settings.isBackgroundMusicEnabled)
                  _buildGlassContainer(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Music Volume",
                              style: TextStyle(
                                color: Design.lightText,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "${(settings.volume * 100).toInt()}%",
                              style: const TextStyle(
                                color: Design.accent,
                                fontFamily: "Knewave",
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Design.accent,
                            inactiveTrackColor: Colors.white24,
                            thumbColor: Colors.white,
                            trackHeight: 4,
                          ),
                          child: Slider(
                            value: settings.volume,
                            min: 0.0,
                            max: 1.0,
                            divisions: 20,
                            onChanged: (value) {
                              context.read<TimerSettings>().setVolume(value);
                              context.read<AudioProvider>().setVolume(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Design.lightText.withOpacity(0.8),
        fontSize: 14,
        letterSpacing: 1.5,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildGlassContainer({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
