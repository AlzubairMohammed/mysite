import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alzubair Mohammed | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});

  static const String bio =
      "Hi, I'm Alzubair Mohammed — a passionate Fullstack Web & Mobile Developer specializing in Laravel and Flutter. I love building robust, scalable applications and bringing creative ideas to life through code. With a strong background in both backend and frontend development, I deliver seamless digital experiences across platforms. I'm always eager to learn new technologies and contribute to open-source projects.";

  static const String email = 'alzubair.dev@gmail.com';
  static const String linkedin = 'https://www.linkedin.com/in/alzubair-mohammed';
  static const String github = 'https://github.com/alzubairmohammed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 900) {
            // Desktop
            return _buildWideLayout(context);
          } else if (constraints.maxWidth > 600) {
            // Tablet
            return _buildMediumLayout(context);
          } else {
            // Mobile
            return _buildNarrowLayout(context);
          }
        },
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: _buildSidebar(context),
        ),
        Expanded(
          flex: 5,
          child: _buildMainContent(context),
        ),
      ],
    );
  }

  Widget _buildMediumLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: _buildSidebar(context),
        ),
        Expanded(
          flex: 7,
          child: _buildMainContent(context),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return ListView(
      children: [
        _buildHeader(context),
        _buildAboutSection(context),
        _buildProjectsSection(context),
        _buildContactSection(context),
      ],
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return Container(
      color: Colors.blue.shade50,
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 32),
          _buildContactSection(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 200,
          backgroundImage: AssetImage('assets/profile.jpg'),
          // backgroundColor: Colors.blue,
        ),
        const SizedBox(height: 24),
        Text(
          'Alzubair Mohammed',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Fullstack Web & Mobile Developer',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.blueGrey.shade700,
              ),
        ),
      ],
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAboutSection(context),
          const SizedBox(height: 48),
          _buildProjectsSection(context),
        ],
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Text(bio, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }

  Widget _buildProjectsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Projects', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildProjectCard(
          context,
          title: 'Auction Server',
          description: 'A scalable auction server built with JavaScript.',
          url: 'https://github.com/alzubairmohammed/auction-server',
        ),
        _buildProjectCard(
          context,
          title: 'Auction Admin',
          description: 'Admin dashboard for auction management (Vue).',
          url: 'https://github.com/alzubairmohammed/auction-admin',
        ),
        _buildProjectCard(
          context,
          title: 'Natour Installments System',
          description: 'A demo for managing installments (Vue).',
          url: 'https://github.com/alzubairmohammed/natour-installments-system-demo',
        ),
        _buildProjectCard(
          context,
          title: 'Multi Vendor Store',
          description: 'APIs for a multi-vendor e-commerce platform.',
          url: 'https://github.com/alzubairmohammed/multi-vendor-store',
        ),
        _buildProjectCard(
          context,
          title: 'Course Force',
          description: 'A simple E-learning platform.',
          url: 'https://github.com/alzubairmohammed/course-force',
        ),
      ],
    );
  }

  Widget _buildProjectCard(BuildContext context, {required String title, required String description, required String url}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: IconButton(
          icon: const Icon(Icons.open_in_new),
          onPressed: () => _launchUrl(url),
        ),
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contact', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.email, size: 20),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => _launchUrl('mailto:$email'),
              child: Text(email, style: const TextStyle(decoration: TextDecoration.underline)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.link, size: 20),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => _launchUrl(linkedin),
              child: const Text('LinkedIn', style: TextStyle(decoration: TextDecoration.underline)),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () => _launchUrl(github),
              child: const Text('GitHub', style: TextStyle(decoration: TextDecoration.underline)),
            ),
          ],
        ),
      ],
    );
  }

  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
