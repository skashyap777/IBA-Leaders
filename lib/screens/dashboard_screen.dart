// dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_routes.dart';
import '../constants/app_constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedTabIndex = 0; // Default to "12 Months" as shown in image
  final List<String> tabs = ['12 Months', 'Lifetime'];
  
  // Text controllers for form fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _industryController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers when widget is removed
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _companyController.dispose();
    _industryController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _pinCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      drawer: _buildDrawer(), // Add this line
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar with menu and notifications
              _buildTopBar(),
              SizedBox(height: 20.h),

              // Header Section with greeting and profile
              _buildHeaderSection(),
              SizedBox(height: 20.h),

              // Search Bar
              _buildSearchBar(),
              SizedBox(height: 25.h),

              // Navigation Icons Row
              _buildNavigationIcons(),
              SizedBox(height: 25.h),

              // Tab Selection (12 Months, Lifetime)
              _buildTabSelection(),
              SizedBox(height: 20.h),

              // Statistics List
              _buildStatistics(),
              SizedBox(height: 20.h),
              
              // Visitor Registration Form
              _buildVisitorRegistrationForm(),
              SizedBox(height: 20.h),
              
              // Email My Alliance Section
              _buildEmailMyAlliance(),
              SizedBox(height: 20.h),
              
              // Testimonials Section
              _buildTestimonialsSection(),
              SizedBox(height: 20.h),
              
              // Upcoming Events Section
              _buildUpcomingEventsSection(),
              SizedBox(height: 20.h),
              
              // Master IBAL Section
              _buildMasterIBALSection(),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Menu Icon
        Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Icon(Icons.menu, size: 24.w, color: const Color(0xFF2E5BFF)),
          ),
        ),
        // Notification Icons
        Row(
          children: [
            Stack(
              children: [
                Icon(
                  Icons.notifications_outlined,
                  size: 24.w,
                  color: Colors.grey[600],
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8.w,
                    height: 8.h,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 15.w),
            Stack(
              children: [
                Icon(
                  Icons.chat_bubble_outline,
                  size: 24.w,
                  color: Colors.grey[600],
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8.w,
                    height: 8.h,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeaderSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting
              Text(
                'Hi Your Name,',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2E5BFF),
                ),
              ),
              SizedBox(height: 4.h),
              // Location
              Text(
                'IBAL Wakefield',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.h),
              // Due Date
              Text(
                'Renewal Due Date: 20 Sep 2025',
                style: TextStyle(fontSize: 14.sp, color: Colors.black54),
              ),
            ],
          ),
        ),
        SizedBox(width: 16.w),
        // Profile Picture
        Container(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
            image: const DecorationImage(
              image: AssetImage('lib/assets/images/profile.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Member',
          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16.sp),
          prefixIcon: Icon(Icons.search, color: Colors.grey[400], size: 20.w),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 15.h,
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationIcons() {
    final List<Map<String, dynamic>> navItems = [
      {'icon': Icons.home, 'label': 'Home', 'isActive': false},
      {'icon': Icons.dashboard, 'label': 'Dashboard', 'isActive': true},
      {'icon': Icons.people, 'label': 'Alliance', 'isActive': false},
      {'icon': Icons.grid_view, 'label': 'Post', 'isActive': false},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: navItems.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        return GestureDetector(
          onTap: () {
            // Handle navigation based on index
            if (index == 0) {
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            } else if (index == 1) {
              // Dashboard is already active, do nothing or refresh
            } else if (index == 2) {
              Navigator.pushReplacementNamed(context, AppRoutes.allianceScreen);
            } else if (index == 3) {
              Navigator.pushReplacementNamed(context, AppRoutes.postScreen);
            }
          },
          child: Column(
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: item['isActive']
                      ? const Color(0xFF2E5BFF)
                      : Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  item['icon'],
                  color: item['isActive']
                      ? Colors.white
                      : const Color(0xFF2E5BFF),
                  size: 24.w,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                item['label'],
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black87,
                  fontWeight: item['isActive'] ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTabSelection() {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tab = entry.value;
          final isSelected = index == selectedTabIndex;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedTabIndex = index;
                });
              },
              child: Container(
                margin: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF2E5BFF)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Center(
                  child: Text(
                    tab,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w500,
                      color: isSelected ? Colors.white : Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildStatistics() {
    final List<Map<String, String>> stats = [
      {'label': 'Gratitude For Business Received (GBR slip)', 'value': '108429800'},
      {'label': 'Referrals Received', 'value': '77'},
      {'label': 'Business Given', 'value': '27505571'},
      {'label': 'Referrals Given', 'value': '116'},
      {'label': 'Visitors Invited', 'value': '10'},
      {'label': 'Direct Meetings', 'value': '47'},
      {'label': 'Leaders Created', 'value': '0'},
    ];

    return Column(
      children: stats.map((stat) {
        return Container(
          margin: EdgeInsets.only(bottom: 1.h),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  stat['label']!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                stat['value']!,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildVisitorRegistrationForm() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Visitor Registration',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2E5BFF),
            ),
          ),
          SizedBox(height: 20.h),
          
          // Form fields
          Row(
            children: [
              Expanded(
                child: _buildFormField(
                  controller: _firstNameController,
                  hintText: 'First Name',
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: _buildFormField(
                  controller: _lastNameController,
                  hintText: 'Last Name',
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          
          Row(
            children: [
              Expanded(
                child: _buildFormField(
                  controller: _emailController,
                  hintText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: _buildFormField(
                  controller: _mobileController,
                  hintText: 'Mobile Number',
                  keyboardType: TextInputType.phone,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          
          Row(
            children: [
              Expanded(
                child: _buildFormField(
                  controller: _companyController,
                  hintText: 'Company Name',
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: _buildFormField(
                  controller: _industryController,
                  hintText: 'Industry',
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          
          _buildFormField(
            controller: _addressController,
            hintText: 'Address',
          ),
          SizedBox(height: 10.h),
          
          Row(
            children: [
              Expanded(
                child: _buildFormField(
                  controller: _cityController,
                  hintText: 'City',
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: _buildFormField(
                  controller: _pinCodeController,
                  hintText: 'Pin Code',
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          
          // Submit button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle form submission
                _submitVisitorForm();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E5BFF),
                minimumSize: Size(150.w, 45.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FA),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 10.h,
          ),
        ),
      ),
    );
  }

  void _submitVisitorForm() {
    // Validate form fields
    if (_firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _mobileController.text.isEmpty) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all required fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Visitor registered successfully'),
        backgroundColor: Colors.green,
      ),
    );

    // Clear form fields
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _mobileController.clear();
    _companyController.clear();
    _industryController.clear();
    _addressController.clear();
    _cityController.clear();
    _pinCodeController.clear();
  }

  Widget _buildDrawer() {
    return Drawer(
      width: 280.w,
      child: Container(
        color: const Color(0xFF2E5BFF),
        child: Column(
          children: [
            // User Profile Section
            Padding(
              padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w, bottom: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 30.r,
                            backgroundImage: const AssetImage('lib/assets/images/profile_placeholder.png'), // Replace with actual image
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(2.w),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.edit,
                                size: 16.w,
                                color: const Color(0xFF2E5BFF),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Manish Juneja',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Real Estate Consultant',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Menu Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerItem('Share My Profile', () {
                    // TODO: Implement navigation for Share My Profile
                  }),
                  _buildDrawerItem('Edit Profile', () {
                    // TODO: Implement navigation for Edit Profile
                  }),
                  ExpansionTile(
                    title: Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_up, color: Colors.white),
                    children: [
                      _buildDrawerSubItem('Reset Password', () {
                        // TODO: Implement navigation for Reset Password
                      }),
                      _buildDrawerSubItem('Privacy Setting', () {
                        // TODO: Implement navigation for Privacy Setting
                      }),
                    ],
                  ),
                  _buildDrawerItem('Visitor Registration', () {
                    // TODO: Implement navigation for Visitor Registration
                  }),
                  _buildDrawerItem('Support', () {
                    // TODO: Implement navigation for Support
                  }),
                  _buildDrawerItem('Logout', () {
                    // TODO: Implement navigation for Logout
                  }),
                ],
              ),
            ),
            // Footer
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Terms of Services',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    '|',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    'Privacy Policy',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildDrawerSubItem(String title, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14.sp,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
  
  // Email My Alliance Section
  Widget _buildEmailMyAlliance() {
    // Sample alliance members data
    final List<Map<String, String>> allianceMembers = [
      {
        'name': 'Rajesh Kumar',
        'email': 'rajesh.kumar@gmail.com',
      },
      {
        'name': 'Salman Khan',
        'email': 'salman.khan@gmail.com',
      },
      {
        'name': 'Raj Tiwari',
        'email': 'raj.tiwari@gmail.com',
      },
      {
        'name': 'Manoj Mathur',
        'email': 'manoj.mathur@gmail.com',
      },
      {
        'name': 'Rahul Rana',
        'email': 'rahul.rana@gmail.com',
      },
    ];
    
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email My Alliance',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 16.h),
          ...allianceMembers.map((member) => _buildAllianceMemberCard(member)).toList(),
        ],
      ),
    );
  }
  
  Widget _buildAllianceMemberCard(Map<String, String> member) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          // Profile Image
          CircleAvatar(
            radius: 20.r,
            backgroundImage: const AssetImage('lib/assets/images/men.jpg'),
          ),
          SizedBox(width: 12.w),
          // Name and Email
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member['name'] ?? '',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  member['email'] ?? '',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          // Email Button
          ElevatedButton(
            onPressed: () {
              // Handle email action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2E5BFF),
              elevation: 0,
              minimumSize: Size(72.w, 28.h),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            child: Text(
              'Send Mail',
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  // Testimonials Section
  Widget _buildTestimonialsSection() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Testimonials (3)',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              // Tab buttons
              Row(
                children: [
                  _buildTestimonialTabButton('Given', true),
                  SizedBox(width: 8.w),
                  _buildTestimonialTabButton('Received', false),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Testimonial card
          _buildTestimonialCard(),
          SizedBox(height: 16.h),
          // Write testimonial button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle write testimonial action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E5BFF),
                minimumSize: Size(180.w, 40.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                'Write Testimonial',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildTestimonialTabButton(String text, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF2E5BFF) : Colors.grey[300],
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          color: isActive ? Colors.white : Colors.black87,
        ),
      ),
    );
  }
  
  Widget _buildTestimonialCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Author info
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundImage: const AssetImage('lib/assets/images/men.jpg'),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rahul Rana',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'rahul.rana@gmail.com',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // Testimonial text
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          SizedBox(height: 12.h),
          // Pagination dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF2E5BFF),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 4.w),
              Container(
                width: 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 4.w),
              Container(
                width: 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  // Upcoming Events Section
  Widget _buildUpcomingEventsSection() {
    // Sample events data
    final List<Map<String, String>> events = [
      {
        'title': 'IBA Leaders',
        'date': '30-Jun-2025',
        'time': '11:am',
        'location': 'Janakpuri New Delhi',
      },
      {
        'title': 'IBA Leaders',
        'date': '30-Jun-2025',
        'time': '11:am',
        'location': 'Janakpuri New Delhi',
      },
      {
        'title': 'IBA Leaders',
        'date': '30-Jun-2025',
        'time': '11:am',
        'location': 'Janakpuri New Delhi',
      },
      {
        'title': 'IBA Leaders',
        'date': '30-Jun-2025',
        'time': '11:am',
        'location': 'Janakpuri New Delhi',
      },
    ];
    
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upcoming Events',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2E5BFF),
            ),
          ),
          SizedBox(height: 16.h),
          // Events table with improved design
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Column(
              children: [
                // Table header
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                  color: const Color(0xFFEEEEEE),
                  child: Row(
                    children: [
                      Expanded(flex: 2, child: _buildTableHeaderCell('Event Title')),
                      Expanded(flex: 2, child: _buildTableHeaderCell('Event Date & Time')),
                      Expanded(flex: 2, child: _buildTableHeaderCell('Event Location')),
                      Expanded(flex: 1, child: _buildTableHeaderCell('Details')),
                    ],
                  ),
                ),
                // Table rows with alternating colors
                ...events.asMap().entries.map((entry) {
                  final index = entry.key;
                  final event = entry.value;
                  return _buildEventTableRow(event, index % 2 == 0);
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildTableHeaderCell(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
  
  Widget _buildEventTableRow(Map<String, String> event, bool isEvenRow) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
      color: isEvenRow ? Colors.white : const Color(0xFFF5F7FA),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              event['title'] ?? '',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF2E5BFF),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '${event['date'] ?? ''}\n${event['time'] ?? ''}',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              event['location'] ?? '',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                // Handle view details action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E5BFF),
                minimumSize: Size(80.w, 30.h),
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              child: Text(
                'More',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  // Master IBAL Section
  Widget _buildMasterIBALSection() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Master IBAL',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 16.h),
          // Education videos row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildEducationVideoCard(),
              _buildEducationVideoCard(),
            ],
          ),
          SizedBox(height: 12.h),
          // Pagination dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF2E5BFF),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 4.w),
              Container(
                width: 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 4.w),
              Container(
                width: 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildEducationVideoCard() {
    return Container(
      width: 150.w,
      height: 180.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        image: const DecorationImage(
          image: AssetImage('lib/assets/images/masterIBAL.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
          // Play button
          Center(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.play_arrow,
                color: const Color(0xFF2E5BFF),
                size: 24.w,
              ),
            ),
          ),
          // Title at bottom
          Positioned(
            bottom: 12.h,
            left: 12.w,
            right: 12.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Education Videos',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.white70,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}