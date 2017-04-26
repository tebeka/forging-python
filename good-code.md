# Writing Good Code

> Always code as if the guy who ends up maintaining your code will be a violent
> psychopath who knows where you live.
> 
> *- Bill Mitchell*

**Youngstar:** Your code is always easy to read and maintain. How do you do it?

**Graybeard:** Thanks! It took me a lot of time and practice to get there. And
I'm still improving.

**Youngstar:** That's a long journey, I don't have so much time. Can you share
some of the highlights?

**Graybeard:** Will do, but you need to keep improving.

**Youngstar:** Yeah, yeah - I'll "sharpen my axe".

**Graybeard:** Good girl! The main theme is simplicity.

**Youngstar:** Like in KISS[^kiss]?

**Graybeard:** Somewhat. As developers, we spend most of our time reading code,
not writing it.

**Youngstar:** Which means it need to be readable.

**Graybeard:** Exactly.

**Youngstar:** OK, so how do I write readable code?

**Graybeard:** By rewriting. I see the first iterations of code I write as
[sketches][sketch].

**Youngstar:** How do I find time to write several iterations of code? 

**Graybeard:** I don't think you can afford not to. As someone said: "The worst
thing you can do to your code is to stop writing it the first time it works.".

%% FIXME: Find quote

Also Fred Brooks said: "plan to throw one away; you will, anyhow." Which means
it'll happen any way.

**Youngstar:** Is this from [The Mythical Man Month][tmmm]? That's an old book.

**Graybeard:** It's old but about people, and people haven't changed that much
since it was written.

**Youngstar:** We haven't changed a lot in the last 10,000 years. Back on track,
what else will help me write good code?

**Graybeard:** Reading good code.

**Youngstar:** Where will I find that? I know where to find bad code - it's
everywhere.

**Graybeard:** Not everywhere. There are a few places where you can see amazing
code. For example, almost everything written by Peter Norvig.

**Youngstar:** Yes, I've seen his [spell checker][spell], it's awesome!

**Graybeard:** It is. There also some good code and advice in the [ASOA
book][asoa].

**Youngstar:** Oh, I read some chapters. The one [Berkely DB][bdb] was good.
I'll keep on reading this book.

**Graybeard:** Yup, and along the way you'll find people to follow and read
their code. You might even find a good mentor.

**Youngstar:** That I have. Though he's getting old.

**Graybeard:** Like wine, I get better with age.

**Youngstar:** You keep telling yourself that. Anything else about writing good
code.

**Graybeard:** Read bad code.

**Youngstar:** Learn from other people mistakes?

**Graybeard:** Yes, but also look out for things you do. From time to time I go
and read ["How to Write Unmaintainable Code"][unmaintain] and try to see if I do
anything they say there in my code.

**Youngstar:** OK, will pay it a visit. What else?

**Graybeard:** What code does not have any bugs?

**Youngstar:** Eh... none?

**Graybeard:** Exactly!

**Youngstar:** You lost me there grandpa.

**Graybeard:** The code you don't write, or delete.

**Youngstar:** Oh. It's also the fastest.

**Graybeard:** Exactly. In a way [code is our enemy][enemy], we'd like to have
less of it.

**Youngstar:** Can you give me an example?

**Graybeard:** Sure. Assume you're asked to process some data in Excel files.
This will require you to install an external library to read excel (such as
[xlrd][xlrd]). However if you ask them to send over the files in CSV format -
there's already a [csv][csv] module in Python. No need to install and maintain
third-party packages.

**Youngstar:** I see.

**Graybeard:** Also, a lot of times after awhile and due to specification
changes - you have code that does nothing. Make sure to delete it. One of my
most productive days was deleting few thousand lines of unused code.

**Youngstar:** How did that happen?

**Graybeard:** Specification changes, libraries came about that did the same
work ...

**Youngstar:** I start to see what you mean by "code is our enemy". What else?

**Graybeard:** Keep your functions short and with small number of parameters. A
good rule of thumb is no more than forty lines of code per function.

**Youngstar:** Forty? Doesn't seem much.

**Graybeard:** It not a law of nature, but it'll make your code nicer. It'll
make you *think* on small pieces of code which are easier to understand and
maintain.

**Youngstar:** Also avoid globals?

**Graybeard:** Yup. I like functional code since easier to reason about. However
you can't avoid state, [no matter how hard you try][monad].

