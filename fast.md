# Going Faster

> Write clear, precise code. Every ten years it will run 1,000 times faster."
>
>    *- Joe Armstrong*

**Youngstar:** We're starting to get traffic on our site and some of the servers
became busy. I think I need to rewrite some of my modules in C.

**Graybeard:** You know the three rules of optimization[^c2]?

**Youngstar:** Nope.

**Graybeard:** First rule is: "Don't."

**Youngstar:** Very helpful.

**Graybeard:** Actually it is. Second rule is: "Don't... yet".

**Youngstar:** And the third is "never"?

**Graybeard:** Nope, it's: "Profile before you optimize."

**Youngstar:** That one I get, but why avoid optimization?

**Graybeard:** Because there are some many better ways to make things run faster
than writing code which is hard to understand and maintain.

**Youngstar:** Do tell.

**Graybeard:** Let's start with the industry obsession for speed. The question
you should ask is not "Can I make it faster?" but "Is it fast enough?".

**Youngstar:** What's "enough?"

**Graybeard:** This is an excellent question, and a lot of companies are not
asking it. Try to extract number from the product manager/business people. They
need to understand that you'll build a totally different system if they need
minutes or milliseconds.

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

**Graybeard:** However, sometimes you do need to get things faster. The first
thing you should do it profile.

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

**Graybeard:** Exactly.

**Youngstar:** My system is more complex than just one component. How can I find
out how much time each part takes?

**Graybeard:** I tend to use a timing decorator on functions. This decorator
logs the function execution time and then I can see what's taking time. This
combined with context object to know which functions belong to same request help
me understand what's going on.

**Youngstar:** Something like [yslow][yslow]?

**Graybeard:** Not as fancy, but yes.

Once you identified most promising candidates to optimize, it's time to evaluate
how much it'll take to make it better and pick the one with best effort/speedup
ratio.

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
convince people they don't need "big data" solution. Amazon is about to offer
[instances with two terabyte of memory][x1].

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

**Youngstar:** Yeah, you've sent me that [tweet][tspeed]. I haven't watched [the
video][cfriend] about "cache friendly algorithms" yet.

**Graybeard:** So you *don't* do your homework? I'm confused now.

**Youngstar:** Told you - when I feel like it.

**Graybeard:** Moving on. Once you've exhausted all the options to makes things
faster inside Python, and Python will take you a long way - it's time to look at
some alternatives.

**Youngstar:** Like C extensions?

**Graybeard:** Before you got that path, and sometimes you do need to get there.
There are some less painful options.

**Youngstar:** [Cython][cython]?

**Graybeard:** That's on popular option. There's also [numba][numba] which is a
jit compiler, and you can use alternative Python implementation such as
[pypy][pypy].

**Youngstar:** Hold on, you told me not to use pypy.

**Graybeard:** You didn't have a reason, and there's a price to pay.

**Youngstar:** Third party libraries?

**Graybeard:** Exactly. But sometimes pypy will give you the speed boost you
need with almost zero effort.

**Youngstar:** OK. Anything else?

**Graybeard:** There are many speed optimization tricks. They are related to the
Python implementation you're using. Things like using [`__slots__`][slots] for
memory reduction, avoiding dot lookup and may others. See [the wiki][perfwiki]
for more, and you'll probably pick more as you go.

**Youngstar:** OK.

**Graybeard:** Also there are many other tools you can use. For example
[strace][strace]



[^c2]: From the wonderful [c2 wiki][c2]
[^lies]: Originally "Lies, damned lies, and statistics." attributed to Mark Twain
[c2]: http://c2.com/cgi/wiki?RulesOfOptimization
[pyprof]: https://docs.python.org/3/library/profile.html
[pstats]: https://docs.python.org/3/library/profile.html#module-pstats
[yslow]: https://yslow.org
[mlaw]: https://en.wikipedia.org/wiki/Moore%27s_law
[rec]: http://www.catb.org/esr/writings/taoup/html/ch01s06.html#id2878666
[decimal]: https://docs.python.org/3/library/decimal.html
[x1]: https://aws.amazon.com/blogs/aws/ec2-instance-update-x1-sap-hana-t2-nano-websites/
[deque]: https://docs.python.org/3.3/library/collections.html#collections.deque
[tspeed]: https://twitter.com/holly_cummins/status/530372145025908737
[cfriend]: http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-172-performance-engineering-of-software-systems-fall-2010/video-lectures/lecture-8-cache-efficient-algorithms/
[cython]: http://cython.org/
[numba]: http://numba.pydata.org/
[pypy]: http://pypy.org/
[slots]: https://docs.python.org/3/reference/datamodel.html#slots
[perfwiki]: https://wiki.python.org/moin/PythonSpeed/PerformanceTips
[strace]: https://en.wikipedia.org/wiki/Strace
