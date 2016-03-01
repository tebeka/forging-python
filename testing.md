# Testing

> A computer lets you make more mistakes faster than any invention in human
> history, with the possible exceptions of handguns and tequila.
>
>    *- Mitch Radcliffe*

**Youngstar:** I fixed a bug today and accidentally introduced a new one.

**Graybeard:** Sounds like the "99 little bugs in the code" poem.

**Youngstar:** I can guess the rest of it.

**Graybeard:** Don't you have regression tests?

**Youngstar:** I have a few unit tests, but that's about it. What are regression
tests?

**Graybeard:** Tests that guard against exactly what happened to you - that
new changes didn't brake anything old. There are many kinds of tests and this is
an important one. 

**Youngstar:** So I should do more regression testing?

**Graybeard:** Let's back off a bit. Why do you test?

**Youngstar:** Well, for one thing to make sure I don't break anything.

**Graybeard:** Any other reason?

**Youngstar:** Check that the code runs as intended?

**Graybeard:** These are mainly unit tests. More reasons?

**Youngstar:** Hmm, nothing comes to mind currently. What are more reasons?

**Graybeard:** There are many - integration tests check that all parts of the
system connect together. Fuzzing tries to bring down your system with unusual
input and there are many more kinds of tests.

What do you think are the down sides of testing?

**Youngstar:** Downside? Let's see ... Well - they take time to write, that's
for sure.

**Graybeard:** Anything else?

**Youngstar:** Every time I change my code -  I need to change the tests as
well. This makes sure that I didn't mess anything up, but also take more time.

**Graybeard:** Yes. This is what the guys in [Getting Real][gr]
call "mass". The more mass you have, the harder it is to make changes.

The amount and kind of testing is influenced by the cost of error. If
you're writing a life support system - you'll use much more testing than what
you need in your little project right now.

The main point here is that testing is "pain vs gain" balance. Make sure the
extra mass and time pain is worth the gain.

**Youngstar:** Speaking of tests, do you practice [TDD][tdd]?

**Graybeard:** Sometimes, mostly when working with new developers. I found out
it helps them designing clean code. You should fit the methodology to the team
your working with. I personally write test after the first or second draft of
the code is working.

**Youngstar:** How do you know it's working?

**Graybeard:** I try it out in the REPL.

**Youngstar:** The what?

**Graybeard:** REPL stands for "read eval print loop", you might also know it as
"the interactive prompt". You write little pieces of code and test them as you
go. After I'm done and happy with the code, I write some tests.

People underestimate how much does the REPL help during development, give it a
try next time.

**Youngstar:** OK, I will. Which testing framework do you use?

**Graybeard:** I personally prefer [nose](nose). But I've used [py.test][pytest]
and [unittest][unittest] with `discover` mode as well - all of them are good.

**Youngstar:** Why do you prefer `nose`?

**Graybeard:** I find `nose` simpler, and I always go for simple. Also love
their [test generators][testgen] which let you run the same test with different
input (AKA table driven testing).  Their [xunit output][xout] is great for
[Jenkins][jenkins] integration as well.

Oh, and I also use [tox][tox] for testing the same code on multiple
versions/implementations of Python.

**Youngstar:** I'll start with `nose` then, don't need multi version testing
currently. How do I run the tests?

**Graybeard:** `nose` comes with `nosetests` script that discovers and executes
tests. But this is usually the last thing in I run.

**Youngstar:** Last? What do you run before it?

**Graybeard:** Few things: I check that there are no called to `pdb` in the
code.

**Youngstar:** `pdb` is the Python debugger?

**Graybeard:** Yes, you can insert calls to it if the breakpoint condition
becomes too complicated. We'll talk about debugging later. Another thing I do is
clean all the compiled modules.

**Youngstar:** The `.pyc` files that are generated on import? Why?

**Graybeard:** Say you renamed a module but forgot to change the import in your
code. Since the `.pyc` of the old module is still there - your test will pass.

**Youngstar:** Gotcha.

**Graybeard:** I also run linter, I use [flake8][flake8] which combines
[pyflakes][pyflakes] and [pep8][pep8], before the tests and fail on any output.

**Youngstar:** Does `pep8` check for coding conventions?

**Graybeard:** Yes, this is how I avoid wasting time on coding convention talks.
If the code passes `pep8` - it's fine.

**Youngstar:** Anything else?

**Graybeard:** Nope. After that I run the test suite.

**Youngstar:** Sounds like a lot of steps. Knowing you, you probably have a
script to do this.

