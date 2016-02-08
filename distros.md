# Which Python?

> Gentlemen, choose your weapons.
> 
>   *- A Night in Casablanca*

**Youngstar:** I've been thinking of using PyPy for my new project, I heard it's
super fast.

**Graybeard:** Before we get into that, let's take a step back. Why use Python?

**Youngstar:** Seriously? Coming from you?

**Graybeard:** Programming languages are tools, not religion like some people
tend to make them.

**Youngstar:** And if all you have is a hammer...

**Graybeard:** Exactly. You have some experience with other languages.

**Youngstar:** Mainly thanks to you.

**Graybeard:** So again, why Python?

**Youngstar:** I'm most productive with Python. Going from zero to working is
fastest.

**Graybeard:** OK, so speed of development. Which is important in a startup.
What else?

**Youngstar:** There are many great packages I can use.

**Graybeard:** Yes, a good ecosystem. Audry Tang said that "perl5 is just
syntax; CPAN is the language". I believe this is true for Python as well.

**Youngstar:** CPAN is Perl's [pypi][pypi]?

**Graybeard:** Yes. What other reasons do you have for choosing Python?

**Youngstar:** It's open source?

**Graybeard:** And why is that a good thing?

**Youngstar:** It means nobody can take it away from me, change license. And
worse case, I can fix bugs before a release.

**Graybeard:** Yup. Gimme one more.

**Youngstar:** Oh, the community is great. People are usually nice and helpful,
and there are a lot of articles and videos out there.

**Graybeard:** Right. Now let's try to think of places where you won't use
Python, it'll help clarify some things.

**Youngstar:** Embedded?

**Graybeard:** You mean small devices or real time requirements?

**Youngstar:** I guess both.

**Graybeard:** Yeah, it's hard to fit Python on small devices. However it's
possible and [MicroPython][mp] does a good job.

**Youngstar:** I've never heard about MicroPython, I'll take a look.

**Graybeard:** As for real time - most garbage collected languages don't fit the
bill. Anything else Python's not good for?

**Youngstar:** I guess if you need a lot of formal checking of your system.

**Graybeard:** Yea. This leads me to what I call "the cost of error" which has
implication on many areas of the development and business. For example, [Jane
Street][jst] is a trading company who uses [OCaml][ocaml] - they claim it
helps them make sure their code is correct.

**Youngstar:** I guess that in trading systems you feel the pain of bugs
right away.

**Graybeard:** Yeah, ask someone from [Knight capital][kcap] once. Oh the other
hand, I worked in an HFT[^hft] firm once and we used Python *and* made money.

**Youngstar:** Yeah, yeah - we all heard your war stories many times.

**Graybeard:** Be nice to your elders. Anything else did we miss?

**Youngstar:** I can't think of anything else - do tell.

**Graybeard:** Hiring is one.

**Youngstar:** You mean finding programmers?

**Graybeard:** Yes, try to recruit some good [Haskell][haskell] programmers
sometime.

**Youngstar:** Try recruiting good programmers in any lanauge.

**Graybeard:** Right. Remind me what your startup is all about.

**Youngstar:** It's a backend thingie with REST API.

**Graybeard:** Seriously? This is almost as bad as "It doesn't work!" bug
reports. However it'll do for now. Looks like Python is a good fit for you.

**Youngstar:** What a surprise...

**Graybeard:** Huh! Now let's try to see which Python. What Python distributions
do you know.

**Youngstar:** There's [CPython][cpy], [Jython][jpy], [IronPython][irpy],
[PyPy][pypy] and now I know of [MicroPython][mp]. Oh and there's the subject of
Python 2 and Python 3.

**Graybeard:** IronPyton is for .NET shops, which you're not. Jython is for Java
shops or you need to use Java libraries - and I don't this is your case either.

**Youngstar:** And I'm running on hosted servers so MicroPython is not for me as
well.

**Graybeard:** When will you want to use PyPy?

**Youngstar:** For the speed?

**Graybeard:** TANSTAAFL

**Youngstar:** Gesundheit!

**Graybeard:** It's an acronym for "there is no such thing as a free lunch".
What's the downside of using PyPy?

**Youngstar:** Well, packages I guess. Not all of them support PyPy.

