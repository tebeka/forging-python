# IDEs and Editors

> All mail clients suck. This one just sucks less.
> 
>   *- Michael R. Elkins* ([mutt website](http://www.mutt.org/))

**Youngstar:** What are you using to write Python code?

**Graybeard:** [Vim][vim], I use it for everything.

**Youngstar:** Cool, so I'll start using it.

**Graybeard:** Hold your horses. Mastering Vim is a long and sometimes a painful
experience. I've been using it for more than 15 years and I'm still learning.

**Youngstar:** Whoa! I don't have 15 years, I need to get productive now.

**Graybeard:** Since you're going to spend most of your time inside an
editor/IDE[^ide] - try to pick a good one and master it.

**Youngstar:** I know I'll regret this... But which one should I use?

**Graybeard:** It's not that simple, there are several factors you need to
consider. At the end, it's a matter of personal taste. Check out [the editor
war][edwar] sometime.

**Youngstar:** Editor war?

**Graybeard:** Yeah, some people get too passionate sometime.

**Youngstar:** OK. Let's start with what you're using. Why are you using Vim?

**Graybeard:** As I said - it takes time to master Vim and get used to its dual
editing mode. However once you've mastered Vim you'll be super productive with
it not just in Python but with almost any other language. Vim itself is pretty
bare-bones editor, but it has a rich plugin ecosystem which can transform it to
a powerful IDE. One of the main advantages (at least for backend developers like
me) is that on most Unix like systems - it's already there. Vim can work in
"terminal mode" which does not require a windowing system. This means you can
SSH to a box and start editing. Oh - and you can write Vim scripts in Python.

**Youngstar:** Isn't Vim old?

**Graybeard:** In tech old usually means working.

**Youngstar:** Ha! What's the other editor old developers use? The lispy one?

**Graybeard:** [Emacs][emacs]?

**Youngstar:** That's the one.

**Graybeard:** Emacs is a text editor that [does
everything][bf]. It has excellent Python support with
[python-mode](https://launchpad.net/python-mode) and many core Python developers
use it.

**Youngstar:** Then why don't you use it?

**Graybeard:** Since I picked the dark side of the editor war.

**Youngstar:** And something more modern?

**Graybeard:** Before going modern, I'd like to stress that both of these
editors [take a lot of work to master][lc]. But once you "get" them, both will
offer you things that most other editors or IDEs will not.

**Youngstar:** Noted, I'll invest some time learning one of them. Maybe emacs
just to annoy you.

**Graybeard:** I never get annoyed by stupid editors people pick.

**Youngstar:** Something more modern?

**Graybeard:** I'm seeing a lot of people using [PyCharm][pycharm] from
JetBrains the makers of IntelliJ. There also [PyDev][pydev] which sits on
top of Eclipse.

**Youngstar:** IntelliJ? Eclipse? Aren't those Java IDEs?

**Graybeard:** They started there, but now they are very powerful general
purpose IDEs. You will need Java to run them, and a lot of memory. A strong CPU
won't hurt as well.

**Youngstar:** And PyCharm/PyDev are the Python environment?

**Graybeard:** Yes. There's also [Aptana][aptana] which is Eclipse already
bundled with PyDev.

**Youngstar:** Doesn't it take time to start them?

**Graybeard:** People usually have them running for weeks at a time. You can
switch projects without closing the IDE.

**Youngstar:** OK. Any other options?

**Graybeard:** In Windows world, [Visual Studio][vs] comes with excellent Python
support called [PTVS][ptvs].

**Youngstar:** Windows? Visual Studio? You?

**Graybeard:** Some claim that Visual Studio is the best IDE out there, but then
again - they are using Windows ;)

**Youngstar:** Thank's but I don't think I'll switch to Windows just for that.

**Graybeard:** Smart girl.

**Youngstar:** After all the brainwashing you did?

**Graybeard:** I prefer "showing you the light".

**Youngstar:** Yeah, yeah. Back on track - any more?

**Graybeard:** There are so many.

[Spyder][spyder] is good you're doing a lot of scientific Python or coming from Matlab. It's not as polished but fits better with scientific development.

There are also [Atom][atom], [Sublime][sublime], and many other good editors out
there with Python support. There are Wiki pages for both [Editors Wiki][edwiki]
and [IDEs Wiki][idewiki] on the Python web site if the above are not enough.

**Youngstar:** As usual, I'm more confused than before.

**Graybeard:** My advice - pick one or two (and make sure Vim is one of them ;)
and try them out. Do a little project with each, see what fits your work style
and then start specializing. I personally try a new one every now and then - but
always get back to Vim eventually. Maybe I'm too old to learn new tricks.

**Youngstar:** OK. Anything I need to pay attention while learning or using
these IDEs?

**Graybeard:** Most of them have good integration with linters, make sure to
enable it.

**Youngstar:** Linters?

**Graybeard:** Programs that check your code for common errors and coding
conventions. We'll talk more on them when discussing testing, but the editor
will mark lines with errors so you can fix them right away. For example I use
[flake8][flake8] integration [in Vim][vim8].

**Youngstar:** Fixing errors closer to when you introduce them is always
better.

**Graybeard:** Yes. I think some of them run the tests in the background
whenever the code changes.

**Youngstar:** Cool!

**Graybeard:** Depends on how fast your tests are.

**Youngstar:** I can see that. Any other advice?

**Graybeard:** What? That was not enough for you? I guess another good advice it
to be patient.

**Youngstar:** Have you seen my hair color? I wasn't born with the patience
gene.

**Graybeard:** You kids ... The point is that it takes time to master an editor
on an IDE. Give it time, and you'll see your productivity jumping. I call it the
"output" part of a programmer I/O.

**Youngstar:** Programmer I/O? As in input/output?

**Graybeard:** Yes. Most of your time as a developer should be spent thinking.
However reading and writing are also part of the process and a good editor or
IDE can increase the output part. Another thing that writing fast does is that
you can write several drafts of your code and not lock into the first one you
write.

**Youngstar:** Good point. I guess I'll brush on my speed reading to get the
input part faster.

**Graybeard:** Yes. We programmers spend a lot of time reading, both code and
technical documents.

**Youngstar:** And in your case a lot of Sci-Fi.

**Graybeard:** Where do you think I get all my ideas from?

**Youngstar:** Thin air?

**Graybeard:** You're too kind, I thought you were going to mention a certain
body part.

**Youngstar:** What are you? Six?

**Graybeard:** Mentally? Not much more. But I see this conversation has taken a
bad turn so I'll stop here.

**Youngstar:** Right as usual, cheers!


I> ## TL;DR
I> * Give Vim or Emacs a try, they will rock your world
I>    * See [here][vimide] on how to turn Vim into a Python IDE
I> * PyCharm or PyDev are a good choice
I>     * Make sure you have plenty of RAM
I>     * Also if you're in a Java shop - there's probably a lot of knowledge on
I>        IntelliJ or Eclipse (which PyCharm and PyDev are based off)
I> * If you're in a Windows shop, give PTVS a try
I> * If you're doing a lot of scientific Python - take a look at Spyder

[atom]: http://atom.io/
[aptana]: http://www.aptana.com/
[bf]: http://xkcd.com/378/
[edwar]: http://en.wikipedia.org/wiki/Editor_war 
[emacs]: http://www.gnu.org/software/emacs/
[lc]: http://www.terminally-incoherent.com/blog/wp-content/uploads/2006/08/curves.jpg
[ptvs]: http://microsoft.github.io/PTVS/
[pycharm]: https://www.jetbrains.com/pycharm/
[pydev]: https://www.jetbrains.com/pycharm/
[vim]: http://www.vim.org/
[vs]: https://www.visualstudio.com/
[spyder]: https://github.com/spyder-ide/spyder
[sublime]: http://www.sublimetext.com/
[edwiki]: https://wiki.python.org/moin/PythonEditors
[idewiki]: https://wiki.python.org/moin/IntegratedDevelopmentEnvironments
[vimide]: http://unlogic.co.uk/2013/02/08/vim-as-a-python-ide/
[flake8]: https://flake8.readthedocs.org/en/latest/
[vim8]: https://github.com/nvie/vim-flake8

[^ide]: Integrated Development Environment

{::comment}
vim: ft=markdown spell
{:/comment}
