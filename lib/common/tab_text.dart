import 'package:flutter/material.dart';
import 'package:our_lives/styleguides/text_styles.dart';

class TabText extends StatelessWidget {
	final String text;
	final bool isSelected;
	Function onTabTap;

	TabText({this.text, this.isSelected = false, this.onTabTap});

  	@override
  	Widget build(BuildContext context) {
    	return Transform.rotate(
			angle: -1.58,
			child: InkWell(
				onTap: onTabTap,
				child: Text(
    	  			text,
            		style: isSelected ? selectedTabStyle : defaultTabStyle
    	  		),
			),
    	);
  	}
}