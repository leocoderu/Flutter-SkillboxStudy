import 'package:flutter/material.dart';
import 'package:model/model.dart';

class StaffCard extends StatelessWidget {
  const StaffCard({super.key, required this.user, this.card_number});
  final User user;
  final String? card_number;

  int _age(DateTime dt) {
    DateTime now = DateTime.now();
    int year = now.year - dt.year;
    if (year <= 0) return 0;        // Fuse
    if ((now.month < dt.month) || ((now.month == dt.month) && (now.day < dt.day))) year--;
    return year;
  }

  String dateToString(DateTime? dt) => dt != null
      ?'${dt.day < 10 ? '0' : ''}${dt.day}.${dt.month < 10 ? '0' : ''}${dt.month}.${dt.year} (${_age(dt).toString()} y.o.)' : '';

  @override
  Widget build(BuildContext context) {
    TextStyle h1 = TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,);
    TextStyle lh1 = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,);
    TextStyle h2 = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,);
    TextStyle lh2 = TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,);
    TextStyle h3 = TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,);
    TextStyle lh3 = TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold,);
    TextStyle t1 = TextStyle(fontSize: 15.0);
    TextStyle lt1 = TextStyle(fontSize: 12.0);
    final bool lowDisplay = (MediaQuery.of(context).size.width <= 390);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 10.0,
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: EdgeInsets.all(18.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    //color: Colors.purpleAccent,
                    width: double.infinity,
                    child: Text('${user.name} ${user.soname ?? ''}', style: lowDisplay ? lh1 : h1, textAlign: TextAlign.center),
                  ),
                  if (user.s_name != null)
                    Container(
                      //color: Colors.purple,
                      width: double.infinity,
                      child: Text('${user.s_name}', style: lowDisplay ? lh2 : h2, textAlign: TextAlign.center),
                    ),
                  Container(height: 15.0), //, color: Colors.yellow),
                  if (user.dateBirth != null)
                    Row(children: [
                        Text('Date of Birth: \t', style: lowDisplay ? lh3 : h3),
                        Text('${dateToString(user.dateBirth)}',style: lowDisplay ? lt1 : t1),
                    ]),
                  if (user.phone != null)
                    Padding(
                      padding: EdgeInsets.only(top: 3.0),
                      child: Row(children: [
                        Text('Phone number: \t', style: lowDisplay ? lh3 : h3),
                        Text('+${user.phone!.substring(0, 1)} (${user.phone!.substring(1, 4)}) ${user.phone!.substring(4, 7)}-${user.phone!.substring(7, 9)}-${user.phone!.substring(9, 11)}',style: lowDisplay ? lt1 : t1),
                      ]),
                    ),
                  if (card_number != null)
                  //if (user.card != null)
                    Padding(
                      padding: EdgeInsets.only(top: 3.0),
                      child: Row(children: [
                        Text('Debit card: \t', style: lowDisplay ? lh3 : h3),
                        Text('${card_number!.substring(0,4)} ${card_number!.substring(4,8)} ${card_number!.substring(8,12)} ${card_number!.substring(12,16)}',
                            style: lowDisplay ? lt1 : t1,
                        ),
                        // Text('${user.card!.substring(0,4)} ${user.card!.substring(4,8)} ${user.card!.substring(8,12)} ${user.card!.substring(12,16)}',
                        //   style: lowDisplay ? lt1 : t1,
                        // ),
                      ]),
                    ),
                ],
              ),
            ),
            SizedBox(width: 10.0),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
              height: lowDisplay ? 120.0 : 150.0,
              width: lowDisplay ? 80 : 100,
              child: (user.photo != null)
                  ? Image.network('${user.photo}', fit: BoxFit.cover,
                      errorBuilder: (context, exception, stack) {
                        return Image.asset('assets/image/not_available.png');
                      },
                    )
                  : Image.asset('assets/image/no_image.png'),
            ),
          ],
        ),
      ),
    );
  }
}
