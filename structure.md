# Project Structure

> organizations which design systems ... 
> are constrained to produce designs which are copies of the communication
> structures of these organizations.
> 
> *- Conway's Law*

**Youngstar:** How should I structure my code? I currently have everything in
one directory and it looks messy.

**Graybeard:** Are you facing a specific problem?

**Youngstar:** Not really, but I assume I should be more organized.

**Graybeard:** As the bad guy in a very bad movie said: "Assumptions are the
mother of all !#?@ups".

**Youngstar:** Which movie was that?

**Graybeard:** "Under Siege 2" if my one bit memory serves me right.

**Youngstar:** Don't think I saw that one.

**Graybeard:** Trust me - you're not missing anything. But back to your
question. Why are you trying to fix something that you don't know is broken?

**Youngstar:** You're probably right. I'll leave it for now.

**Graybeard:** I didn't say it's not broken. I just said *you* think it's not
broken.

**Youngstar:** OK, enlighten me.

**Graybeard:** Do you have some tests?

**Youngstar:** Sure!

**Graybeard:** How do you make sure they don't get to production?

**Youngstar:** Why shouldn't they?

**Graybeard:** Ask github who had [a few hours of downtime][down] a while back. The cause was tests deleting the production database.

**Youngstar:** Ouch!

**Graybeard:** Yes, and github are not the only ones bitten by this problem.

Python has an established way to organize projects. It's not mandatory but I
found it's a good practice. Let's assume that the name of your project is
`archer`.

**Youngstar:** Do you have to bring that TV show into everything?

**Graybeard:** Please be quiet, I'm trying to teach you something here. I'm also
still hurt you didn't take my suggestion for a project name.

**Youngstar:** I'm being quiet.

GrayBeard draws the following diagram on a napkin:

    archer
    ├── README.md
    ├── Makefile
    ├── run_tests.py
    ├── requirements.txt
    ├── archer
    │   └── __init__.py
    ├── docs
    └── tests
        └── test_archer.py

**Graybeard:** Let's go over this. The top `archer` directory is your project -
the one you clone from source control.

The second `archer` directory is your Python package where the code is.  `tests`
are *outside* of the code so they won't get deployed.

**Youngstar:** And the rest of the files?

**Graybeard:** Every project should have a `README` with at least an elevator
pitch. This focuses people on what we're doing here. It should also contain
instructions for developers not found in the docs.

The `docs` directory is the generated documentation, I don't usually have docs
other than what's in the code and in the `README`.

**Youngstar:**  `.md` stand for [markdown][md] right?

**Graybeard:** Yes. You can also use [ReStructuredText][rst] or plain text. But
markdown became very dominant these days. There are several variants of
Markdown, pick one and stick to it.

**Youngstar:** Markdown it is then.

**Graybeard:** What else? Oh, I usually have a main `Makefile` to automate some
tasks, `requirements.txt` to specify external requirments. And *one* script to
run all the tests. We'll discuss what's in `requirements.txt` and `run_tests.py`
when we talk about dependencies and testing.

**Youngstar:** OK, I'll try to remind you - considering your one bit memory.

**Graybeard:** Yay, an external memory! I'll drink to that.

As said, this is my personal preference which is based on how many Python
projects are structured. You might find another one better for you but I suggest
you start with it.

**Youngstar:** Anything else?

**Graybeard:** Yes, don't overthink this and spend too much on it. Start with
something and only if it becomes a problem fix it.

**Youngstar:** That's advice you give for many things.

**Graybeard:** Because it's a good one, and hopefully one day you'll make it a
habit.

**Youngstar:** Is there a way to automatically generate documentation?

**Graybeard:** Yeah, write simple code that people can understand.

**Youngstar:** That's a manual way.

**Graybeard:** OK "Miss Always Right". I stand, actually sit, corrected. 

I say that the only updated documentation is the code itself.

**Youngstar:** That's good in the general case, however sometimes I need to
write tricky code. For example when optimizing.

**Graybeard:** Optimization is a subject for another talk. But you're right,
when you do stuff that is not that obvious - write good docstrings and comments.

**Youngstar:** Are there tools to generate nice documentation from docstrings?

**Graybeard:** Of course. In the Python world we mostly use [Sphinx][sph]. It
has a format for documentation strings and can generate HTML, PDF and maybe
other formats. A nice feature of Sphinx is that it can run [doctest][doct] tests.

**Youngstar:** `doctest` is where you write snippets of code in your docstrings?

**Graybeard:** Exactly, and I find it cool that you have testable documentation.

**Youngstar:** How about the "big stuff"? Things that don't fit inside one
module?

**Graybeard:** You have the `README` for that and also Sphinx can have top level
documentation. Note that if you have documentation, you'll need to add checking
it as part of the code review.

**Youngstar:** How did we get from project structure to writing documentation?

**Graybeard:** Not sure. Last thing about documentation is that several times I
saw people investing a lot of time in generating very nice documentation that
nobody looks at.

**Youngstar:** I'll start with simple documentation. Anything else about project
structure?

**Graybeard:** There are more files you might need. A `MANIFEST.in` files to
help with packaging. `ChangeLog` to list changes, `NOTICE.txt` or `LICENSE.txt`
for specifying license. `tox.ini` for running tests on multiple versions of
Python and many other files. Start with the least amount of items and add new
ones only when you need to.

**Youngstar:** Then trim and restructure periodically?

**Graybeard:** Exactly.

**Youngstar:** What about `setup.py`, I've seen it in many projects.

**Graybeard:** `setup.py` is used for packaging. Do you need packaging?

**Youngstar:** Currently I deploy directly from `git`.

**Graybeard:** So you probably don't need packaging. `setup.py` is mostly used
when creating packages for other people to use and in open source code. There's
a lot of options there and when you decided to release some of your code as open
source we can talk about it.

**Youngstar:** I'll live without `setup.py` for now. Priorities ...

**Graybeard:** Very good.

I> ## TL;DR
I> * Start with an established project structure (like GreyBeard's example above)
I> * Separate code from tests
I> * Have a `README` with an elevator pitch and development instructions
I> * Use a `Makefile` or other tool to automate common tasks
I> * Have *one* script to run the tests
I> * Look into [Sphinx][sph] for generating documentation
I>    * But only if you need to

[doct]: https://docs.python.org/3/library/doctest.html
[down]: https://github.com/blog/744-today-s-outage
[md]: https://daringfireball.net/projects/markdown/
[rst]: http://docutils.sourceforge.net/rst.html
[sph]: http://www.sphinx-doc.org/en/stable/

{::comment}
vim: ft=markdown spell
{:/comment}
