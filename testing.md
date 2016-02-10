# Testing

> If you don't like testing your product, most likely your customers won't like
> to test it either.
>
>   *- Anonymous*

**Youngstar:** I fixed a bug today and accidentally introduced a new one. Lucky
I noticed it in one of my test runs.

**Graybeard:** You don't have regression tests?

**Youngstar:** I have few unit tests, but that's about it. What are regression
tests?

**Graybeard:** These are tests that check exactly what happened to you - that
new changes didn't brake anything old. There are many kinds of tests and this is
an important one. 

**Youngstar:** So I should do more regression testing?

**Graybeard:** Why do you test?

**Youngstar:** Well, for one thing to make sure I didn't break anything.

**Graybeard:** Any other reason?

**Youngstar:** Make sure my code runs as intended?

**Graybeard:** These are mainly unit tests. More reasons?

**Youngstar:** Hmm, nothing comes to mind currently. What are more reasons?

**Graybeard:** There are many - integration tests check that all parts of the
system connect together. Fuzzing tries to bring down your system with unusual
input and there are many more kinds of tests.

Yet again, the amount and kind of testing is influenced by the cost of error. If
you're writing a life support system - you'll use much more testing than what
you need in your little project right now.

What do you think are the down sides of testing?

**Youngstar:** Downside? Let's see ... Well - they take time to write, that's
for sure.

**Graybeard:** Anything else?

**Youngstar:** Every time I change my code -  I need to change the tests as
well. This makes sure that I didn't mess anything up, but also take more time.

**Graybeard:** Yes. This is what the guys in [Getting Real][gr]
call "mass". The more mass you have, the harder it is to move it.

The main point here is that testing is "pain vs gain", make sure the extra mass
and time is worth the gain.

**Youngstar:** Speaking of tests, do you practice [TDD][tdd]?

**Graybeard:** Sometimes, mostly when working with new developers. I find out it
helps them with designing clean code. I found out the you fit the methodology to
the team your working on. I personally write test after the first or second of
the code is working.

**Youngstar:** How do you know it's working?

**Graybeard:** I try it out in the REPL.

**Youngstar:** The what?

**Graybeard:** REPL stands for "read eval print loop", you might also know it as
the interactive prompt. You write little pieces of code and test them as you go.
After I'm done and happy with the code I write some tests.

**Youngstar:** Ah, OK. And which testing framework do you use?

**Graybeard:** I personally prefer [nose](nose). But I've used [py.test][pytest]
and [unittest] with `discover` mode as well - all of them are good.

**Youngstar:** Why do you prefer nose?

**Graybeard:** I find nose simpler, and I always go for simple. Also love their
[test generators][testgen] which let you run the same test with different input
(AKA table driven testing).  Their [xunit output][xout] is great for
[Jenkins][jenkins] integration as well.

Oh, and I also use [tox][tox] for testing the same code on multiple
versions/implementations of Python.

**Youngstar:** OK. Any other advice?

**Graybeard:** Here are some things I do that are based on my experience and
others.

* Have one command to run your tests. I usually have a `runtests.py` script for
  that.
* Jenkins (or other CI system) should run a script that's is in version control.
* Separate tests to ones that developers run, these should run in the minutes
  range, and full set that Jenkins run. Most testing systems support a way of
  running a subset of tests
* Run a linter, I use [flake8][flake8] which combines `pyflakes` and `pep8`,
  before the tests and fail on any output
* Make sure you don't have calls to [pdb](pdb) in your code. Some people do it
  in commit hooks but I have it as a step in the script that runs the tests
* Tests should never get to production, take great care to make sure it's
  impossible to happen. For example [github was down due to tests running in
  production environment][ghbug].

Most of these goes in my script so I won't forget. I'll email you a copy.

**Youngstar:** Great.

**Graybeard:** Oh, another thing is to cleanup at start of the test.

**Youngstar:** Say what?

**Graybeard:** Most test frameworks allow you a `setup` and `teardown` methods.
Most people create what they need in the `setup`, for example setting database
tables and populating them with data. Then the use the `teardown` to cleanup
everything. The problem is that `teardown` gets called even when the tests fail,
and then if you want to debug the data is missing. I on the other hand use only
the `setup` method and initially cleanup and then populate, this way if the
tests fail I have the data to debug.

**Youngstar:** Sounds right.

**Graybeard:** The last thing to remember...

**Youngstar:** Yay, there's more!

**Graybeard:** Testing is a mastery by itself, and done right it'll save you a
lot of agony. But back to my point is that no matter how hard you test - bugs
will get out into production and you need to be ready for that - monitoring and
altering is something we'll talk about next time. NASA [which has a very strict
and thorough development process][nasdev], [still manage][nasbug] to ship bugs to outer space.

**Youngstar:** Really?

**Graybeard:** Yup. But the have a system in place to fix bugs in outer space
as well.

**Youngstar:** I guess I'll have to mock some parts of the system for testing,
any advice on this?

**Graybeard:** In general - don't mock! Every time you use a mock you cheat and
don't really test your system. Mocks are another "mass" you acquire and need to
be updated to match the actually part they are mocking. I've found out that with
a little effort you can find a solution. I once worked at a company where we
were doing web scraping, getting HTML pages, parsing them, analyzing and storing
in a database ([Elasticsearch][elastic] BTW). At first someone suggest we'll
mock the HTTP connection and get a canned HTML. But with a bit more coding we
created an HTTP server using [Flask][flask] which returned canned HTML pages.
This way we also tested our connection infrastructure and when we wanted to test
accessing pages with user/password - it was easy to add these kind of pages to
the test HTTP server.

However sometime the cost of not mocking is too much - pain vs gain again.
There's a [mock][mock] package in the Python 3 and for Python 2 it's [available
on pypi][mock2].

I> ## TL;DR
I> * Find the "gain vs pain" balance for your tests
I> * Have one script to run tests
I> * Separate tests to ones developers run and ones Jenkins runs
I> * Cleanup on `setup`
I> * Make sure tests don't get into production
I> * Avoid mocking as much as you can


 
[flake8]: https://pypi.python.org/pypi/flake8
[ghbug]: https://github.com/blog/744-today-s-outage
[gr]: https://gettingreal.37signals.com/
[jenkins]: http://jenkins-ci.org/
[nasbug]: http://en.wikipedia.org/wiki/Mars_Climate_Orbiter
[nasdev]: http://www.fastcompany.com/28121/they-write-right-stuff
[nose]: https://nose.readthedocs.org/
[pytest]: http://pytest.org/
[tdd]: https://en.wikipedia.org/wiki/Test-driven_development
[testgen]: http://nose.readthedocs.org/en/latest/writing_tests.html#test-generators
[tox]: https://tox.readthedocs.org/
[xout]: https://nose.readthedocs.org/en/latest/plugins/xunit.html
[flask]: http://flask.pocoo.org/
[elastic]: http://elastic.co/
[mock]: https://docs.python.org/3/library/unittest.mock.html
[mock2]: https://pypi.python.org/pypi/mock

%% vim: ft=markdown spell