**Graybeard:** Yes. Going off mainstream has it's down side.

**Youngstar:** Says the man who uses [archlinux][arch].

**Graybeard:** Trust me, there are days I regret it. But most days I'm very
happy - it fits my preferences. Which is exactly what the Python you choose
should do for you. So let me ask you - what are your speed requirements?

**Youngstar:** The faster the better?

**Graybeard:** Then why not pick assembly as your programming language?

**Youngstar:** I see what you mean. I need write some business requirements and
then see if Python fits them. I have a hunch it will.

**Graybeard:** In God we trust; all others must bring data.

**Youngstar:** Good one, yours?.

**Graybeard:** Not mine - W. Edwards Deming's.

**Youngstar:** I'll spec and measure. Now let's talk on Python 2 vs
Python 3.

**Graybeard:** OK. Python 3 is the future, choose it.

**Youngstar:** That was easy. Should I tell it to all the people who still use
Python 2?

**Graybeard:** There are many good reasons to keep using Python 2.

**Youngstar:** Because you're and old fossil who can't change?

**Graybeard:** Get off my lawn!

**Youngstar:** Sure, can I finish my beer first?

**Graybeard:** Funny. You might find yourself using Python 2 eventually.

**Youngstar:** Because of dependencies?

**Graybeard:** I'd say this is the main reason. However the situation has
improved significantly in the last couple of year. If you head over to [Python 3
Wall of Superpowers][sp] (which used to be call "Python 3 Wall of Shame") you'll
see mostly green now, which means most "top downloaded" packages support Python
3 now.

**Youngstar:** What other reason are there? Legacy code?

**Graybeard:** You won't believe how fast the new cool code you wrote a while
ago becomes legacy code. Most of our time we improve existing code, not write
new stuff. If you already have a decent code base, writing new code from scratch
is a dangerous thing. Read "[Things You Should Never Do][notdo]" once.

**Youngstar:** *How* do you find the time to read all of these things?

**Graybeard:** I don't have time not to. But this is something for later
conversation. Another thing you learn with experience is to appreciate things
that work. Zach Holman, then at github, said "Your product should be cutting
edge, not your tech ... stability is sexy."

**Youngstar:** I wonder how we make progress then.

**Graybeard:** Sometimes the advantages of new technology overweigh the risk.
Also, people are way too optimistic to their own good.

**Youngstar:** OK then, it's getting to the point where my boyfriend will get
jealous of you.  Final recommendation?

**Graybeard:** Don't be lazy, do your homework and find the right Python for
you.  Note that switching from one Python to another shouldn't be that
difficult. At one place we had to switch from Python 3 to 2 due to dependency
issue, it took us about half a day to do that.

**Youngstar:** So the decision is not that crucial?

**Graybeard:** It is, don't take it lightly. We were lucky the switch was easy, you
might not be.

I> ## Summary
I> * Choose CPython 3.x of you have a new project with not many dependencies
I>     * Python 3 is the future
I> * Choose CPython 2.x if you have older code base or dependencies that does
I>   not support Python 3
I> * Choose Jython][jpy] if you need interaction with Java
I>     * Or if you're in a Java shop and want to sneak Python in the back door
I>       ;)
I> * Similarly, choose [IronPyton][irpy] if you need
I>   interaction with .NET
I> * Choose [pypy][pypy] if you need some speed and love living on the edge
I> * Use [Anaconda][ana] distribution if you use a lot of scientific Python
I>   packages

[^hft]: High Frequency Trading

[ana]: https://store.continuum.io/cshop/anaconda/
[arch]: https://www.archlinux.org/
[cpy]: http://www.python.org/
[haskell]: https://www.haskell.org/
[irpy]: http://ironpython.net/
[jpy]: http://www.jython.org/
[jst]: https://www.janestreet.com/
[kcap]: https://en.wikipedia.org/wiki/Knight_Capital_Group#2012_stock_trading_disruption
[mp]: https://micropython.org/
[notdo]: http://www.joelonsoftware.com/articles/fog0000000069.html
[ocaml]: https://ocaml.org/
[pypi]: https://pypi.python.org/
[pypy]: http://pypy.org/
[sp]: https://python3wos.appspot.com/

{::comment}
vim: ft=markdown spell
{:/comment}
