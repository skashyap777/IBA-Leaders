import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItem {
  final String title;
  final String message;
  final String timestamp;
  final String profileImage;

  NotificationItem({
    required this.title,
    required this.message,
    required this.timestamp,
    required this.profileImage,
  });
}

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationItem> notifications = [
    NotificationItem(
      title: 'New Alliance Request',
      message: 'Shilpa Mehta sent you an alliance request.',
      timestamp: '2 hours ago',
      profileImage: 'lib/assets/images/women.jpg',
    ),
    NotificationItem(
      title: 'Meeting Reminder',
      message: 'Your next meeting is scheduled for tomorrow.',
      timestamp: '5 hours ago',
      profileImage: 'lib/assets/images/men.jpg',
    ),
    NotificationItem(
      title: 'Testimonial Received',
      message: 'You received a new testimonial from Rahul Rana.',
      timestamp: '1 day ago',
      profileImage: 'lib/assets/images/profile.jpg',
    ),
    NotificationItem(
      title: 'Event Update',
      message: 'IBA Leaders event details have been updated.',
      timestamp: '2 days ago',
      profileImage: 'lib/assets/images/logo.png',
    ),
  ];

  void _deleteNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF2E5BFF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_none,
                    size: 80.w,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'No notifications yet',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 12.h),
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 24.r,
                        backgroundImage: AssetImage(notification.profileImage),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notification.title,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              notification.message,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black54,
                                height: 1.4,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              notification.timestamp,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red, size: 20.w),
                        onPressed: () => _deleteNotification(index),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
