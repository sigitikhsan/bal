import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class MenuCard extends StatelessWidget {

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      child: ListTile(

        leading: CircleAvatar(

          backgroundColor: AppColors.primary.withOpacity(.12),

          child: Icon(
            icon,
            color: AppColors.primary,
          ),

        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(subtitle),

        trailing: const Icon(Icons.arrow_forward_ios,size:16),

        onTap: onTap,

      ),

    );

  }

}