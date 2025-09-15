import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_routes.dart';
import '../constants/app_constants.dart';
import '../screens/home_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/alliance_screen.dart';
import '../screens/post_screen.dart';

class MainLayout extends StatefulWidget {
  final Widget child;
  final int currentIndex;

  const MainLayout({
    Key? key,
    required this.child,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
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
                ],
              ),
            ),
            // Content Area
            Expanded(
              child: widget.child,
            ),
          ],
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
      {'icon': Icons.home, 'label': 'Home', 'index': 0},
      {'icon': Icons.dashboard, 'label': 'Dashboard', 'index': 1},
      {'icon': Icons.people, 'label': 'Alliance', 'index': 2},
      {'icon': Icons.grid_view, 'label': 'Post', 'index': 3},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: navItems.map((item) {
        final bool isActive = item['index'] == _currentIndex;
        return GestureDetector(
          onTap: () {
            if (!isActive) {
              setState(() {
                _currentIndex = item['index'];
              });
              switch (item['label']) {
                case 'Home':
                  Navigator.pushReplacementNamed(context, AppRoutes.home);
                  break;
                case 'Dashboard':
                  Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
                  break;
                case 'Alliance':
                  Navigator.pushReplacementNamed(context, AppRoutes.allianceScreen);
                  break;
                case 'Post':
                  Navigator.pushReplacementNamed(context, AppRoutes.postScreen);
                  break;
              }
            }
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
}