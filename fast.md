# Going Faster

> Write clear, precise code. Every ten years it will run 1,000 times faster.
>
>    *- Joe Armstrong*

**Youngstar:** We're starting to get traffic on our site and some of the
servers became busy. I think I need to rewrite some of my modules in C.

**Graybeard:** You know the three rules of optimization[^c2]?

**Youngstar:** Nope.

**Graybeard:** First rule is: "Don't."

**Youngstar:** Very helpful.

**Graybeard:** Actually it is. Second rule is: "Don't... yet".

**Youngstar:** And the third is "never"?

**Graybeard:** Nope, it's: "Profile before you optimize."

**Youngstar:** That one I get, but why avoid optimization?

**Graybeard:** Because there are so many better ways to make things run faster
than writing code which is hard to understand and maintain.

**Youngstar:** Do tell.

**Graybeard:** Let's start with the industry obsession for speed. The question
you should ask is not "Can I make it faster?" but "Is it fast enough?".

**Youngstar:** What's "enough?"

**Graybeard:** This is an excellent question, and a lot of companies are not
asking it. Try to get hard numbers from the product manager/business people. They
need to understand that you'll build a totally different system if they need
minutes or milliseconds response time.

**Youngstar:** Minutes?

**Graybeard:** There are batch system in enterprise that runs once a day, so
even days might be a valid answer.

**Youngstar:** And if I hit these numbers, spend my time elsewhere developing
new features?

**Graybeard:** Exactly. A lot of time people say - "make it as fast as you
can.". Don't let them get away with it.

**Youngstar:** And how do I do that?

**Graybeard:** I tell them something like: "OK, but I'll need a supercomputer
and two years to get as fast as I can."

**Youngstar:** Nice!

**Graybeard:** One thing you want to do before optimizing is making sure your
code works.

**Youngstar:** Doh!

**Graybeard:** You'd be surprised how many times people optimize bugs. Make sure
you have a good regression/acceptance test before you start. Also spend time
with the code and understand what it's doing.

**Youngstar:** Makes sense.

**Graybeard:** After you're ready, the first thing you should do is profile.

**Youngstar:** I know about [the Python profilers][pyprof] and [pstats][pstats].

**Graybeard:** Excellent, these will help you identify the problem. Note that
there are several UI front ends to `pstats` and some IDE's have excellent
integration.

**Youngstar:** You? Preaching UI?

**Graybeard:** Sometimes a pictures does worth a thousand words. Note however
that pictures can lie just as good as words.

**Youngstar:** Meaning?

**Graybeard:** You need to understand what your viewing and how you measured it.
For example people who use Windows should disable the anti-virus software before
running profilers.

**Youngstar:** Oh! "Lies, damn lies and benchmarks."[^lies]?

**Graybeard:** Exactly. Also note that there are several kind of profilers. You
usually start with time based ones, but there are event based, memory and other
profilers out there - know the tools.

**Youngstar:** I'll make sure to have more than a hammer in my toolbox. However,
my system is more complex than just one component. How can I find out how much
time each part takes?

**Graybeard:** I tend to use a timing decorator on functions. This decorator
logs the function execution time and then I can see what's taking time. This
combined with context object to know which functions belong to same request help
me understand what's going on.

**Youngstar:** Something like [yslow][yslow]?

**Graybeard:** Not as fancy, but yes.

Once you identified most promising candidates for optimiziation, it's time to
evaluate how much it'll take to make it better and pick the one with best
effort/speedup ratio.

**Youngstar:** Pain vs Gain again?

**Graybeard:** It's always there.

**Youngstar:** Now that I have what to optimize, how do I do it?

**Graybeard:** There are many tools and techniques out there. I'll try to point
out some of the major ones. But do your homework.

**Youngstar:** I always do.

**Graybeard:** Always?

**Youngstar:** OK, when I feel like it.

**Graybeard:** Ha! The first easy solution is to throw hardware at it. I heard
that some people at Google have a sticker on their laptop saying "My other
computer is a data center.".

**Youngstar:** Oh, I need one of these.

**Graybeard:** I sometime joke that the hardest part of my consulting gig is to
convince people they don't need "big data" solution. You can rent an 
[instances with two terabyte of memory][x1] on AWS.

**Youngstar:** Two terabyte? Wow!

**Graybeard:** Relax, in a few years you'll have it in your phone.

