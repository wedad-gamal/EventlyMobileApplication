import 'package:evently_app/core/l10n/app_localizations.dart';
import 'package:evently_app/core/provider/app_config_provider.dart';
import 'package:evently_app/core/utilites/shared_preferences_keys.dart';
import 'package:evently_app/data/models/onboardingPage.dart';
import 'package:evently_app/ui/login/login_screen.dart';
import 'package:evently_app/ui/widgets/auth_wrapper.dart';
import 'package:evently_app/ui/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = "/onboarding";
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _goToPreviousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _navigateToAppSetup() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool(SharedPreferencesKeys.isFirstTime.value, false);
    Navigator.pushReplacementNamed(context, AuthWrapper.routeName);
  }

  List<OnboardingPage> _buildPages(AppLocalizations localization) {
    return [
      OnboardingPage(
        lightImagePath: 'assets/images/light_images/onboarding/1.png',
        darkImagePath: 'assets/images/dark_images/onboarding/1.png',
        title: localization.onboardingTitle1,
        description: localization.onboardingDescription1,
      ),
      OnboardingPage(
        lightImagePath: 'assets/images/light_images/onboarding/2.png',
        darkImagePath: 'assets/images/dark_images/onboarding/2.png',
        title: localization.onboardingTitle2,
        description: localization.onboardingDescription2,
      ),
      OnboardingPage(
        lightImagePath: 'assets/images/light_images/onboarding/3.png',
        darkImagePath: 'assets/images/dark_images/onboarding/3.png',
        title: localization.onboardingTitle3,
        description: localization.onboardingDescription3,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var localization = AppLocalizations.of(context)!;
    var width = MediaQuery.of(context).size.width;

    final pages = _buildPages(localization);
    final bool isFirstPage = _currentPage == 0;
    final bool isLastPage = _currentPage == pages.length - 1;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: isFirstPage
              ? null
              : CustomBackButton(onPress: () => _goToPreviousPage()),
        ),
        centerTitle: true,
        title: Image.asset(
          "assets/images/logo_${provider.assetSuffix}.png",
          width: width * 0.3,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SizedBox(
              width: 65,
              child: isLastPage
                  ? null
                  : GestureDetector(
                      onTap: _navigateToAppSetup,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSecondary,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            width: 1,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                        child: Text(
                          localization.onboardingSkip,
                          style: TextTheme.of(context).bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Header: back arrow, logo, skip
              const SizedBox(height: 16),

              // PageView content
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final page = pages[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Illustration image
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // ✅ centers vertically
                            children: [
                              Flexible(
                                flex: 2,
                                child: Image.asset(
                                  provider.isDark
                                      ? page.darkImagePath
                                      : page.lightImagePath,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 16),
                              // Page indicator dots
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  pages.length,
                                  (index) => AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    width: _currentPage == index ? 21 : 8,
                                    height:
                                        8, // ✅ same for both, no need to repeat
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: _currentPage == index
                                          ? Theme.of(
                                              context,
                                            ).colorScheme.primary
                                          : Theme.of(context)
                                                .colorScheme
                                                .secondary
                                                .withAlpha(77),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Title
                        Text(
                          page.title,
                          style: TextTheme.of(context).titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Description
                        Text(
                          page.description,
                          style: TextTheme.of(context).bodyMedium,
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // Next / Get started button
              FilledButton(
                onPressed: isLastPage ? _navigateToAppSetup : _goToNextPage,
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                ),
                child: Text(
                  isLastPage
                      ? localization.onboardingGetStarted
                      : localization.onboardingNext,
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
