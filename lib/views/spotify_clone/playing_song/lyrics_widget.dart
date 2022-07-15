import 'package:flutter/material.dart';
import 'package:high_in_flutter/configs/app_colors.dart';
import 'package:high_in_flutter/configs/utils.dart';

class LyricsWidget extends StatelessWidget {
  const LyricsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Text(
                "Lyrics",
                style: appTextStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              const MoreWidget(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            """
When I'm away from you, I'm happier than ever
Wish I could explain it better
I wish it wasn't true
Give me a day or two to think of something clever
To write myself a letter
To tell me what to do, mm-mmm
Do you read my interviews?
Or do you skip my avenue? (My avenue)
When you (when you) said you were passing through
Was I even on your way?
I knew when I asked you to (when I asked you to)
Be cool about what I was telling you
You'd do the opposite of what you said you'd do (what you said you'd do)
And I'd end up more afraid
Don't say it isn't fair
You clearly weren't aware that you made me miserable
So if you really wanna know
When I'm away from you (when I'm away from you)
I'm happier than ever (happier than ever)
Wish I could explain it better (wish I could explain it better)
I wish it wasn't true (wish it wasn't true), mmm-hmm
You call me again, drunk in your Benz
Driving home under the influence
You scared me to death, but I'm wasting my breath
'Cause you only listen to your fucking friends
I don't relate to you
I don't relate to you, no
'Cause I'd never treat me this shitty
You made me hate this city
And I don't talk shit about you on the internet
Never told anyone anything bad
'Cause that shit's embarrassing, you were my everything
And all that you did was make me fucking sad
So don't waste the time I don't have
And don't try to make me feel bad
I could talk about every time that you showed up on time
But I'd have an empty line 'cause you never did
Never paid any mind to my mother or friends
So I shut 'em all out for you 'cause I was a kid
You ruined everything good
Always said you were misunderstood
Made all my moments your own
Just fucking leave me alone
""",
            style: appTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}

class MoreWidget extends StatelessWidget {
  const MoreWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.darkBrown,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(children: [
        Text(
          "MORE",
          style:
              appTextStyle.copyWith(fontSize: 10, fontWeight: FontWeight.w500),
        ),
        const Icon(
          Icons.open_in_full,
          size: 12,
          color: Colors.white,
        ),
      ]),
    );
  }
}