**Youngstar:** The never ending [Moore's law][mlaw]?

**Graybeard:** Something like that. The idea is the machines are way cheaper
than developer time. It's an old idea, check out [Rule of Economy][rec]
sometime.

**Youngstar:** I read TAOUP, some good guidelines there.

**Graybeard:** You *do* do your homework.

**Youngstar:** I try. What else?

**Graybeard:** Cheat whenever you can.

**Youngstar:** Huh?

**Graybeard:** I don't recall the exact saying, but it says something like "the
fastest code is the one not being executed." Caching is a great example, and a
lot of time you get get away with a fast approximation than actually doing the
full calculation.

**Youngstar:** For example?

**Graybeard:** Floating points.

**Youngstar:** Oh, the `1.1 * 1.1 != 1.21` thing people always complain about?

**Graybeard:** Exactly. Floating point sacrifice accuracy to become fast.

**Youngstar:** And you can use the [decimal module][decimal] for accurate
results.

**Graybeard:** Exactly. After you throw hardware and cheat. It's time to reach
out for algorithms and data structures. And you need to know the strengths and
weaknesses of the ones you're using.

**Youngstar:** Like list append is fast but prepend is slow?

**Graybeard:** Yup. If you need to prepend a lot what do you use?

**Youngstar:** A [deque][deque].

**Graybeard:** Very nice. Also try to use the builtin data structures, they are
written in super optimized C.

**Youngstar:** Yeah, the notes in `dict` implementation makes my head spin.

**Graybeard:** Apart from algorithms, you need to know a bit about computer
architecture.

**Youngstar:** Access times for various hardware?

**Graybeard:** Yes. There's a huge performance penalty for a cache miss.

**Youngstar:** Yeah, you've sent me that [tweet][tspeed]. I haven't watched
[the video][cfriend] about "cache friendly algorithms" yet.

**Graybeard:** So you *don't* do your homework? I'm confused now.

**Youngstar:** Told you - when I feel like it.

**Graybeard:** Moving on. Once you've exhausted all the options to makes things
faster inside Python, and Python will take you a long way - it's time to look at
some alternatives.

**Youngstar:** Like C extensions?

**Graybeard:** Before you got that path, and sometimes you do need to get there.
There are some less painful options.

**Youngstar:** [Cython][cython]?

**Graybeard:** That's one popular option. There's also [numba][numba] which is
a JIT compiler who also can shed work to the GPU, and you can use alternative
Python implementation such as [pypy][pypy].

**Youngstar:** Hold on, you told me not to use pypy.

**Graybeard:** You didn't have a reason, and there's a price to pay.

**Youngstar:** Third party libraries?

**Graybeard:** Exactly. But sometimes pypy will give you the speed boost you
need with almost zero effort.

**Youngstar:** OK. Anything else?

**Graybeard:** There are many speed optimization tricks. They are related to
the Python implementation you're using. Things like using [`__slots__`][slots]
for memory reduction, avoiding dot lookup and may others. See [the
wiki][perfwiki] for more, and you'll probably pick more as you go.

**Youngstar:** OK.

**Graybeard:** Also there are many other tools you can use. For example
[strace][strace] let's you see what system calls your program is doing.

**Youngstar:** I've played with strace, it's fun.

**Graybeard:** Oh, you're getting around to my definition of fun now?

**Youngstar:** Busted! What about parallelization?

**Graybeard:** This is also an option. Always remember [Amdahl's law][alaw],
don't expect miracles. There are many way to parallelize, from threads, to
processes to different machines. Do your homework again.

**Youngstar:** [Threading][threading], [multiprocessing][mp] and
[Celery][celery]?

**Graybeard:** There are so many solutions out there. There's the new
[concurrent.futures][concurrent] modules in the standard library. And for multi
machine parallelization there are many solutions, from [Spark][spark] to
[distributed][distributed] to many more. However before you get that path, try a
better algorithm and better hardware. Going "big data" is painful.

**Youngstar:** OK. And writing stuff in C?

**Graybeard:** Once you *know* this is the right solution. You have several
options, from the [native C API][capi] to [SWIG][swig] and others. But I'd
start with [Cython][cython].

**Youngstar:** OK. I'll start out not optimizing and see how it goes for me.

**Graybeard:** Yes. Last thing to remember is not to expect miracles. Raymond
Hettinger phrased it nicely: Much of the doubling of speed for core Python that
has occurred over the last decade has occurred one little step at a time,
none of the them being individually "dramatic"[^speedbug].

**Youngstar:** OK, I'll remember that - baby steps.

**Graybeard:** And now, let's continue with our baby steps toward [Ballmer
Peak][ballmer].

**Youngstar:** Two beers coming up.

I> ## TL;DR
I> * Know the numbers you need to hit
I> * Don't optimize before you measure
I> * Know the tools and algorithms available to you
I> * Cheat whenever you can
I> * Think pain vs gain
I> * Hardware is cheap comparing to developer time
I> * Moving to multi-machine setup is painful, try to stay with one
I> * Do whatever you can in Python before dropping to C
I> * Don't expect miracles, small steps will get you there

[^c2]: From the wonderful [c2 wiki][c2]
[^lies]: Originally "Lies, damned lies, and statistics." attributed to Mark Twain
[^speedbug]: http://bugs.python.org/issue25823
[alaw]: https://en.wikipedia.org/wiki/Amdahl%27s_law
[ballmer]: https://xkcd.com/323/
[c2]: http://c2.com/cgi/wiki?RulesOfOptimization
[capi]: https://docs.python.org/3/extending/index.html
[celery]: http://www.celeryproject.org/
[cfriend]: http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-172-performance-engineering-of-software-systems-fall-2010/video-lectures/lecture-8-cache-efficient-algorithms/
[concurrent]: https://docs.python.org/3/library/concurrent.futures.html
[cython]: http://cython.org/
[decimal]: https://docs.python.org/3/library/decimal.html
[deque]: https://docs.python.org/3.3/library/collections.html#collections.deque
[distributed]: http://distributed.readthedocs.io/en/latest/
[mlaw]: https://en.wikipedia.org/wiki/Moore%27s_law
[mp]: https://docs.python.org/3/library/multiprocessing.html
[numba]: http://numba.pydata.org/
[perfwiki]: https://wiki.python.org/moin/PythonSpeed/PerformanceTips
[pstats]: https://docs.python.org/3/library/profile.html#module-pstats
[pyprof]: https://docs.python.org/3/library/profile.html
[pypy]: http://pypy.org/
[rec]: http://www.catb.org/esr/writings/taoup/html/ch01s06.html#id2878666
[slots]: https://docs.python.org/3/reference/datamodel.html#slots
[spark]: https://spark.apache.org/
[strace]: https://en.wikipedia.org/wiki/Strace
[swig]: http://www.swig.org/
[threading]: https://docs.python.org/3/library/threading.html
[tspeed]: https://twitter.com/holly_cummins/status/530372145025908737
[x1]: https://aws.amazon.com/ec2/instance-types/x1/
[yslow]: http://yslow.org/
