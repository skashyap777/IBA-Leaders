import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iba/constants/app_constants.dart';
import 'package:iba/constants/app_routes.dart';

class AllianceScreen extends StatelessWidget {
  const AllianceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi Your Name,',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'IBAL Wakefield',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Renewal Due Date: 20 Sep 2025',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 30.w,
                      backgroundImage:
                          const AssetImage('lib/assets/images/women.jpg'),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                // Search Bar
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Member',
                      border: InputBorder.none,
                      icon: Icon(Icons.search, size: 24.w, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                // Icon Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildIconMenuItem(context, Icons.home, 'Home'),
                    _buildIconMenuItem(context, Icons.dashboard, 'Dashboard'),
                    _buildIconMenuItem(context, Icons.people, 'Alliance',
                        isActive: true), // Alliance is active
                    _buildIconMenuItem(context, Icons.grid_view, 'Post'),
                  ],
                ),
                SizedBox(height: 20.h),
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
                        // Handle Send Request
                      },
                      child: Text(
                        'Send Request',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppConstants.primaryBlue,
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
                    return _buildPendingRequestItem();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconMenuItem(BuildContext context, IconData icon, String label,
      {bool isActive = false}) {
    return GestureDetector(
      onTap: () {
        if (!isActive) {
          String routeName;
          switch (label) {
            case 'Home':
              routeName = AppRoutes.home;
              break;
            case 'Dashboard':
              routeName = AppRoutes.dashboard;
              break;
            case 'Alliance':
              routeName = AppRoutes.allianceScreen;
              break;
            case 'Post':
              routeName = AppRoutes.postScreen;
              break;
            default:
              return;
          }
          Navigator.pushReplacementNamed(context, routeName);
        }
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 25.w,
            backgroundColor: isActive ? AppConstants.primaryBlue : Colors.blue,
            child: Icon(
              icon,
              color: Colors.white,
              size: 25.w,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              color: isActive ? AppConstants.primaryBlue : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPendingRequestItem() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.w,
              backgroundImage:
                  const AssetImage('lib/assets/images/women.jpg'), // Use the provided image
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shilpa Mehta',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Wordpress Developer',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    'Noida, Uttar Pradesh, India',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 15.w,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.check, color: Colors.white, size: 15.w),
                ),
                SizedBox(width: 10.w),
                CircleAvatar(
                  radius: 15.w,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.delete, color: Colors.white, size: 15.w),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}