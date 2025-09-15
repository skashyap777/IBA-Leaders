import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iba/constants/app_constants.dart';
import 'package:iba/constants/app_routes.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

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
                      backgroundImage: const AssetImage(
                        'lib/assets/images/women.jpg',
                      ),
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
                    _buildIconMenuItem(context, Icons.people, 'Alliance'),
                    _buildIconMenuItem(
                      context,
                      Icons.grid_view,
                      'Post',
                      isActive: true,
                    ), // Post is active
                  ],
                ),
                SizedBox(height: 20.h),
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
                                'lib/assets/images/women.jpg',
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shilpa Mehta',
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
                                Text(
                                  'Add Photos',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
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
                              backgroundColor: AppConstants.primaryBlue,
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            child: Text(
                              'Post',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconMenuItem(
    BuildContext context,
    IconData icon,
    String label, {
    bool isActive = false,
  }) {
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
            child: Icon(icon, color: Colors.white, size: 25.w),
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
}
