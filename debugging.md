# Debugging

> If debugging is the process of removing bugs, then programming must be the
> process of putting them in. 
> 
>   *- Edsger Dijkstra*


**Youngstar:** I have a bug at work that I just can't figure out. How do you
debug?

**Graybeard:** I mostly don't.

**Youngstar:** Come on, you're not that good.

**Graybeard:** Oh, I have not mastered the art of writing bug free code... yet.
What I'm saying that I don't debug in the traditional sense of using a debugger.

**Youngstar:** Ah, so how do you solve code problems?

**Graybeard:** Ever heard about Rob Pike?

**Youngstar:** The names rings a bell, not sure from where.

**Graybeard:** Look him up, he did a lot. Anyway he once said:

"If you dive into the bug, you tend to fix the local issue in the code, but if
you think about the bug first, how the bug came to be, you often find and
correct a higher-level problem in the code that will improve the design and
prevent further bugs."

I think it was his experience when working with Ken Thompson.

**Youngstar:** Ken Thompson of Unix?

**Graybeard:** Among other things.

**Youngstar:** That's all very nice, but to get to understanding I need to debug
some time.

**Graybeard:** Right. However I'm a backend guy and most of the time debugging
is impossible. I use mostly logging to understand what's going on. If I do
debug, it's usually with the command line debugger that comes with Python -
[pdb][pdb].

**Youngstar:** Why not a visual one?

**Graybeard:** Since most of the time I'm in an SSH session to a server, or in a
docker container - which makes UI hard or impossible. Also once you get to know `pdb` it's very effective.

**Youngstar:** Just like mastering Vim? OK, I'll spend some time with it.

**Graybeard:** However, if you use good IDE it'll have a visual debugger and
sometimes these are nice. As we talked before, knowing your IDE well will save
you tons of time.

**Youngstar:** OK. What else?

**Graybeard:** Why do you assume there's more?

**Youngstar:** Since with you there's always more.

**Graybeard:** Fair point. One of the tricks I used is sometime to place a
"hard" breakpoint in the code. I do this when the condition for the breakpoint
becomes pretty complex.

**Youngstar:** I thought `pdb` support conditional breakpoints.

**Graybeard:** You're right.  I *can* do that in `pdb` or other debuggers but
in some cases it's much easier to specify the condition in Python code. What you do
it something like this (codes on napkin):

```python
if some_complex_condition():
    import pdb; pdb.set_trace()
```

**Youngstar:** I thought there were no semi-colons in Python.

**Graybeard:** There are, but rarely used. In this case where it's just
debugging it's convenient to have it in one line. I have a Vim abbreviation for
this line.

**Youngstar:** I bet you do.

**Graybeard:** Then you run your code normally, not via `pdb`. And once the
condition is met - you'll get the `pdb` prompt. If you have `IPython` installed
you can used its debugger instead of `pdb`, its a bit nicer. You do it like
this (codes again on a napkin):

```python
if some_complex_condition():
    from IPython.core.debugger import Pdb; Pdb().set_trace()
```

**Youngstar:** And you make sure this is not left with the code in your [test
script](#appendix-a).

**Graybeard:** Exactly.

But as I said earlier, I mostly use logs. It's an art to get the right balance
between huge logs to to little information. Try to err on the TMI side.

**Youngstar:** TMI as in "Too Much Information"?

**Graybeard:** Yes. Storage is very cheap comparing to programmer time.

**Youngstar:** But what if the logs get too big?

**Graybeard:** You usually save only a window of time backwards. There are
great tools for log rotation, both in the standard library and Unix utilities.

**Youngstar:** Like [logrotate][lr]?

**Graybeard:** Exactly. You can also ship logs to log aggregation services,
we'll talk about logging and monitoring later.

Oh, and Python's logging module can [listen on a socket][logc] and change the
logging configuration in run time. This way you can temporary set a log level in
one of your modules for a while, collect enough data and then return it back to
the normal level.

**Youngstar:** Cool, I'll look it up. Anything else about debugging?

**Graybeard:** Today's systems are usually have more than one part. Debugging
such a system is even more complicated. One thing I found that helps is to pass
around a context object between sub systems. This way you can search the logs
and get a logical view of an operation between several sub systems.

**Youngstar:** What's in the context object?

**Graybeard:** Anything you think is useful. The bare minimum is just an
identifier for the current operation/session.

Another thing people do it sometimes connect to a running service and inspect
what's going on with the Python `REPL`. There are several such systems, see
[Twisted manhole][manhole] for example.

**Youngstar:** OK. Armed with this knowledge I'm heading back to the office.

**Graybeard:** Remind me to talk with you about work/life balance sometime.

**Youngstar:** OK.

**Graybeard:** But before you head back, another thing that really helps is
giving it time. Letting what Daniel Khaneman calls ["system 2"][sys2] work on
the problem.

**Youngstar:** System 2?

**Graybeard:** Yeah, not very imaginative name. Think of it as the part of your
brain the works below the surface. It's the one the does most of the leaps in
understanding but it needs time. Instead of heading back to the office, go home
and watch a video called ["Hammock Driven Development"][hdd] by Rich Hickey.

**Youngstar:** Oh, we definitely need to talk about work/life balance and how
you have time to learn all this stuff.

Now that you mention this and I see my empty beer glass. I'm guess I'm over my
["Ballmer Peak"][bp], so I'll go home and watch that video.

**Graybeard:** Kudos on knowing your XKCD.

**Youngstar:** Thanks and g'night.


I> ## TL;DR
I> * Writing simple code will make debugging easier
I> * *Understand* the bug before you fix it
I> * Know how to work a debugger. Both from IDE and command line
I> * When fixing a bug try to make sure these kind of bugs won't happen again
I> * Use logs, err on the TMI side
I> * Use automation to make sure debugging code don't get to the source tree
I> * Give your subconscious time to work

[bp]: https://xkcd.com/323/
[hdd]: https://www.youtube.com/watch?v=f84n5oFoZBc
[logc]: https://docs.python.org/3/howto/logging-cookbook.html#configuration-server-example
[lr]: http://www.linuxcommand.org/man_pages/logrotate8.html
[manhole]: http://www.lothar.com/tech/twisted/manhole.xhtml
[pdb]: https://docs.python.org/3/library/pdb.html
[sys2]: https://en.wikipedia.org/wiki/Thinking,_Fast_and_Slow

{::comment}
vim: ft=markdown spell
{:/comment}
