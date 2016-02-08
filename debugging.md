> If debugging is the process of removing bugs, then programming must be the
> process of putting them in. 
>   *- Edsger Dijkstra*


FIXME:

"If you dive into the bug, you tend to fix the local issue in the code, but if
you think about the bug first, how the bug came to be, you often find and
correct a higher-level problem in the code that will improve the design and
prevent further bugs."
    - Rob Pike


**Youngstar:** How do you debug?

**Graybeard:** I mostly don't.

**Youngstar:** Come on, you're not that good.

**Graybeard:** Oh, I have mastered the art of writing bug free code... yet. What
I'm saying that I don't debug in the traditional sense of using a debugger.

**Youngstar:** Ah, so how do you solve code problems?

**Graybeard:** You know Feynman?

**Youngstar:** The physicist? The Nobel prize winner? That character? What
about him.

**Graybeard:** He had a great algorithm for solving problems. It goes like this:
1. Write down the problem.
2. Think real hard.
3. Write down the solution.

**Youngstar:** Very funny. I bet you do that all the time.

**Graybeard:** Important part of solving a bug is to understand it, not just
place a patch that fixes it. And the best fix is such that makes possible bugs
of this kind close to impossible.

**Youngstar:** That's all very nice, but to get to understanding I need to debug
some time.

**Graybeard:** Right. However I'm a backend guy and most of the time debugging
is impossible. I use mostly logging to understand what's going on. If I do
debug, it's usually with the command line debugger that comes with Python -
`pdb`.

**Youngstar:** Why not a visual one?

**Graybeard:** Since most of the time I'm in an SSH session to a server, or in a
docker container and UI is hard. Also once you get to know `pdb` is very
effective.

**Youngstar:** OK, I'll spend some time with it.

**Graybeard:** However, if you use good IDE it'll have a visual debugger and
sometimes these are nice. As we said before, knowing your IDE well will save you
tons of time.

**Youngstar:** OK. What else?

**Graybeard:** Why do you assume there's more?

**Youngstar:** Since with you there's always more.

**Graybeard:** Fair point. One of the tricks I used is sometime to place a
"hard" breakpoint in the code. I do this usually when the condition for the
breakpoint becomes pretty complex. I *can* do that in `pdb` or other debuggers
but it's hard, it's much easier to specify the condition in Python code. What
you do it something like this (codes on napkin):

```python
if some_complex_condition():
    import pdb; pdb.set_trace()
```

**Youngstar:** I thought there were no `;` in Python.

**Graybeard:** There are, but rarely used. In this case where it's just
debugging it's convenient to have it in one line. I have a Vim abbreviation for
this line.

**Youngstar:** I bet you do.

**Graybeard:** Then you run your code normally, not via `pdb. And once the
condition is met - you'll get the `pdb` prompt. If you have `IPython` installed
you can used its debugger instead of `pdb`, its a bit nicer. You do it like
this (codes again on a napkin):

```python
if some_complex_condition():
    from IPython.core.debugger import Pdb; Pdb().set_trace()
```

**Youngstar:** OK. How do you remember to take it out when you're done?

**Graybeard:** Excellent question. The script I have to run the tests check
there's not `pdb` lines in the code, and if there are - it fails the tests.

**Youngstar:** That should work.

**Graybeard:** Some people rely on code reviews and place it in the code review
checklist. Some people use a commit hook. I found out automation works best.

**Youngstar:** Agree. Your memory is terrible in some aspects.

**Graybeard:** But as I said earlier, I mostly use logs. It's an art to get the
right balance between huge logs to to little information. Try to err on the TMI
side.

**Youngstar:** TMI as in "too much information"?

**Graybeard:** Yes. Disk is pretty cheap comparing to programmer time.

**Youngstar:** Bug what if the logs get too big?

**Graybeard:** You usually save only a window of time backwards. And there are
great tools for log analysis. But let's talk about logging next time. I have a
lot to say and I talked too much already.

I> ## Summary
I> * Know how to work a debugger. Both from IDE and command line
I> * *Understand* the bug before you fix it
I> * When fixing a bug try to make sure these kind of bugs won't happen again
I> * Use logs. Err on the TMI side
I> * Use automation to make sure debugging code don't get to the source tree


%% vim:ft=rst spell
