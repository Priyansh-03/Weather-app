import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/widgets/weather_card.dart';
import '../modules/weather_module.dart';
import '../services/weather_services.dart';
import '../main.dart'; // to access themeNotifier

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherServices _weatherServices = WeatherServices();
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;
  Weather? _weather;

  List<String> _recentCities = [];

  @override
  void initState() {
    super.initState();
    _loadRecentCities();
  }

  Future<void> _saveRecentCity(String city) async {
    final prefs = await SharedPreferences.getInstance();
    if (!_recentCities.contains(city)) {
      _recentCities.insert(0, city);
      await prefs.setStringList('recentCities', _recentCities);
    }
  }

  Future<void> _loadRecentCities() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _recentCities = prefs.getStringList('recentCities') ?? [];
    });
  }

  Future<void> _getWeather([String? forcedCity]) async {
    String city = forcedCity ?? _controller.text;
    if (city.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final weather = await _weatherServices.fetchWeather(city);
      await _saveRecentCity(city);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error fetching Weather data")),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _toggleTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    themeNotifier.value = isDark ? ThemeMode.dark : ThemeMode.light;
    await prefs.setString('themeMode', isDark ? 'dark' : 'light');
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: RefreshIndicator(
          onRefresh: () => _getWeather(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 36),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        isDark ? Icons.dark_mode : Icons.light_mode,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Switch(
                        value: isDark,
                        onChanged: _toggleTheme,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Weather App",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _controller,
                    autofocus: true,
                    style: TextStyle(color: Theme.of(context).primaryColorLight),
                    decoration: InputDecoration(
                      hintText: "Enter city name",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      filled: true,
                      fillColor: isDark ? Colors.white12 : Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          setState(() {
                            _weather = null;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _getWeather,
                    child: const Text("Get Weather"),
                  ),
                  const SizedBox(height: 10),
                  if (_recentCities.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Recent Cities:", style: TextStyle(fontWeight: FontWeight.bold)),
                        Wrap(
                          spacing: 8,
                          children: _recentCities.take(5).map((city) {
                            return ActionChip(
                              label: Text(city),
                              onPressed: () {
                                _controller.text = city;
                                _getWeather(city);
                              },
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  if (_isLoading)
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: CircularProgressIndicator(),
                    ),
                  if (_weather != null) WeatherCard(weather: _weather!),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
