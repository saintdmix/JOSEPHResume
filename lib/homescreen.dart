import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Joseph Chukwuebuka Great - Flutter Developer',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Poppins',
    ),
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  List<List<String>> nriShots = [
    ["assets/images/n1.jpg", "assets/images/n2.jpg", "assets/images/n3.jpg"]
  ];
  List<String> wShots = [
    "assets/images/w1.jpg",
    "assets/images/w2.jpg",
    "assets/images/w3.jpg"
  ];
  List<String> neShots = [
    "assets/images/ne1.jpg",
    "assets/images/ne2.jpg",
    "assets/images/ne3.jpg"
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF667eea),
              Color(0xFF764ba2),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(),
                _buildNavigationCards(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildHeader() {
  //   return AnimatedBuilder(
  //     animation: _controller,
  //     builder: (context, child) {
  //       return FadeTransition(
  //         opacity: _fadeAnimation,
  //         child: SlideTransition(
  //           position: _slideAnimation,
  //           child: Container(
  //             padding: EdgeInsets.all(24.0),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Container(
  //                   width: 120,
  //                   height: 120,
  //                   decoration: BoxDecoration(
  //                     shape: BoxShape.circle,
  //                     border: Border.all(color: Colors.white, width: 4),
  //                     boxShadow: [
  //                       BoxShadow(
  //                         color: Colors.black26,
  //                         blurRadius: 20,
  //                         offset: Offset(0, 10),
  //                       ),
  //                     ],
  //                   ),
  //                   child: Image.asset(
  //                       fit: BoxFit.contain, "assets/images/pic.jpg"),
  //                 ),
  //                 SizedBox(height: 16),
  //                 Text(
  //                   'Joseph Chukwuebuka Great',
  //                   style: TextStyle(
  //                     fontSize: 28,
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.white,
  //                   ),
  //                   textAlign: TextAlign.center,
  //                 ),
  //                 SizedBox(height: 8),
  //                 Text(
  //                   'Senior Flutter Developer',
  //                   style: TextStyle(
  //                     fontSize: 18,
  //                     color: Colors.white70,
  //                   ),
  //                 ),
  //                 SizedBox(height: 4),
  //                 Text(
  //                   '6 Years Experience • Nigerian 🇳🇬',
  //                   style: TextStyle(
  //                     fontSize: 16,
  //                     color: Colors.white60,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }


Widget _buildHeader() {
  return AnimatedBuilder(
    animation: _controller,
    builder: (context, child) {
      return FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Container(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                    )  ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/pic.jpg",
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Joseph Chukwuebuka Great',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Senior Flutter Developer',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '6 Years Experience • Nigerian 🇳🇬',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white60,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
  Widget _buildNavigationCards() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildNavCard(
            'About Me',
            'Personal info, skills & experience',
            Icons.person_outline,
            Colors.orange,
            () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    AboutScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              ),
            ),
          ),
          SizedBox(height: 16),
          _buildNavCard(
            'My Projects',
            'Explore my mobile applications',
            Icons.apps,
            Colors.green,
            () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    ProjectsScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 16),
          _buildNavCard(
            'Contact Me',
            'Get in touch for opportunities',
            Icons.contact_mail,
            Colors.purple,
            () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    ContactScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavCard(String title, String subtitle, IconData icon,
      Color color, VoidCallback onTap) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 800),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
                  ),
                ),
                child: Row(
                  children: [
                    Hero(
                      tag: title,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          icon,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              // color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            subtitle,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[400],
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Me'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF667eea), Color(0xFF764ba2)],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileCard(),
            SizedBox(height: 20),
            _buildEducationCard(),
            SizedBox(height: 20),
            _buildSkillsCard(),
            SizedBox(height: 20),
            _buildExperienceCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                // color: Colors.black87,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Passionate Senior Flutter Developer with 6 years of experience in mobile application development. Specialized in creating high-performance, cross-platform applications with beautiful UI/UX design. Proven track record of delivering successful projects from concept to deployment.',
              style: TextStyle(
                fontSize: 16,
                // color: Colors.grey[700],
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEducationCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Education',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            ListTile(
              leading: Icon(Icons.school, color: Colors.blue),
              title: Text('Bachelor of Engineering'),
              subtitle:
                  Text('Electrical Engineering\nUniversity of Nigeria, Nsukka'),
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsCard() {
    final skills = [
      'Flutter',
      'Dart',
      'Firebase',
      'REST API',
      'Critical Thinking',
      'Team Player',
      'UI/UX Design',
      'State Management',
      'Git',
      'Mobile Development'
    ];

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Skills',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                // color: Colors.black87,
              ),
            ),
            SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills
                  .map((skill) => Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: Colors.blue.withOpacity(0.3)),
                        ),
                        child: Text(
                          skill,
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Work Experience',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                // color: Colors.black87,
              ),
            ),
            SizedBox(height: 16),
            _buildExperienceItem(
              'Senior Flutter Developer',
              'Kpie Technologies',
              'Current',
              'Leading mobile development projects and mentoring junior developers.',
            ),
            Divider(),
            _buildExperienceItem(
              'Flutter Developer',
              'LintoPay',
              'Dec 2024 - Present',
              'Developing and maintaining VTU application with multiple payment integrations.',
            ),
            Divider(),
            _buildExperienceItem(
              'Flutter Developer',
              'Whoscore',
              'Apr 2023 - Present',
              'Building sports application with live features and betting platform integration.',
            ),
            Divider(),
            _buildExperienceItem(
              'Junior Flutter Developer',
              'Kpie Technologies',
              'Feb 2019 - Jun 2020',
              'Started career in mobile development with Flutter framework.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceItem(
      String title, String company, String period, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            // color: Colors.black87,
          ),
        ),
        Text(
          '$company • $period',
          style: TextStyle(
            fontSize: 14,
            color: Colors.blue[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

class ProjectsScreen extends StatelessWidget {
  final List<ProjectModel> projects = [
    ProjectModel(
      name: 'Nri Food Delivery',
      description: 'Comprehensive food delivery application',
      category: 'Food & Delivery',
      isBuiltAlone: true,
      playstoreLink:
          'https://play.google.com/store/apps/details?id=com.saint.nriigbo',
      youtubeLink: 'https://youtu.be/aPB6-ICgHB8?si=SbIy6orqRjsVuFjF',
      fullDescription:
          'A complete food delivery solution that connects customers with local restaurants. Features include real-time order tracking, multiple payment options, restaurant management, delivery tracking, and user-friendly interface. Built with Flutter and Firebase backend.',
      features: [
        'Real-time Order Tracking',
        'Multiple Payment Methods',
        'Restaurant Management',
        'Push Notifications',
        'Delivery Tracking',
        'User Reviews & Ratings'
      ],
      technologies: [
        'Flutter',
        'Firebase',
        'Google Maps API',
        'Payment Integration'
      ],
      icon: Icons.restaurant,
      color: Colors.orange,
    ),
    ProjectModel(
      name: 'LintoPay',
      description: 'Comprehensive VTU and digital services platform',
      category: 'FinTech & Services',
      isBuiltAlone: true,
      playstoreLink:
          'https://play.google.com/store/apps/details?id=com.lintopay.app',
      fullDescription:
          'A comprehensive VTU (Virtual Top-Up) platform offering various digital services including mobile data, airtime, cable subscriptions, insurance, virtual cards, education payments, gift cards, and international airtime. Built with secure payment integration and user-friendly interface.',
      features: [
        'Mobile Data Purchase',
        'Airtime Top-up',
        'Cable TV Subscriptions',
        'Insurance Payments',
        'Virtual Cards',
        'Education Payments',
        'Gift Cards',
        'International Airtime',
        'Transaction History',
        'Secure Payments'
      ],
      technologies: [
        'Flutter',
        'REST API',
        'Payment Gateway Integration',
        'Firebase'
      ],
      icon: Icons.payment,
      color: Colors.green,
    ),
    ProjectModel(
      name: 'WhoScore',
      description: 'Sports app with live features and betting integration',
      category: 'Sports & Gaming',
      isBuiltAlone: true,
      youtubeLink: 'https://youtube.com/shorts/HarJDduc_wA?si=HAJ1q6lwPten-vq2',
      fullDescription:
          'A comprehensive sports application featuring live match updates, betting code verification, and integration with various betting platforms. Provides real-time sports data, match predictions, and betting analytics.',
      features: [
        'Live Match Updates',
        'Betting Code Verification',
        'Sports Analytics',
        'Match Predictions',
        'Multi-platform Integration',
        'Real-time Notifications'
      ],
      technologies: [
        'Flutter',
        'Real-time Database',
        'Sports API',
        'WebSocket'
      ],
      icon: Icons.sports_soccer,
      color: Colors.blue,
    ),
    ProjectModel(
      name: 'Chat Citizen',
      description: 'AI-powered chatbot application',
      category: 'AI & Communication',
      isBuiltAlone: true,
      fullDescription:
          'An intelligent AI chatbot application that provides conversational AI experience. Users can interact with advanced AI models for various purposes including assistance, entertainment, and learning. Features natural language processing and contextual conversations.',
      features: [
        'AI Conversation',
        'Natural Language Processing',
        'Contextual Responses',
        'Multiple AI Models',
        'Chat History',
        'Personalized Experience'
      ],
      technologies: [
        'Flutter',
        'AI/ML APIs',
        'Natural Language Processing',
        'Cloud Services'
      ],
      icon: Icons.chat,
      color: Colors.purple,
    ),
    ProjectModel(
      name: '9jaHotel',
      description: 'Hotel reservation and management system',
      category: 'Travel & Hospitality',
      isBuiltAlone: false,
      playstoreLink:
          'https://play.google.com/store/apps/details?id=com.nigerhotel.roomstatus',
      fullDescription:
          'A comprehensive hotel reservation system for Nigerian hotels. Allows users to search, book, and manage hotel reservations with real-time availability, pricing, and room management features.',
      features: [
        'Hotel Search & Booking',
        'Real-time Availability',
        'Room Management',
        'Booking History',
        'Payment Integration',
        'Reviews & Ratings'
      ],
      technologies: ['Flutter', 'Booking APIs', 'Payment Gateway', 'Firebase'],
      icon: Icons.hotel,
      color: Colors.teal,
    ),
    ProjectModel(
      name: 'BoonBac',
      description: 'Social media platform with comprehensive features',
      category: 'Social Media',
      isBuiltAlone: false,
      playstoreLink:
          'https://play.google.com/store/apps/details?id=com.boonbac.social',
      fullDescription:
          'A comprehensive social media platform featuring chat, voice/video calls, live streaming, and marketplace. Contributed specifically to call functionality, video calling, chat system, marketplace implementation, and live streaming features.',
      features: [
        'Social Networking',
        'Voice & Video Calls',
        'Live Streaming',
        'Marketplace',
        'Real-time Chat',
        'Content Sharing'
      ],
      technologies: [
        'Flutter',
        'WebRTC',
        'Real-time Database',
        'Media Processing'
      ],
      myContributions: [
        'Voice & Video Calls',
        'Chat System',
        'Marketplace',
        'Live Streaming',
        'Bug Fixes'
      ],
      icon: Icons.people,
      color: Colors.indigo,
    ),
    ProjectModel(
      name: 'Fashion Connect',
      description: 'Fashion industry networking and business platform',
      category: 'Fashion & Business',
      isBuiltAlone: false,
      playstoreLink:
          'https://play.google.com/store/apps/details?id=com.fashionbiz.connect',
      fullDescription:
          'A specialized platform connecting fashion industry professionals, designers, and businesses. Features include portfolio showcase, networking, business connections, and fashion marketplace.',
      features: [
        'Fashion Portfolio',
        'Professional Networking',
        'Business Connections',
        'Fashion Marketplace',
        'Industry News',
        'Event Management'
      ],
      technologies: ['Flutter', 'Social APIs', 'Image Processing', 'Firebase'],
      icon: Icons.style,
      color: Colors.pink,
    ),
    ProjectModel(
      name: 'WorkPal',
      description: 'Artisan connect and service platform',
      category: 'Services & Marketplace',
      isBuiltAlone: true,
      fullDescription:
          'A platform connecting skilled artisans with customers seeking various services. Features service booking, artisan profiles, ratings, and secure payment system for local services.',
      features: [
        'Artisan Profiles',
        'Service Booking',
        'Ratings & Reviews',
        'Secure Payments',
        'Location-based Search',
        'Service Categories'
      ],
      technologies: [
        'Flutter',
        'Google Maps API',
        'Payment Integration',
        'Firebase'
      ],
      icon: Icons.build,
      color: Colors.brown,
    ),
    ProjectModel(
      name: 'ZerthPay',
      description: 'Comprehensive banking and financial services app',
      category: 'Banking & Finance',
      isBuiltAlone: false,
      fullDescription:
          'A full-featured banking application providing various financial services including account management, transfers, bill payments, investment options, and financial analytics.',
      features: [
        'Account Management',
        'Money Transfers',
        'Bill Payments',
        'Investment Services',
        'Financial Analytics',
        'Secure Transactions'
      ],
      technologies: [
        'Flutter',
        'Banking APIs',
        'Security Frameworks',
        'Financial Services'
      ],
      icon: Icons.account_balance,
      color: Colors.cyan,
    ),
    ProjectModel(
      name: 'Ark Gaming',
      description: 'Prize-based gaming platform',
      category: 'Gaming & Entertainment',
      isBuiltAlone: true,
      fullDescription:
          'An innovative gaming platform where users can participate in various games with real money stakes to win prizes. Features secure payments, fair gaming algorithms, and prize distribution system.',
      features: [
        'Prize-based Gaming',
        'Secure Payments',
        'Fair Play Algorithm',
        'Prize Distribution',
        'Gaming Statistics',
        'Leaderboards'
      ],
      technologies: [
        'Flutter',
        'Gaming APIs',
        'Payment Security',
        'Random Number Generation'
      ],
      icon: Icons.games,
      color: Colors.red,
    ),
    ProjectModel(
      name: 'NexaHealth',
      description: 'Comprehensive healthcare services platform',
      category: 'Healthcare & Wellness',
      isBuiltAlone: false,
      fullDescription:
          'A comprehensive healthcare platform offering therapy sessions, medication pickup services, babysitting, elderly care, and other health-related services. Connects healthcare providers with patients.',
      features: [
        'Therapy Sessions',
        'Medication Pickup',
        'Babysitting Services',
        'Elderly Care',
        'Healthcare Provider Network',
        'Appointment Scheduling'
      ],
      technologies: [
        'Flutter',
        'Healthcare APIs',
        'Appointment System',
        'Secure Communications'
      ],
      icon: Icons.health_and_safety,
      color: Colors.greenAccent,
    ),
  ];

   ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Projects'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF667eea), Color(0xFF764ba2)],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return Hero(
            tag: 'project_${project.name}',
            child: Card(
              elevation: 4,
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        ProjectDetailScreen(project: project),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ),
                ),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: project.color,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          project.icon,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    project.name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      // color: Colors.black87,
                                    ),
                                  ),
                                ),
                                if (project.isBuiltAlone)
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      'Solo',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              project.category,
                              style: TextStyle(
                                fontSize: 12,
                                color: project.color,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              project.description,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey[400],
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProjectDetailScreen extends StatefulWidget {
  final ProjectModel project;

  const ProjectDetailScreen({super.key, required this.project});

  @override
  _ProjectDetailScreenState createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<String> n1 = [
    "assets/images/n1.jpg",
    "assets/images/n2.jpg",
    "assets/images/n3.jpg",
  ];
  List<String> f = [
    "assets/images/fc1.jpg",
    "assets/images/fc2.jpg",
    "assets/images/fc3.jpg",
  ];
  List<String> ne = [
    "assets/images/ne1.jpg",
    "assets/images/ne2.jpg",
    "assets/images/ne3.jpg",
  ];
  List<String> w = [
    "assets/images/w1.jpg",
    "assets/images/w2.jpg",
    "assets/images/w1.jpg",
  ];
  List<String> z = [
    "assets/images/z1.jpg",
    "assets/images/z2.jpg",
    "assets/images/z3.jpg",
  ];
  List<String> a = [
    "assets/images/a1.jpg",
    "assets/images/a2.jpg",
    "assets/images/a3.jpg",
  ];
  List<String> h = [
    "assets/images/91.jpg",
    "assets/images/92.jpg",
    "assets/images/93.jpg",
  ];
  List<String> l = [
    "assets/images/l1.jpg",
    "assets/images/l2.jpg",
    "assets/images/l3.jpg",
  ];
  List<String> b = [
    "assets/images/b3.jpg",
    "assets/images/b2.jpg",
    "assets/images/b3.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.project.name),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      widget.project.color,
                      widget.project.color.withOpacity(0.7),
                    ],
                  ),
                ),
                child: Center(
                  child: Hero(
                    tag: 'project_${widget.project.name}',
                    child: Icon(
                      widget.project.icon,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProjectHeader(),
                  SizedBox(height: 20),
                  _buildScreenshotsSection(),
                  SizedBox(height: 20),
                  _buildDescriptionSection(),
                  SizedBox(height: 20),
                  _buildFeaturesSection(),
                  SizedBox(height: 20),
                  _buildTechnologiesSection(),
                  if (widget.project.myContributions != null) ...[
                    SizedBox(height: 20),
                    _buildContributionsSection(),
                  ],
                  SizedBox(height: 20),
                  _buildLinksSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectHeader() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.category,
                        style: TextStyle(
                          fontSize: 14,
                          color: widget.project.color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        widget.project.description,
                        style: TextStyle(
                          fontSize: 16,
                          // color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.project.isBuiltAlone)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Built Solo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildScreenshotsSection() {
  //   return Card(
  //     elevation: 4,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //     child: Padding(
  //       padding: EdgeInsets.all(16.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             'Screenshots',
  //             style: TextStyle(
  //               fontSize: 18,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //           SizedBox(height: 12),
  //           SizedBox(
  //             height: 200,
  //             child: PageView.builder(
  //               controller: _pageController,
  //               onPageChanged: (index) {
  //                 setState(() {
  //                   _currentPage = index;
  //                 });
  //               },
  //               itemCount: 3, // Placeholder for screenshots
  //               itemBuilder: (context, index) {
  //                 return Container(
  //                   margin: EdgeInsets.symmetric(horizontal: 4),
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(12),
  //                     border: Border.all(color: Colors.grey[300]!),
  //                   ),
  //                   child: ClipRRect(
  //                     borderRadius: BorderRadius.circular(12),
  //                     child: widget.project.name == "Nri Food Delivery"
  //                         ? Image.asset(
  //                             n1[index],
  //                             fit: BoxFit
  //                                 .fitWidth, // Stretch width, keep original height
  //                             // Changed from fitWidth to cover
  //                             width: double.infinity, // Ensure full width
  //                           )
  //                         : widget.project.name == "LintoPay"
  //                             ? Image.asset(
  //                                 l[index],
  //                                 fit: BoxFit
  //                                     .fitWidth, // Stretch width, keep original height
  //                                 // Changed from fitWidth to cover
  //                                 width: double.infinity, // Ensure full width
  //                               )
  //                             : widget.project.name == "9jaHotel"
  //                                 ? Image.asset(
  //                                     h[index],
  //                                     fit: BoxFit
  //                                         .fitWidth, // Stretch width, keep original height
  //                                     // Changed from fitWidth to cover
  //                                     width:
  //                                         double.infinity, // Ensure full width
  //                                   )
  //                                 : widget.project.name == "BoonBac"
  //                                     ? Image.asset(
  //                                         b[index],
  //                                         fit: BoxFit
  //                                             .fitWidth, // Stretch width, keep original height
  //                                         // Changed from fitWidth to cover
  //                                         width: double
  //                                             .infinity, // Ensure full width
  //                                       )
  //                                     : widget.project.name == "Fashion Connect"
  //                                         ? Image.asset(
  //                                             f[index],
  //                                             fit: BoxFit
  //                                                 .fitWidth, // Stretch width, keep original height
  //                                             // Changed from fitWidth to cover
  //                                             width: double
  //                                                 .infinity, // Ensure full width
  //                                           )
  //                                         : widget.project.name == "WorkPal"
  //                                             ? Image.asset(
  //                                                 w[index],
  //                                                 fit: BoxFit
  //                                                     .fitWidth, // Stretch width, keep original height
  //                                                 // Changed from fitWidth to cover
  //                                                 width: double
  //                                                     .infinity, // Ensure full width
  //                                               )
  //                                             : widget.project.name ==
  //                                                     "ZerthPay"
  //                                                 ? Image.asset(
  //                                                     z[index],
  //                                                     fit: BoxFit
  //                                                         .fitWidth, // Stretch width, keep original height
  //                                                     // Changed from fitWidth to cover
  //                                                     width: double
  //                                                         .infinity, // Ensure full width
  //                                                   )
  //                                                 : widget.project.name ==
  //                                                         "Ark Gaming"
  //                                                     ? Image.asset(
  //                                                         a[index],
  //                                                         fit: BoxFit
  //                                                             .fitWidth, // Stretch width, keep original height
  //                                                         // Changed from fitWidth to cover
  //                                                         width: double
  //                                                             .infinity, // Ensure full width
  //                                                       )
  //                                                     : widget.project.name ==
  //                                                             "NexaHealth"
  //                                                         ? Image.asset(
  //                                                             ne[index],
  //                                                             fit: BoxFit
  //                                                                 .fitWidth, // Stretch width, keep original height
  //                                                             // Changed from fitWidth to cover
  //                                                             width: double
  //                                                                 .infinity, // Ensure full width
  //                                                           )
  //                                                         : Icon(Icons.person),
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //           SizedBox(height: 12),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: List.generate(
  //               3,
  //               (index) => Container(
  //                 margin: EdgeInsets.symmetric(horizontal: 4),
  //                 width: 8,
  //                 height: 8,
  //                 decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   color: _currentPage == index
  //                       ? widget.project.color
  //                       : Colors.grey[300],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }


Widget _buildScreenshotsSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Screenshots',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: 3, // Placeholder for screenshots
                itemBuilder: (context, index) {
                  final imagePath = widget.project.name == "Nri Food Delivery"
                      ? n1[index]
                      : widget.project.name == "LintoPay"
                          ? l[index]
                          : widget.project.name == "9jaHotel"
                              ? h[index]
                              : widget.project.name == "BoonBac"
                                  ? b[index]
                                  : widget.project.name == "Fashion Connect"
                                      ? f[index]
                                      : widget.project.name == "WorkPal"
                                          ? w[index]
                                          : widget.project.name == "ZerthPay"
                                              ? z[index]
                                              : widget.project.name ==
                                                      "Ark Gaming"
                                                  ? a[index]
                                                  : widget.project.name ==
                                                          "NexaHealth"
                                                      ? ne[index]
                                                      : null;

                  return GestureDetector(
                    onTap: () {
                      if (imagePath != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullScreenImageViewer(
                              imagePaths: _getAllImagesForProject(),
                              initialIndex: index,
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: imagePath != null
                            ? Image.asset(
                                imagePath,
                                fit: BoxFit.fitWidth,
                                width: double.infinity,
                              )
                            : Icon(Icons.person),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? widget.project.color
                        : Colors.grey[300],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _getAllImagesForProject() {
    return widget.project.name == "Nri Food Delivery"
        ? n1
        : widget.project.name == "LintoPay"
            ? l
            : widget.project.name == "9jaHotel"
                ? h
                : widget.project.name == "BoonBac"
                    ? b
                    : widget.project.name == "Fashion Connect"
                        ? f
                        : widget.project.name == "WorkPal"
                            ? w
                            : widget.project.name == "ZerthPay"
                                ? z
                                : widget.project.name == "Ark Gaming"
                                    ? a
                                    : widget.project.name == "NexaHealth"
                                        ? ne
                                        : [];
  }
  Widget _buildDescriptionSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About This Project',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                // color: Colors.black87,
              ),
            ),
            SizedBox(height: 12),
            Text(
              widget.project.fullDescription,
              style: TextStyle(
                fontSize: 16,
                // color: Colors.grey[700],
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturesSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Key Features',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                // color: Colors.black87,
              ),
            ),
            SizedBox(height: 12),
            ...widget.project.features.map((feature) => Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6),
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: widget.project.color,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          feature,
                          style: TextStyle(
                            fontSize: 16,
                            // color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildTechnologiesSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Technologies Used',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                // color: Colors.black87,
              ),
            ),
            SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.project.technologies
                  .map((tech) => Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: widget.project.color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: widget.project.color.withOpacity(0.3)),
                        ),
                        child: Text(
                          tech,
                          style: TextStyle(
                            color: widget.project.color,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContributionsSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Contributions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                // color: Colors.black87,
              ),
            ),
            SizedBox(height: 12),
            ...widget.project.myContributions!.map((contribution) => Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 20,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          contribution,
                          style: TextStyle(
                            fontSize: 16,
                            // color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildLinksSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Links & Media',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                // color: Colors.black87,
              ),
            ),
            SizedBox(height: 12),
            if (widget.project.playstoreLink != null)
              _buildLinkButton(
                'View on Play Store',
                Icons.shop,
                Colors.green,
                widget.project.playstoreLink!,
              ),
            if (widget.project.youtubeLink != null) ...[
              SizedBox(height: 12),
              _buildLinkButton(
                'Watch Demo Video',
                Icons.play_circle_filled,
                Colors.red,
                widget.project.youtubeLink!,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLinkButton(String text, IconData icon, Color color, String url) {
    return InkWell(
      onTap: () => _launchURL(url),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Icon(icon, color: color),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(Icons.open_in_new, color: color, size: 20),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Me'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF667eea), Color(0xFF764ba2)],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildContactHeader(),
            SizedBox(height: 20),
            _buildContactInfo(),
            SizedBox(height: 20),
            _buildSocialLinks(),
            SizedBox(height: 20),
            _buildLocationCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildContactHeader() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.withOpacity(0.1),
              Colors.purple.withOpacity(0.1),
            ],
          ),
        ),
        child: Column(
          children: [
            Icon(
              Icons.contact_mail,
              size: 60,
              color: Colors.blue,
            ),
            SizedBox(height: 16),
            Text(
              'Let\'s Work Together!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                // color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'I\'m always open to discussing new opportunities and exciting projects.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                // color: Colors.black87,
              ),
            ),
            SizedBox(height: 16),
            _buildContactItem(
              Icons.email,
              'Email',
              'josephchukwuebuka10@gmail.com',
              Colors.red,
              'mailto:josephchukwuebuka10@gmail.com',
            ),
            Divider(),
            _buildContactItem(
              Icons.phone,
              'Phone',
              '+234 913 856 7705',
              Colors.green,
              'tel:+2349138567705',
            ),
            Divider(),
            _buildContactItem(
              Icons.location_on,
              'Address',
              'University of Nigeria, Nsukka',
              Colors.blue,
              null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(
      IconData icon, String title, String value, Color color, String? action) {
    return InkWell(
      onTap: action != null ? () => _launchURL(action) : null,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      // color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            if (action != null)
              Icon(Icons.open_in_new, color: Colors.grey[400], size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Social Media & Professional Links',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                // color: Colors.black87,
              ),
            ),
            SizedBox(height: 16),
            _buildSocialLink(
              Icons.code,
              'GitHub',
              'View my code repositories',
              Colors.black,
              'https://github.com/saintdmix',
            ),
            SizedBox(height: 12),
            _buildSocialLink(
              Icons.work,
              'LinkedIn',
              'Professional networking',
              Colors.blue[700]!,
              'https://www.linkedin.com/in/joseph-chukwuebuka-940605362?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
            ),
            SizedBox(height: 12),
            _buildSocialLink(
              Icons.alternate_email,
              'X (Twitter)',
              'Follow for updates',
              Colors.blue,
              'https://x.com/Active_code247?t=w_xtvkSOi2iqwLenElBJ8w&s=09',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLink(
      IconData icon, String title, String subtitle, Color color, String url) {
    return InkWell(
      onTap: () => _launchURL(url),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 24),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      // color: Colors.black87,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.open_in_new, color: color, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.green.withOpacity(0.1),
              Colors.teal.withOpacity(0.1),
            ],
          ),
        ),
        child: Column(
          children: [
            Icon(
              Icons.location_city,
              size: 50,
              color: Colors.green,
            ),
            SizedBox(height: 16),
            Text(
              'Based in Nigeria 🇳🇬',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                // color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Available for remote work and local collaborations',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}

class ProjectModel {
  final String name;
  final String description;
  final String category;
  final bool isBuiltAlone;
  final String? playstoreLink;
  final String? youtubeLink;
  final String fullDescription;
  final List<String> features;
  final List<String> technologies;
  final List<String>? myContributions;
  final IconData icon;
  final Color color;

  ProjectModel({
    required this.name,
    required this.description,
    required this.category,
    required this.isBuiltAlone,
    this.playstoreLink,
    this.youtubeLink,
    required this.fullDescription,
    required this.features,
    required this.technologies,
    this.myContributions,
    required this.icon,
    required this.color,
  });
}



class FullScreenImageViewer extends StatefulWidget {
  final List<String> imagePaths;
  final int initialIndex;

  const FullScreenImageViewer({
    required this.imagePaths,
    required this.initialIndex,
    Key? key,
  }) : super(key: key);

  @override
  _FullScreenImageViewerState createState() => _FullScreenImageViewerState();
}

class _FullScreenImageViewerState extends State<FullScreenImageViewer> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '${_currentIndex + 1}/${widget.imagePaths.length}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: PageView.builder(
          controller: _pageController,
          itemCount: widget.imagePaths.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return InteractiveViewer(
              panEnabled: true,
              minScale: 0.5,
              maxScale: 4.0,
              child: Center(
                child: Image.asset(
                  widget.imagePaths[index],
                  fit: BoxFit.contain,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
