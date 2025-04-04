import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RealVista VR Tours',
      theme: ThemeData(
        primaryColor: Color(0xFF2A5298),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF2A5298),
          secondary: Color(0xFF39B54A),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2A5298), Color(0xFF1E3C72)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo and app name
                Icon(
                  Icons.villa_rounded,
                  size: 80,
                  color: Colors.white,
                ),
                SizedBox(height: 16),
                Text(
                  'RealVista VR',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Immersive Property Tours',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 64),
                
                // User type selection
                Text(
                  'I am a:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 24),
                
                // Property seller button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PropertySellerDashboard(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Theme.of(context).primaryColor,
                    minimumSize: Size(double.infinity, 56),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.business),
                      SizedBox(width: 12),
                      Text('Property Seller', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                
                // Property buyer button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PropertyListingPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 56),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 12),
                      Text('Property Buyer', style: TextStyle(fontSize: 18)),
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
}

class PropertySellerDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seller Dashboard'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Your Properties',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Manage your virtual property tours',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 24),
              
              // Stats section
              Row(
                children: [
                  _buildStatCard(
                    context,
                    icon: Icons.visibility,
                    title: 'Total Views',
                    value: '1,234',
                  ),
                  SizedBox(width: 16),
                  _buildStatCard(
                    context,
                    icon: Icons.query_stats,
                    title: 'Inquiries',
                    value: '28',
                  ),
                ],
              ),
              SizedBox(height: 24),
              
              // Property list section
              Text(
                'Your Active Tours',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              
              // Sample property entry with VR tour button
              _buildPropertyCard(
                context,
                title: 'Luxury Beachfront Villa',
                address: '123 Coastal Drive, Malibu',
                image: 'https://via.placeholder.com/400x200',
                hasTour: true,
                tourUrl: 'https://html.itch.zone/html/13166568/Meta/index.html',
              ),
              
              SizedBox(height: 16),
              
              // Sample property entry without VR tour
              _buildPropertyCard(
                context,
                title: 'Downtown Apartment',
                address: '456 Urban Street, City Center',
                image: 'https://via.placeholder.com/400x200',
                hasTour: false,
              ),
              
              SizedBox(height: 24),
              
              // Add new property button
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Add property feature coming soon!')),
                  );
                },
                icon: Icon(Icons.add),
                label: Text('Add New Property'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildStatCard(BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildPropertyCard(BuildContext context, {
    required String title,
    required String address,
    required String image,
    required bool hasTour,
    String? tourUrl,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Container(
              height: 150,
              width: double.infinity,
              color: Colors.grey[300],
              child: Center(
                child: Icon(
                  Icons.image,
                  size: 48,
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Property name and address
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  address,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 16),
                
                // VR tour button
                if (hasTour)
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VirtualTourPage(
                            title: title,
                            virtualTourUrl: tourUrl!,
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.view_in_ar),
                    label: Text('Launch VR Tour'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                    ),
                  )
                else
                  OutlinedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Tour creation feature coming soon!')),
                      );
                    },
                    icon: Icon(Icons.add_circle_outline),
                    label: Text('Create VR Tour'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PropertyListingPage extends StatelessWidget {
  final List<Map<String, dynamic>> properties = [
    {
      'title': 'Luxury Beachfront Villa',
      'address': '123 Coastal Drive, Malibu',
      'price': '\$1,250,000',
      'beds': 4,
      'baths': 3,
      'area': '2,500 sq ft',
      'hasTour': true,
      'tourUrl': 'https://html.itch.zone/html/13166568/Meta/index.html',
    },
    {
      'title': 'Downtown Apartment',
      'address': '456 Urban Street, City Center',
      'price': '\$450,000',
      'beds': 2,
      'baths': 2,
      'area': '1,200 sq ft',
      'hasTour': true,
      'tourUrl': 'https://html.itch.zone/html/13166568/Meta/index.html',
    },
    {
      'title': 'Suburban Family Home',
      'address': '789 Pleasant Ave, Greentown',
      'price': '\$650,000',
      'beds': 3,
      'baths': 2,
      'area': '1,800 sq ft',
      'hasTour': true,
      'tourUrl': 'https://html.itch.zone/html/13166568/Meta/index.html',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Properties'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Filters coming soon!')),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Favorites coming soon!')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search properties...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          
          // Property listings
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: properties.length,
              itemBuilder: (context, index) {
                final property = properties[index];
                return _buildPropertyListingCard(context, property);
              },
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildPropertyListingCard(BuildContext context, Map<String, dynamic> property) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property image section with VR badge
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: Center(
                    child: Icon(
                      Icons.image,
                      size: 48,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              if (property['hasTour'])
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.view_in_ar, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text(
                          'VR Tour',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    property['price'],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Property details
                Text(
                  property['title'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  property['address'],
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 12),
                
                // Property specs
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSpecItem(
                      icon: Icons.king_bed_outlined,
                      value: '${property['beds']} Beds',
                    ),
                    _buildSpecItem(
                      icon: Icons.bathtub_outlined,
                      value: '${property['baths']} Baths',
                    ),
                    _buildSpecItem(
                      icon: Icons.square_foot_outlined,
                      value: property['area'],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                
                // VR tour button
                if (property['hasTour'])
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VirtualTourPage(
                            title: property['title'],
                            virtualTourUrl: property['tourUrl'],
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.view_in_ar),
                    label: Text('View VR Tour'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 44),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSpecItem({required IconData icon, required String value}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: Colors.grey[600],
        ),
        SizedBox(width: 4),
        Text(
          value,
          style: TextStyle(
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}

class VirtualTourPage extends StatefulWidget {
  final String title;
  final String virtualTourUrl;
  
  VirtualTourPage({
    required this.title,
    required this.virtualTourUrl,
  });
  
  @override
  _VirtualTourPageState createState() => _VirtualTourPageState();
}

class _VirtualTourPageState extends State<VirtualTourPage> {
  late WebViewController _controller;
  bool _isLoading = true;
  bool _isFullScreen = false;
  bool _showControls = true;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.black)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              _isLoading = progress < 100;
            });
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('WebView Error: ${error.description}');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error loading virtual tour: ${error.description}'),
                backgroundColor: Colors.red,
              ),
            );
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.virtualTourUrl));
      
    // Auto-hide controls after 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _showControls = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _isFullScreen 
        ? null 
        : AppBar(
            title: Text(widget.title),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                icon: Icon(Icons.fullscreen),
                onPressed: () {
                  setState(() {
                    _isFullScreen = true;
                    _showControls = false;
                  });
                },
              ),
            ],
          ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _showControls = !_showControls;
          });
          
          // Auto-hide controls after 3 seconds
          if (_showControls) {
            Future.delayed(Duration(seconds: 3), () {
              if (mounted) {
                setState(() {
                  _showControls = false;
                });
              }
            });
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            // WebView
            WebViewWidget(
              controller: _controller,
            ),
            
            // Loading indicator
            if (_isLoading)
              Container(
                color: Colors.black54,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.white,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Loading VR Tour...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
            // Control overlay
            if (_showControls)
              AnimatedOpacity(
                opacity: _showControls ? 1.0 : 0.0,
                duration: Duration(milliseconds: 300),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      // Top controls
                      if (_isFullScreen)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 28,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Text(
                              widget.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.fullscreen_exit,
                                color: Colors.white,
                                size: 28,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isFullScreen = false;
                                });
                              },
                            ),
                          ],
                        ),
                        
                      Spacer(),
                      
                      // Bottom controls
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildControlButton(
                            icon: Icons.help_outline,
                            label: 'Help',
                            onPressed: () {
                              _showHelpDialog(context);
                            },
                          ),
                          SizedBox(width: 16),
                          _buildControlButton(
                            icon: Icons.share,
                            label: 'Share',
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Share feature coming soon!')),
                              );
                            },
                          ),
                          SizedBox(width: 16),
                          _buildControlButton(
                            icon: Icons.star_border,
                            label: 'Save',
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Save feature coming soon!')),
                              );
                            },
                          ),
                          SizedBox(width: 16),
                          _buildControlButton(
                            icon: Icons.info_outline,
                            label: 'Info',
                            onPressed: () {
                              _showPropertyInfoDialog(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildControlButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
          onPressed: onPressed,
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
  
  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('How to Use VR Tour'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHelpItem(
              icon: Icons.touch_app,
              text: 'Tap and drag to look around',
            ),
            SizedBox(height: 12),
            _buildHelpItem(
              icon: Icons.zoom_in,
              text: 'Pinch to zoom in and out',
            ),
            SizedBox(height: 12),
            _buildHelpItem(
              icon: Icons.arrow_forward,
              text: 'Tap hotspots to move to different areas',
            ),
            SizedBox(height: 12),
            _buildHelpItem(
              icon: Icons.screen_rotation,
              text: 'Rotate device for immersive view',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Got it'),
          ),
        ],
      ),
    );
  }
  
  Widget _buildHelpItem({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon, size: 24),
        SizedBox(width: 12),
        Expanded(child: Text(text)),
      ],
    );
  }
  
  void _showPropertyInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Property Details'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Luxury Beachfront Villa',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text('123 Coastal Drive, Malibu'),
            SizedBox(height: 16),
            _buildPropertyDetailItem(
              label: 'Price',
              value: '\$1,250,000',
            ),
            _buildPropertyDetailItem(
              label: 'Bedrooms',
              value: '4',
            ),
            _buildPropertyDetailItem(
              label: 'Bathrooms',
              value: '3',
            ),
            _buildPropertyDetailItem(
              label: 'Area',
              value: '2,500 sq ft',
            ),
            _buildPropertyDetailItem(
              label: 'Year Built',
              value: '2019',
            ),
            SizedBox(height: 16),
            Text(
              'Contact Agent',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.person, size: 16),
                SizedBox(width: 8),
                Text('John Smith'),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.phone, size: 16),
                SizedBox(width: 8),
                Text('(555) 123-4567'),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
           onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Contacting agent...')),
              );
            },
            child: Text('Contact Agent'),
          ),
        ],
      ),
    );
  }
  
  Widget _buildPropertyDetailItem({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}

// Main entry point for the app

// Additional Contact Form Widget
class ContactAgentForm extends StatefulWidget {
  final String propertyTitle;
  
  ContactAgentForm({required this.propertyTitle});
  
  @override
  _ContactAgentFormState createState() => _ContactAgentFormState();
}

class _ContactAgentFormState extends State<ContactAgentForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();
  
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Agent'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Inquire about',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              Text(
                widget.propertyTitle,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Your Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16),
              
              TextFormField(
                controller: _messageController,
                decoration: InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a message';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Message sent successfully!'),
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                      ),
                    );
                    Future.delayed(Duration(seconds: 1), () {
                      Navigator.pop(context);
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Send Message'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Feedback Widget
class FeedbackForm extends StatefulWidget {
  final String tourId;
  
  FeedbackForm({required this.tourId});
  
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  int _rating = 0;
  final _feedbackController = TextEditingController();
  
  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate this VR Tour'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How would you rate your experience?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            
            // Star rating
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    size: 36,
                    color: index < _rating ? Colors.amber : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 24),
            
            // Feedback text field
            TextField(
              controller: _feedbackController,
              decoration: InputDecoration(
                labelText: 'Share your feedback (optional)',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              maxLines: 5,
            ),
            SizedBox(height: 24),
            
            // Submit button
            ElevatedButton(
              onPressed: () {
                if (_rating > 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Thank you for your feedback!'),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                  );
                  Future.delayed(Duration(seconds: 1), () {
                    Navigator.pop(context);
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please select a rating before submitting'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}

// Settings Page
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _locationEnabled = true;
  String _selectedTheme = 'Light';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Notifications'),
            subtitle: Text(_notificationsEnabled ? 'Enabled' : 'Disabled'),
            leading: Icon(Icons.notifications),
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
              activeColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Divider(),
          
          ListTile(
            title: Text('Location Services'),
            subtitle: Text(_locationEnabled ? 'Enabled' : 'Disabled'),
            leading: Icon(Icons.location_on),
            trailing: Switch(
              value: _locationEnabled,
              onChanged: (value) {
                setState(() {
                  _locationEnabled = value;
                });
              },
              activeColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Divider(),
          
          ListTile(
            title: Text('App Theme'),
            subtitle: Text(_selectedTheme),
            leading: Icon(Icons.color_lens),
            trailing: DropdownButton<String>(
              value: _selectedTheme,
              underline: Container(),
              items: ['Light', 'Dark', 'System Default'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedTheme = newValue;
                  });
                }
              },
            ),
          ),
          Divider(),
          
          ListTile(
            title: Text('Clear Cache'),
            subtitle: Text('Free up storage space'),
            leading: Icon(Icons.cleaning_services),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Cache cleared successfully'),
                ),
              );
            },
          ),
          Divider(),
          
          ListTile(
            title: Text('About'),
            subtitle: Text('App version 1.0.0'),
            leading: Icon(Icons.info),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'RealVista VR',
                applicationVersion: '1.0.0',
                applicationIcon: Icon(
                  Icons.villa_rounded,
                  size: 48,
                  color: Theme.of(context).primaryColor,
                ),
                children: [
                  Text('RealVista VR provides immersive virtual reality tours for real estate properties.'),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}