import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:learn_programming/models/institutes_card_model.dart';

class Institutes extends StatelessWidget {
  const Institutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: SizedBox(
        height: 170.0,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return SizedBox(
              width: 180.0,
              child: Card(
                elevation: 0.5,
                color:  Color(0xFFF6F9FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  splashColor: Color(0xFFFDD807),
                  highlightColor: Colors.grey,
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(institutes[index].image,
                            width: 80.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                              institutes[index].name,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(right:10.0),
          ),
          itemCount: institutes.length,
        ),
      ).animate().fade(duration: 600.ms),
    );
  }
}
