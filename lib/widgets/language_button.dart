import 'package:flutter/material.dart';

class Languages extends StatelessWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235.0,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return SizedBox(
              width: 220.0,
              child: Card( 
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {},
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(right:10.0),
          ),
        itemCount: 5,
      ),
    );
  }
}