**Graybeard:** Correct, [I'll mail it over if I remember](#appendix-a).

**Youngstar:** I'll remind you.

**Graybeard:** Thanks. Having one command to run your tests also makes sure
other members in your team don't forget steps. I'm not the only one with a one
bit memory.

**Youngstar:** I some cases I found out the tests run for a long time. Which
makes it annoying to run them every time I make a change.

**Graybeard:** My rule of thumb is that developers won't run tests that take
more than about a minute.

**Youngstar:** So how do you run longer tests?

**Graybeard:** With my friend [Jenkins][jenkins].

**Youngstar:** It's the system that monitors your source tree and run tests on
every change?

**Graybeard:** Yes. It's called "continuous integration" or CI for short.
Jenkins can do much more but at heart this is exactly what it does.

I separate the tests to faster ones that can run on a developer machine without
too much setup and longer ones that run on Jenkins. Both `nose` and `pytest`
have a way to mark tests and pick a subset of tests to run. In `unittest` I use
environment variables and a special exception that's called `SkipTest`.

**Youngstar:** And when Jenkins runs the tests it selects all of them?

**Graybeard:** Yup. A common mistake that people do is to write a lot of code in
the Jenkins execute field.

**Youngstar:** Why is it a mistake?

**Graybeard:** Since then it's usually not in source control.

**Youngstar:** Ah! And then if you want to make changes to how tests are run -
you change the script and commit.

**Graybeard:** Exactly. Note that Jenkins can do much more but start simple as
always.

**Youngstar:** Another thing I recall we talked about was to make sure tests
don't get into production.

**Graybeard:** Yes, try to make it impossible for tests to get or touch
production.

**Youngstar:** Any more advice?

**Graybeard:** Yes - cleanup at start of the test.

**Youngstar:** Say what?

**Graybeard:** Most test frameworks allow you a `setup` and `teardown` methods.
Most people create what they need in the `setup`, for example setting database
tables and populating them with data. Then the use the `teardown` to cleanup
everything. The problem is that `teardown` gets called even when the tests fail,
and then if you want to debug - the data is missing. If on the other hand you
use only the `setup` method and initially cleanup and then populate, you'll
still have data to debug if the tests fail.

**Youngstar:** Will do.

**Graybeard:** The last thing to remember...

**Youngstar:** Yay, there's more!

**Graybeard:** Testing is a mastery by itself, and done right it'll save you a
lot of agony. But no matter how hard you test - bugs will get out into
production and you need to be ready for that. Monitoring and altering is
something we'll talk about next time. NASA [which has a very strict and thorough
development process][nasdev], [still manage][nasbug] to ship bugs to outer
space.

**Youngstar:** Really?

**Graybeard:** Yup. But the have a system in place to fix bugs in outer space
as well.

**Youngstar:** I guess I'll have to mock some parts of the system for testing,
any advice on this?

**Graybeard:** In general - don't mock! Every time you use a mock you cheat and
don't really test your system. Mocks are another "mass" you acquire and need to
be updated to match what they are mocking. I've found out that with a little
effort you can usually avoid mocking. I once worked at a company where we were
doing web scraping, getting HTML pages, parsing them, analyzing and storing in a
database ([Elasticsearch][elastic] by the way). At first someone suggest we'll
mock the HTTP connection and get a canned HTML. But with a bit more coding we
created an HTTP server using [Flask][flask] which returned canned HTML pages.
This way we also tested our connection infrastructure and when we wanted to test
accessing pages with user/password - it was easy to add these kind of pages to
the test HTTP server.

However sometime the cost of not mocking is too much - "pain vs gain" again.
There's a [mock][mock] package in the Python 3 and for Python 2 it's [available
on pypi][mock2].

**Youngstar:** Any more advice?

**Graybeard:** Testing is a bottomless pit. We can talk on it for hours, but I'm
getting tired and I think we covered the main points. Also my beer is empty -
going home now.

**Youngstar:** Cheers.

I> ## TL;DR
I> * Find the "gain vs pain" balance for your tests
I> * Have one script to run tests
I> * Have a CI system, Jenkins is a good bet
I> * Separate tests to ones developers run and ones Jenkins runs
I> * Cleanup on `setup`
I> * Make sure tests don't get into production
I> * Avoid mocking as much as you can
I> * No matter how hard your test, some bugs will slip though - be ready for
this


 
[elastic]: http://elastic.co/
[flake8]: https://pypi.python.org/pypi/flake8
[flask]: http://flask.pocoo.org/
[gr]: https://gettingreal.37signals.com/
[jenkins]: http://jenkins-ci.org/
[mock2]: https://pypi.python.org/pypi/mock
[mock]: https://docs.python.org/3/library/unittest.mock.html
[nasbug]: http://en.wikipedia.org/wiki/Mars_Climate_Orbiter
[nasdev]: http://www.fastcompany.com/28121/they-write-right-stuff
[nose]: https://nose.readthedocs.org/
[pep8]: https://pypi.python.org/pypi/pep8
[pyflakes]: https://pypi.python.org/pypi/pyflakes
[pytest]: http://pytest.org/
[tdd]: https://en.wikipedia.org/wiki/Test-driven_development
[testgen]: http://nose.readthedocs.org/en/latest/writing_tests.html#test-generators
[tox]: https://tox.readthedocs.org/
[unittest]: https://docs.python.org/3/library/unittest.html
[xout]: https://nose.readthedocs.org/en/latest/plugins/xunit.html

{::comment}
vim: ft=markdown spell
{:/comment}
