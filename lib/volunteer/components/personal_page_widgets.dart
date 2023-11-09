import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/model/modelVolunteer.dart';
import 'package:ming_guang/volunteer/themes/main_theme.dart';
class TopWidget extends StatelessWidget {
  const TopWidget({
    super.key,
    required this.size,
    required this.volunteerPerson,
  });

  final Size size;
  final VolunteerPerson volunteerPerson;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.2,
        decoration: BoxDecoration(
          gradient: gradientDecoration,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: highlight.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: CircleAvatar(
                radius: size.width * 0.14, // Slightly smaller to fit the height of the container
                backgroundImage: AssetImage(volunteerPerson.imageUrl),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: size.width * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      volunteerPerson.name,
                      style: TextStyle(
                        fontSize: size.width * 0.05, // Adjust the font size relative to the screen width
                        fontWeight: FontWeight.bold,
                        color: highlight,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Row(
                      children: [
                        Icon(
                          Icons.home, // A home icon for the 'volunteer home'
                          color: Colors.grey,
                          size: size.width * 0.05,
                        ),
                        SizedBox(width: size.width * 0.01),
                        Expanded(
                          child: Text(
                            '欢迎来到志愿者之家!',
                            style: TextStyle(
                              fontSize: size.width * 0.035,
                            ),
                          ),
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
}


Widget buildDetailRow(IconData icon, String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Icon(icon, color: highlight,),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 18),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