**Youngstar:** Sometimes [TDD][tdd] helps with that.

**Graybeard:** Yes, especially when you start out. It forces you to write small
pieces of code that are easy to test. However Google for ["TDD is
dead"][tdd-dead] for some interesting discussion about TDD.

**Youngstar:** OK. Any more?

**Graybeard:** Did I tell you that old linguistics joke?

**Youngstar:** Old and linguistics? Must be a good one - do tell.

**Graybeard:** I'll make it brief. During the cold war the US created an
automatic system for translating from Russian to English. When the system was
ready they tested it by giving it English sentence, translate to Russian and
back. The input was "The spirit is willing but the flash is weak." and the
output was "The vodka is good but the mean is rotten."

**Youngstar:** Ha! Not that bad.

**Graybeard:** The secret is starting with low expectations.

**Youngstar:** OK, and how is this related to what we're talking about?

**Graybeard:** The idea is that every language has different way of saying the
same things. In Python we call it "pythonic code".

**Youngstar:** I heard that term before. Mostly with reference to the [Zen of
Python ][zen].

**Graybeard:** Good old Tim Peters, he is someone to learn from.

**Youngstar:** So learn how to speak the language?

**Graybeard:** Yes. A lot of people when they start write Java in Python, C in
Python etc... But you need to learn how to properly speak the language.

**Youngstar:** OK, will do. Any other advice?

**Graybeard:** The most important thing is to have a good mental mode of what
you do. You'll have people talking about building an [ontology][ontology], which
means figuring out how to talk about things.

**Youngstar:** The ["two hard things..."][two]?

**Graybeard:** Naming is important, especially in Python which is untyped.

**Youngstar:** It's also hard to get right.

**Graybeard:** Yeah, it usually takes me a couple of iterations until I get
names right. A red flag are generic names like "object", "other", ...

But back to ontology, it's important to define what "things" are. At a place I
worked we got a bug report that we count unique users wrong. The code seems OK
so my boss went to talk to people. Turned out we had four different definitions
of "unique users" in the company.

**Youngstar:** Ouch. I see what you mean - it start before you code.

**Graybeard:** Sometimes things emerge as you write the code, then you need to
revise your model.

**Youngstar:** OK, will do. Anything else?

**Graybeard:** There are may rules to follow - DRY[^dry], SPOT[^spot],
minimizing coupling ... You'll find them as you go.

**Youngstar:** Any reference?

**Graybeard:** There good summary in ["The Art of Unix Programming"][taoup], and
may [other][prin-good] other places.

One trick you can do is see if you can understand your code [without the
comments][uncomment].

**Youngstar:** OK. I'll practice and read. More beer?

**Graybeard:** You keep asking these rhetorical questions.


I> ## TL;DR
I> * Have a good mental model
I> * Aim for readability
I> * Don't stop writing the first time the code works
I> * Read other people's code
I> * Find a mentor
I> * Learn how to speak the language

[^dry]: Do not repeat yourself
[^kiss]: Keep it simple, Stupid.
[^spot]: Single point of truth
[asoa]: http://aosabook.org/en/index.html
[bdb]: http://aosabook.org/en/bdb.html
[csv]: https://docs.python.org/3/library/csv.html
[enemy]: http://www.skrenta.com/2007/05/code_is_our_enemy.html
[monad]: https://wiki.haskell.org/Monad
[ontology]: https://en.wikipedia.org/wiki/Ontology
[prin-good]: http://www.artima.com/weblogs/viewpost.jsp?thread=331531
[sketch]: http://www.paulgraham.com/hp.html
[spell]: http://norvig.com/spell-correct.html
[taoup]: http://www.catb.org/esr/writings/taoup/html/ch01s06.html
[tdd-dead]: http://lmgtfy.com/?q=tdd+is+dead
[tdd]: https://en.wikipedia.org/wiki/Test-driven_development
[tmmm]: https://en.wikipedia.org/wiki/The_Mythical_Man-Month
[two]: http://martinfowler.com/bliki/TwoHardThings.html 
[uncomment]: http://bit.ly/2bu1ZGt
[unmaintain]: http://mindprod.com/jgloss/unmain.html
[xlrd]: https://pypi.python.org/pypi/xlrd
[zen]: https://www.python.org/dev/peps/pep-0020/
