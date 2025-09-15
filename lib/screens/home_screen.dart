// home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 1; // Default to "12 Months" as shown in original

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
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

              // Next Meeting Card
              _buildNextMeetingCard(),
              SizedBox(height: 20.h),

              // Tab Selection (6 Month, 12 Months, Lifetime)
              _buildTabSelection(),
              SizedBox(height: 20.h),

              // Statistics List
              _buildStatistics(),
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
        Icon(Icons.menu, size: 24.w, color: const Color(0xFF2E5BFF)),
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
      {'icon': Icons.home, 'label': 'Home', 'isActive': true},
      {'icon': Icons.dashboard, 'label': 'Dashboard', 'isActive': false},
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
            if (index == 1) { // Dashboard
              Navigator.pushNamed(context, AppRoutes.dashboard);
            } else if (index == 3) { // Post
              Navigator.pushNamed(context, AppRoutes.postScreen);
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
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }).toList(),
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
}
