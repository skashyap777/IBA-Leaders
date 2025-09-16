// main_screen.dart - Unified screen with persistent header and dynamic content
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_constants.dart';
import '../constants/app_routes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0; // 0: Home, 1: Dashboard, 2: Alliance, 3: Post
  int selectedTabIndex =
      1; // For home screen tabs (6 Month, 12 Months, Lifetime)

  // Text controllers for dashboard form fields
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
      drawer: _buildDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // FIXED HEADER SECTION (from Home Screen)
              _buildTopBar(),
              SizedBox(height: 20.h),
              _buildHeaderSection(),
              SizedBox(height: 20.h),
              _buildSearchBar(),
              SizedBox(height: 25.h),
              _buildNavigationIcons(),
              SizedBox(height: 25.h),

              // DYNAMIC CONTENT AREA
              _buildDynamicContent(),
            ],
          ),
        ),
      ),
    );
  }

  // FIXED HEADER COMPONENTS (from Home Screen)
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
              SizedBox(height: 8.h),
              // Active Status
              Row(
                children: [
                  Container(
                    width: 8.w,
                    height: 8.h,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    'Active',
                    style: TextStyle(fontSize: 14.sp, color: Colors.black54),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              // Due Date
              Text(
                'Due Date: 05/06/2024',
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
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 18.w,
                  height: 18.h,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2E5BFF),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 10.w),
                ),
              ),
            ],
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
      {'icon': Icons.home, 'label': 'Home'},
      {'icon': Icons.dashboard, 'label': 'Dashboard'},
      {'icon': Icons.people, 'label': 'Alliance'},
      {'icon': Icons.grid_view, 'label': 'Post'},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: navItems.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final isActive = index == selectedIndex;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Column(
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: isActive ? const Color(0xFF2E5BFF) : Colors.white,
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
                  color: isActive ? Colors.white : const Color(0xFF2E5BFF),
                  size: 24.w,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                item['label'],
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // DYNAMIC CONTENT AREA
  Widget _buildDynamicContent() {
    switch (selectedIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return _buildDashboardContent();
      case 2:
        return _buildAllianceContent();
      case 3:
        return _buildPostContent();
      default:
        return _buildHomeContent();
    }
  }

  // HOME CONTENT (lower part of original home screen)
  Widget _buildHomeContent() {
    return Column(
      children: [
        // Next Meeting Card
        _buildNextMeetingCard(),
        SizedBox(height: 20.h),
        // Tab Selection (6 Month, 12 Months, Lifetime)
        _buildTabSelection(),
        SizedBox(height: 20.h),
        // Statistics List
        _buildStatistics(),
      ],
    );
  }

  Widget _buildNextMeetingCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2E5BFF), Color(0xFF1E40AF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Next Meeting',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            'Tuesday, October 29, 24',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Meeting : In-Person',
            style: TextStyle(fontSize: 14.sp, color: Colors.white),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#10.48m',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Speakers : 0',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              Text(
                'Visitors : 1',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabSelection() {
    final List<String> tabs = ['6 Month', '12 Months', 'Lifetime'];

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
      {'label': 'Revenue Received To My Business:', 'value': '108429800'},
      {'label': 'Referrals Received:', 'value': '77'},
      {'label': 'TYFCB Given:', 'value': '27505571'},
      {'label': 'Referrals Given:', 'value': '116'},
      {'label': 'Visitor:', 'value': '10'},
      {'label': 'One-to-Ones:', 'value': '47'},
      {'label': 'CEUs:', 'value': '0'},
    ];

    return Column(
      children: stats.map((stat) {
        return Container(
          margin: EdgeInsets.only(bottom: 1.h),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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

  // DASHBOARD CONTENT (extracted lower part from dashboard screen)
  Widget _buildDashboardContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tab Selection (12 Months, Lifetime)
        _buildDashboardTabSelection(),
        SizedBox(height: 20.h),
        // Statistics List
        _buildDashboardStatistics(),
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
      ],
    );
  }

  Widget _buildDashboardTabSelection() {
    final List<String> tabs = ['12 Months', 'Lifetime'];
    int selectedTabIndex = 0; // Default to "12 Months"

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

  Widget _buildDashboardStatistics() {
    final List<Map<String, String>> stats = [
      {
        'label': 'Gratitude For Business Received (GBR slip)',
        'value': '108429800',
      },
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

          _buildFormField(controller: _addressController, hintText: 'Address'),
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

  // Email My Alliance Section
  Widget _buildEmailMyAlliance() {
    // Sample alliance members data
    final List<Map<String, String>> allianceMembers = [
      {'name': 'Rajesh Kumar', 'email': 'rajesh.kumar@gmail.com'},
      {'name': 'Salman Khan', 'email': 'salman.khan@gmail.com'},
      {'name': 'Raj Tiwari', 'email': 'raj.tiwari@gmail.com'},
      {'name': 'Manoj Mathur', 'email': 'manoj.mathur@gmail.com'},
      {'name': 'Rahul Rana', 'email': 'rahul.rana@gmail.com'},
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
          ...allianceMembers
              .map((member) => _buildAllianceMemberCard(member))
              .toList(),
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
                  style: TextStyle(fontSize: 12.sp, color: Colors.black54),
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
                    style: TextStyle(fontSize: 12.sp, color: Colors.black54),
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
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 12.w,
                  ),
                  color: const Color(0xFFEEEEEE),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: _buildTableHeaderCell('Event Title'),
                      ),
                      Expanded(
                        flex: 2,
                        child: _buildTableHeaderCell('Event Date & Time'),
                      ),
                      Expanded(
                        flex: 2,
                        child: _buildTableHeaderCell('Event Location'),
                      ),
                      Expanded(
                        flex: 1,
                        child: _buildTableHeaderCell('Details'),
                      ),
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
              style: TextStyle(fontSize: 12.sp, color: Colors.black87),
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
            children: [_buildEducationVideoCard(), _buildEducationVideoCard()],
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
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
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
                  style: TextStyle(fontSize: 10.sp, color: Colors.white70),
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

  // Alliance request statuses for main screen
  List<String> allianceRequestStatuses = List.generate(6, (index) => 'pending');
  
  void _acceptAllianceRequest(int index) {
    print('🟢 MAIN SCREEN - ACCEPT REQUEST CALLED - Index: $index');
    setState(() {
      allianceRequestStatuses[index] = 'accepted';
    });
    print('✅ MAIN SCREEN - Status changed to: ${allianceRequestStatuses[index]}');
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('✅ Request Accepted in Main Screen!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }
  
  void _rejectAllianceRequest(int index) {
    print('🔴 MAIN SCREEN - REJECT REQUEST CALLED - Index: $index');
    setState(() {
      allianceRequestStatuses[index] = 'rejected';
    });
    print('❌ MAIN SCREEN - Status changed to: ${allianceRequestStatuses[index]}');
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('❌ Request Rejected in Main Screen'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }
  
  void _openAllianceMessage() {
    print('💬 MAIN SCREEN - MESSAGE BUTTON CLICKED');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('💬 Opening message from Main Screen...'),
        backgroundColor: const Color(0xFF2E5BFF),
        duration: Duration(seconds: 2),
      ),
    );
  }

  // ALLIANCE CONTENT (UPDATED with working buttons)
  Widget _buildAllianceContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Pending Request Section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pending Request',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {
                print('📤 Send Request button clicked');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('📤 Send Request clicked!'),
                    backgroundColor: const Color(0xFF2E5BFF),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: Text(
                'Send Request',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFF2E5BFF),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        // List of Pending Requests
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6, // Example count
          itemBuilder: (context, index) {
            return _buildMainScreenPendingRequestItem(index);
          },
        ),
      ],
    );
  }

  Widget _buildMainScreenPendingRequestItem(int index) {
    String status = allianceRequestStatuses[index];
    print('📋 MAIN SCREEN - Building item $index with status: $status');
    
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              // Top Row - Profile Info
              Row(
                children: [
                  CircleAvatar(
                    radius: 30.w,
                    backgroundImage: const AssetImage(
                      'lib/assets/images/women.jpg',
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shilpa Mehta',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Wordpress Developer',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'Noida, Uttar Pradesh, India',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 16.h),
              
              // Bottom Row - Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (status == 'pending') ...
                    _buildMainScreenPendingButtons(index)
                  else if (status == 'accepted')
                    _buildMainScreenAcceptedButton()
                  else if (status == 'rejected')
                    _buildMainScreenRejectedBadge(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  List<Widget> _buildMainScreenPendingButtons(int index) {
    return [
      // Accept Button
      ElevatedButton.icon(
        onPressed: () => _acceptAllianceRequest(index),
        icon: Icon(
          Icons.check_circle,
          size: 18.sp,
          color: Colors.white,
        ),
        label: Text(
          'Accept',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 8.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          elevation: 2,
        ),
      ),
      
      SizedBox(width: 12.w),
      
      // Reject Button
      ElevatedButton.icon(
        onPressed: () => _rejectAllianceRequest(index),
        icon: Icon(
          Icons.cancel,
          size: 18.sp,
          color: Colors.white,
        ),
        label: Text(
          'Reject',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 8.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          elevation: 2,
        ),
      ),
      
    ];
  }

  Widget _buildMainScreenAcceptedButton() {
    return ElevatedButton.icon(
      onPressed: _openAllianceMessage,
      icon: Icon(
        Icons.message,
        size: 18.sp,
        color: Colors.white,
      ),
      label: Text(
        'Message',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2E5BFF),
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
        elevation: 3,
      ),
    );
  }

  Widget _buildMainScreenRejectedBadge() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: Colors.red.withOpacity(0.5),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.block,
            color: Colors.red,
            size: 16.sp,
          ),
          SizedBox(width: 4.w),
          Text(
            'Rejected',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.red,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // POST CONTENT (extracted from post screen)
  Widget _buildPostContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Create Post Section
        Text(
          'Create Post',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10.h),
        Card(
          margin: EdgeInsets.zero,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20.w,
                      backgroundImage: const AssetImage(
                        'lib/assets/images/profile.jpg',
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'IBAL Wakefield',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 0,
                              groupValue: 0, // Placeholder
                              onChanged: (value) {},
                              visualDensity: VisualDensity(
                                horizontal: -4,
                                vertical: -4,
                              ), // Compact radio button
                            ),
                            Text(
                              'Show Everyone',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            Radio(
                              value: 1,
                              groupValue: 0, // Placeholder
                              onChanged: (value) {},
                              visualDensity: VisualDensity(
                                horizontal: -4,
                                vertical: -4,
                              ), // Compact radio button
                            ),
                            Text(
                              'Only Connection',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Type Your Story..',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_photo_alternate, size: 40.w),
                        Text('Add Photos', style: TextStyle(fontSize: 14.sp)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Post
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E5BFF),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'Post',
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
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
              padding: EdgeInsets.only(
                top: 50.h,
                left: 20.w,
                right: 20.w,
                bottom: 20.h,
              ),
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
                      CircleAvatar(
                        radius: 30.r,
                        backgroundImage: const AssetImage(
                          'lib/assets/images/profile.jpg',
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Name',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'IBA Member',
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
                  _buildDrawerItem('Home', Icons.home, () {
                    setState(() {
                      selectedIndex = 0;
                    });
                    Navigator.pop(context);
                  }),
                  _buildDrawerItem('Dashboard', Icons.dashboard, () {
                    setState(() {
                      selectedIndex = 1;
                    });
                    Navigator.pop(context);
                  }),
                  _buildDrawerItem('Alliance', Icons.people, () {
                    setState(() {
                      selectedIndex = 2;
                    });
                    Navigator.pop(context);
                  }),
                  _buildDrawerItem('Post', Icons.grid_view, () {
                    setState(() {
                      selectedIndex = 3;
                    });
                    Navigator.pop(context);
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
                    leading: Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 24.w,
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.white,
                    ),
                    children: [
                      _buildDrawerSubItem('Reset Password', () {
                        // Navigate to reset password screen
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.resetPassword,
                        );
                      }),
                      _buildDrawerSubItem('Privacy Settings', () {
                        // TODO: Navigate to privacy settings screen
                        Navigator.pop(context);
                        // You can add navigation to privacy settings screen here when implemented
                      }),
                    ],
                  ),
                  _buildDrawerItem('Logout', Icons.logout, () {
                    // Navigate to login screen and clear navigation stack
                    Navigator.pushReplacementNamed(context, AppRoutes.login);
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
                    style: TextStyle(color: Colors.white70, fontSize: 12.sp),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    '|',
                    style: TextStyle(color: Colors.white70, fontSize: 12.sp),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    'Privacy Policy',
                    style: TextStyle(color: Colors.white70, fontSize: 12.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white, size: 24.w),
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
          style: TextStyle(color: Colors.white70, fontSize: 14.sp),
        ),
        onTap: onTap,
      ),
    );
  }
}
