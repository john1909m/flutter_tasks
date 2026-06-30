import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

import 'ThemeProvider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String baseUrl = "https://newsapi.org/v2/everything";
  static final String _apiKey = "d91304bf66cd45d081a93939bb69d2fd";

  List<String> categories = ["bitcoin", "sport", "technology", "business", "science"];
  String selectedCategory = "bitcoin";
  bool isLoading = true;
  List newsList = [];

  // Color scheme
  final Color primaryColor = const Color(0xFF002493);
  final Color secondaryColor = const Color(0xFF002BB5);
  final Color accentColor = const Color(0xFF5B7BFB);
  final Color backgroundColor = const Color(0xFFF8FAFC);

  // Dark mode colors
  final Color darkPrimaryColor = const Color(0xFF1A1A2E);
  final Color darkBackgroundColor = const Color(0xFF16213E);
  final Color darkCardColor = const Color(0xFF1F2A48);
  final Color darkTextColor = const Color(0xFFE2E8F0);

  Future<void> getData() async {
    setState(() => isLoading = true);

    try {
      var response = await http.get(
        Uri.parse("$baseUrl?q=$selectedCategory&apiKey=$_apiKey"),
      );
      var data = jsonDecode(response.body);

      setState(() {
        newsList = data["articles"] ?? [];
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Failed to load news"),
          backgroundColor: Colors.red.shade400,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? darkBackgroundColor : backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: isDarkMode ? darkPrimaryColor : primaryColor,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.newspaper_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "News",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        actions: [
          
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () async {
                await themeProvider.toggleTheme(!isDarkMode);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  isDarkMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: Colors.white.withOpacity(0.1),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: isDarkMode ? darkCardColor : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: isDarkMode
                      ? Colors.black.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: SizedBox(
              height: 44,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  String category = categories[index];
                  bool isSelected = selectedCategory == category;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                      getData();
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? (isDarkMode ? Colors.blue.shade700 : primaryColor)
                            : (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade100),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: isSelected
                            ? [
                          BoxShadow(
                            color: (isDarkMode ? Colors.blue.shade700 : primaryColor).withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ]
                            : null,
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Icon(
                              _getCategoryIcon(category),
                              color: isSelected
                                  ? Colors.white
                                  : (isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600),
                              size: 16,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              category,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : (isDarkMode ? Colors.grey.shade400 : Colors.grey.shade700),
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                fontSize: 13,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          Expanded(
            child: isLoading
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.network(
                    "https://lottie.host/96a62d1b-5fa2-4cd2-96ba-2be6e24ec7b9/mwLZ8FexWB.lottie",
                    height: 150,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Loading ${selectedCategory.toUpperCase()}...",
                    style: TextStyle(
                      color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
                : newsList.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off_rounded,
                    size: 80,
                    color: isDarkMode ? Colors.grey.shade600 : Colors.grey.shade300,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "No News Found",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.grey.shade300 : Colors.grey.shade700,
                    ),
                  ),
                  Text(
                    "Try selecting a different category",
                    style: TextStyle(
                      fontSize: 14,
                      color: isDarkMode ? Colors.grey.shade500 : Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                var news = newsList[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: GestureDetector(
                    onTap: () async {
                      await launchUrl(Uri.parse(news["url"]));
                    },
                    child: Card(
                      elevation: 0,
                      color: isDarkMode ? darkCardColor : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: isDarkMode
                              ? Colors.grey.shade800
                              : Colors.grey.shade200,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                            child: news["urlToImage"] != null
                                ? Stack(
                              children: [
                                Image.network(
                                  news["urlToImage"],
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Container(
                                      height: 200,
                                      color: isDarkMode
                                          ? Colors.grey.shade900
                                          : Colors.grey.shade100,
                                      child: const Center(
                                        child: SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      height: 200,
                                      color: isDarkMode
                                          ? Colors.grey.shade900
                                          : Colors.grey.shade100,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.broken_image_rounded,
                                            size: 50,
                                            color: isDarkMode
                                                ? Colors.grey.shade600
                                                : Colors.grey.shade400,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            "Image Unavailable",
                                            style: TextStyle(
                                              color: isDarkMode
                                                  ? Colors.grey.shade500
                                                  : Colors.grey.shade500,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                Positioned(
                                  top: 12,
                                  left: 12,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: (isDarkMode
                                          ? Colors.blue.shade700
                                          : primaryColor).withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      selectedCategory.toUpperCase(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                                : Container(
                              height: 200,
                              color: isDarkMode
                                  ? Colors.grey.shade900
                                  : Colors.grey.shade100,
                              child: Center(
                                child: Lottie.network(
                                  "https://lottie.host/c4ba0092-ddce-478e-b08d-b4d0ebdbe2af/Yn5o6VnhvQ.lottie",
                                  height: 100,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  news["title"] ?? "No Title",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    height: 1.3,
                                    color: isDarkMode ? darkTextColor : const Color(0xFF1A1A2E),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  news["description"] ?? "No Description Available",
                                  style: TextStyle(
                                    color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
                                    fontSize: 14,
                                    height: 1.5,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 14),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: (isDarkMode
                                            ? Colors.blue.shade700
                                            : primaryColor).withOpacity(0.08),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(
                                        Icons.public_rounded,
                                        color: isDarkMode ? Colors.blue.shade400 : primaryColor,
                                        size: 16,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            news["source"]?["name"] ?? "Unknown Source",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13,
                                              color: isDarkMode ? Colors.grey.shade300 : Colors.grey.shade800,
                                            ),
                                          ),
                                          if (news["publishedAt"] != null)
                                            Text(
                                              _formatDate(news["publishedAt"]),
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: isDarkMode ? Colors.grey.shade500 : Colors.grey.shade500,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: isDarkMode
                                            ? Colors.grey.shade800
                                            : Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: IconButton(
                                        onPressed: () async {
                                          await SharePlus.instance.share(
                                            ShareParams(
                                              text: news["url"],
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.share_rounded,
                                          color: isDarkMode ? Colors.blue.shade400 : primaryColor,
                                          size: 20,
                                        ),
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(
                                          minWidth: 40,
                                          minHeight: 40,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'bitcoin':
        return Icons.currency_bitcoin_rounded;
      case 'sport':
        return Icons.sports_soccer_rounded;
      case 'technology':
        return Icons.computer_rounded;
      case 'business':
        return Icons.business_center_rounded;
      case 'science':
        return Icons.science_rounded;
      default:
        return Icons.feed_rounded;
    }
  }

  String _formatDate(String? dateString) {
    if (dateString == null) return "";
    try {
      DateTime date = DateTime.parse(dateString);
      return "${date.day}/${date.month}/${date.year}";
    } catch (e) {
      return "";
    }
  }
}