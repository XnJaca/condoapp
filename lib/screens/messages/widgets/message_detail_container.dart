import 'package:condo_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MessageDetailContainer extends StatelessWidget {
  final String subject;
  final String senderName;
  final String messageDate;

  const MessageDetailContainer({
    required this.subject,
    required this.senderName,
    required this.messageDate,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.7,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          // color: Color.fromARGB(255, 255, 255, 255),
          padding: const EdgeInsets.all(16),
          //Shadow bottom
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                spreadRadius: -5,
                blurRadius: 8,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subject,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryLight,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.person,
                              color: AppTheme.primaryRed,
                            ),
                            const SizedBox(width: 4),
                            Text(senderName),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppTheme.primaryLight,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: AppTheme.secondaryGreen,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    messageDate,
                    style: const TextStyle(
                        fontSize: 12, color: AppTheme.secondaryGreen),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
