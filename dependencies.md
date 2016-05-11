# Managing Dependencies

> Only the paranoid survive.
> 
>   *- Andy Grove*

**Youngstar:** You won't believe the stupid bug I was chasing today.

**Graybeard:** Do tell.

**Youngstar:** I was updating some packages ...

**Graybeard:** and one of the new versions had a regression bug and it took you
all day to figure it out.

**Youngstar:** What do you know? I'm not that special after all.

**Graybeard:** Oh, you are unique - just like everybody else.

**Youngstar:** Funny! So how can I avoid bugs like this in the future.

**Graybeard:** Congrats, you know that the best way to solve a bug is to make
sure that it's impossible to introduce such bugs in the future.

**Youngstar:** Yeah, forgot who taught me that ...

**Graybeard:** Buy me another beer and I'll refresh your memory.

**Youngstar:** Sure thing. Now back to my question...

**Graybeard:** How do you manage your dependencies?

**Youngstar:** I have a `requirements.txt` with package per line, and I run `pip
install -r requirements.txt` to install them.

**Graybeard:** You know you can specify a specific version using `==`. For
example `requests==2.9.1`

**Youngstar:** I didn't know that. But why would you do that - you won't get all
the bug fixes ... Doh!

**Graybeard:** Exactly!

**Youngstar:** Then I should probably version all my packages.

**Graybeard:** I agree.

**Youngstar:** I know I'll regret this... But any other pointers on dependency
management?

**Graybeard:** As I said many times, one of the biggest factors in your
development practices is the price of error, for example it's much harder to fix
a bug in an embedded system than in a small site web server. The bigger the cost
of error the more strict you want to be with your requirements and enable stable
builds.

For example, do you use virtual environments?

**Youngstar:** Yes, I use [`virtualenv`][virtenv].

**Graybeard:** Why?

**Youngstar:** So that packages are installed in isolation per project and not
globally in the system.

**Graybeard:** Good, this is one more isolation level. By the way, newer
versions of Python comes with [`venv`][venv] module which does basically the
same work.

**Youngstar:** That's nice, one less dependency. Any differences between
`virtualenv` and `venv`?

**Graybeard:** Two that I'm aware of. One is that with `virtualenv` you can
specify a different Python interpreter, for example even if your default Python
is 3 you can still create a virtual environment with the Python 2 interpreter.
The second is that `virtualenv` has a Python module to setup the virtual
environment from Python. This way you don't need to run `activate` before
running your code, you can do it from your Python script.

Also since `venv` is in the Python standard library, it'll updated only when a
new version of Python is released. `virtualenv` will probably have a faster
release cycle.

**Youngstar:** Good to know. The downside of using virtual environments is I
need to teach my IDE which is the right Python.

**Graybeard:** Which IDE are you playing with right now?

**Youngstar:** [atom][atom].

**Graybeard:** That's a cool one, almost as good as Vim.

**Youngstar:** Yeah, yeah. Any other pointers for managing dependencies?

**Graybeard:** Don't use the system Python.

**Youngstar:** Why?

**Graybeard:** In general, it's preferred to leave the system Python alone since
a lot of system utilities are written in Python and a system upgrade might break
your code. [Red Hat][redhat] based distros use *a lot* of Python.

**Youngstar:** I thought `virtualenv` makes sure you don't use any system
package.

**Graybeard:** And 3'rd party package. But what will happen to your code once
the next [debian][debian] ships with Python 3 as default?

**Youngstar:** I see. Is debian a popular distro?

**Graybeard:** Very, several other distros are based on debian, such as
[Ubuntu][ubuntu], [Mint][mint] and others. Changes to debian will find their way
to these distros eventually.

**Youngstar:** I use Mint, now I remember reading somewhere it's debian based.

**Graybeard:** And of course if you don't use a virtual environment and install
new packages, you might break system scripts.

**Youngstar:** One more reason to use virtual environments.

**Graybeard:** Yup. Now what happens if [pypi][pypi] is down when you deploy?

**Youngstar:** I'm pretty much screwed, but how can I overcome this?

**Graybeard:** In some cases it might be OK to wait for pypi to get back it.
It's has been more stable in recent years. If you need to deploy no matter what,
then you need to pre build your dependencies and tell `pip` to install it from your
servers.

**Youngstar:** `pip` can do that?

**Graybeard:** `pip` can do many things, this is one of them. See the
`--index-url` and `--find-link` options if `pip install`.

**Youngstar:** OK.

**Graybeard:** Now about the version of the C compiler...

**Youngstar:** I write Python code, not C.

**Graybeard:** You can write Python modules in C, and there are many good
reasons for doing that - but mostly as last resort. It's likely that one of your
dependencies is a C extension. Then you'll need a C compiler and possibly some
libraries and header files. Some libraries require a Fortran compiler.

**Youngstar:** Fortran?

**Graybeard:** Yes, sometimes a Fortran compiler can do better optimization
than a C compiler.

**Youngstar:** How do people on the Windows world find a C compiler?

**Graybeard:** There's a free C compiler for every major platform. [gcc][gcc] or
[clang][clang] on Unix like systems. And the Microsoft compiler comes free
nowadays.

**Youngstar:** Good to know. And what's the solution here for the C extensions
problem?

**Graybeard:** The idea is that you build all your dependencies in advance and
then use them. The latest packaging format is called [wheel][wheel]. It's
basically a zip file that contains both the Python code and the compiled
extension as a shared library.

