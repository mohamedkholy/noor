import 'package:flutter/material.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyLogo extends StatefulWidget {
  const CompanyLogo({super.key});

  @override
  State<CompanyLogo> createState() => _CompanyLogoState();
}

class _CompanyLogoState extends State<CompanyLogo> {
  String? version, buildNum;

  @override
  void initState() {
    getVersion();
    super.initState();
  }

  Future<void> getVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    buildNum = packageInfo.buildNumber;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color borderColor = isLight
        ? Colors.black.withValues(alpha: 0.18)
        : Colors.white.withValues(alpha: 0.6);
    final Color shadowColor = isLight
        ? Colors.black.withValues(alpha: 0.25)
        : Colors.white.withValues(alpha: 0.35);
    final double overlayAlphaTop = isLight ? 0.32 : 0.22;
    final double overlayAlphaBottom = isLight ? 0.22 : 0.18;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            children: [
              Text(
                'Developed by',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: () {
                  launchUrl(
                    Uri.parse("https://pure-soft.com/"),
                    mode: LaunchMode.inAppWebView,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withValues(alpha: overlayAlphaTop),
                        Colors.white.withValues(alpha: overlayAlphaBottom),
                      ],
                    ),
                    border: Border.all(color: borderColor),

                    //  Colors.black.withValues(alpha: 0.04),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 3.0,
                    horizontal: 1,
                  ),
                  child: Image.asset(
                    Assets.assetsImagesPngCompanyLogo,
                    width: 80,
                    height: 15,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              if (version != null)
                Text(
                  "v $version",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
