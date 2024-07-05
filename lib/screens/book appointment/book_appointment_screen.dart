import 'package:flutter/material.dart';
import 'package:likhit/style/text_style.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hours'),
      ),
      body:Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sunday', style: AppTextStyles.kBody17RegularTextStyle,),
                      Text('Closed',style: TextStyle(fontSize: 17, color: Colors.orange.shade300)),
                    ],
                  ),
                  SizedBox(width: 250,),
                  Icon(Icons.edit)
                ],
              ),
              SizedBox(height: 7,),
              Row(
                children: [
                  SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Monday', style: AppTextStyles.kBody17RegularTextStyle,),
                      Text('10:00am 12:00pm',style: TextStyle(fontSize: 17, color: Colors.orange.shade300)),
                    ],
                  ),
                  SizedBox(width: 205,),
                  Icon(Icons.edit)
                ],
              ),
              SizedBox(height: 7,),
              Row(
                children: [
                  SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tuesday', style: AppTextStyles.kBody17RegularTextStyle,),
                      Text('1:00pm 3:pm',style: TextStyle(fontSize: 17, color: Colors.orange.shade300)),
                    ],
                  ),
                  SizedBox(width: 242,),
                  Icon(Icons.edit)
                ],
              ),
              SizedBox(height: 7,),
              Row(
                children: [
                  SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Wednesday', style: AppTextStyles.kBody17RegularTextStyle,),
                      Text('2:00pm 5:00pm',style: TextStyle(fontSize: 17, color: Colors.orange.shade300)),
                    ],
                  ),
                  SizedBox(width: 210,),
                  Icon(Icons.edit)
                ],
              ),
              SizedBox(height: 7,),
              Row(
                children: [
                  SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Thursday', style: AppTextStyles.kBody17RegularTextStyle,),
                      Text('10:00am 12:00pm',style: TextStyle(fontSize: 17, color: Colors.orange.shade300)),
                    ],
                  ),
                  SizedBox(width: 210,),
                  Icon(Icons.edit)
                ],
              ),
              SizedBox(height: 7,),
              Row(
                children: [
                  SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Friday', style: AppTextStyles.kBody17RegularTextStyle,),
                      Text('2:00pm 5:oopm',style: TextStyle(fontSize: 17, color: Colors.orange.shade300)),
                    ],
                  ),
                  SizedBox(width: 225,),
                  Icon(Icons.edit)
                ],
              ),
              SizedBox(height: 7,),
              Row(
                children: [
                  SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Saturday', style: AppTextStyles.kBody17RegularTextStyle,),
                      Text('3:00pm 5:00pm',style: TextStyle(fontSize: 17, color: Colors.orange.shade300)),
                    ],
                  ),
                  SizedBox(width: 225,),
                  Icon(Icons.edit)
                ],
              ),
              SizedBox(height: 50,),
              Row(
                children: [
                  SizedBox(width: 12,),
                  ElevatedButton(onPressed: (){}, child: Text('Edit all hours', style: AppTextStyles.kBody15SemiBoldTextStyle,)),
                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: (){}, child: Text('Edit Mon - Sat', style: AppTextStyles.kBody15SemiBoldTextStyle,))
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  SizedBox(width: 110,),
                  ElevatedButton(onPressed: (){}, child: Text('Edit Sunday', style: AppTextStyles.kBody15SemiBoldTextStyle,)),
                ],
              )

            ],
          )
        ],
      ),
    );
  }
}