**Youngstar:** What happened to [eggs][egg]?

**Graybeard:** wheel is the new egg.

**Youngstar:** I'll get the T-Shirt.

**Graybeard:** Some companies have a "build machine" which has all the required
dependencies to build the packages. This way you don't need to install a lot of
tools on your production machines. This build machine is usually also the one
serving these third party packages. By the way, this process of keeping third
party dependencies locally is sometimes known as "vendoring".

**Youngstar:** How deep does this rabbit hole go?

**Graybeard:** Just you wait Alice. Oh! The places we'll go... Dependency
management is an old and unsolved problem. Pick any package manager: `yum`,
`apt`, `gem`, `npm` ... - all of them have their problems.

**Youngstar:** Consolation of fools... Can we get back to the Python realm?

**Graybeard:** Yes.

**Youngstar:** And ...

**Graybeard:** Hold on, collecting my thoughts... OK. If you're doing a lot of
scientific computing - `numpy`, `pandas`, `matplotlib` and other packages. `pip
install`ing them can be a pain. Try installing `matplotlib` on OSX when you have
some spare time.

**Youngstar:** Right... Should I wax my legs while doing it?

**Graybeard:** Not sure what will hurt more. Anyway ... There's an alternate
package manager called [conda][conda]. `conda` was developed by Continuum to
solving the problem of installing scientific packages. Over time in became a
general installer and you can install other packages with it. Note that not all
of the packages on PyPI can be installed with `conda`.

**Youngstar:** What do I do then?

**Graybeard:** `conda` plays well with `pip` and you can use both. `conda` has
its own notion of "environments" and it installs `pip` in them for just this
case. `conda` supports Linux, Windows, OSX, ARM ...

**Youngstar:** Do you get royalties from Continuum?

**Graybeard:** Nope, but since I've been doing a lot of scientific Python lately
it had saved me tons of time and agony. Going deeper ...

You can use [docker][docker].  This will give you a system where you know
exactly what going on - which version of Python, of libc ... However docker
comes with it own set of issues - mainly what's called "orchestration" but I
won't get into that. The simple approach is just to run a single container as
your application on the host.

**Youngstar:** OK.

**Graybeard:** Alan Key once said "People who are really serious about software
should make their own hardware." 

**Youngstar:** Let's stop here, I have no intention of starting a hardware
company. 

**Graybeard:** CPUs have bugs as well, you might want to control the version of
CPU you use.

**Youngstar:** OK. A related question - How do you choose which package to use?

**Graybeard:** If the package implements a known protocol or connection to
external tool (such as a database), chances are that the main site of the
protocol/tool will list recommended "language bindings". For example, the bottom
part of [msgpack site][msgp] has a "Languages" section with Python pointing to
`msgpack-python`.

**Youngstar:** And if I don't find a reference to Python in the main site?

**Graybeard:** Most packages are hosted on public sites such as [github][github]
There you can see the project "health" - how many committers, commit history and
last commit, number of open bugs ...

Ask around, the Python community is very friendly and helpful. There are
also sites who have a curated list of packages. However don't blindly trust
them, make up your own mind. I find they have a tendency to recommend the shiny
new toys.

**Youngstar:** Err toward mature package.

**Graybeard:** "Stability is sexy."

**Youngstar:** We need to have a talk about how you define "sexy", but another
time.

**Graybeard:** Ha!

Another thing you should do is test before you use. Pick a
package or two and try it out to see how it behaves. Try to simulate real
environment and load as much as you can and always make sure to write code in a
way that makes switching packages easy as possible.

**Youngstar:** Do I really need to do so much even before writing even one line
of code?

**Graybeard:** This is sometimes called "accidental complexity." But no, don't
start with having your own build machine and internal PyPI. Start simple with
`pip`, virtual environment and versioned requirements file. 

**Youngstar:** Pain vs Gain?

**Graybeard:** Exactly. Start with minimal effort that works for you and grow
when you need.

**Youngstar:** Thanks for that. My head is full and my beer glass is empty -
time to go home.

**Graybeard:** Cheers!


I> ## TL;DR
I> * Depending on the cost of error - pick a strategy for versioning
I> * Version your dependencies and write them down
I> * Use `wheel`s when possible
I> * `conda` is a good alternative to `pip`
I> * `docker` will give you even more control but it comes with a cost
I> * You might want to invest in your own internal package repository
I> * Have a process for evaluating new packages. Lean toward old and stable ones

[atom]: http://atom.io/
[clang]: http://clang.llvm.org/
[conda]: http://conda.pydata.org/
[debian]: https://www.debian.org/
[docker]: https://www.docker.com/
[egg]: https://pythonhosted.org/setuptools/formats.html
[gcc]: https://gcc.gnu.org/
[github]: https://github.com
[mint]: http://www.linuxmint.com/
[msgp]: http://msgpack.org/
[pip]: http://pip.readthedocs.org/en/latest/index.html
[pypi]: https://pypi.python.org/pypi
[redhat]: http://www.redhat.com/en
[ubuntu]: http://www.ubuntu.com/
[venv]: https://docs.python.org/3/library/venv.html
[virtenv]: https://virtualenv.pypa.io/
[vwrap]: https://virtualenvwrapper.readthedocs.org/
[wheel]: https://pypi.python.org/pypi/wheel

{::comment}
vim: ft=markdown spell
{:/comment}
