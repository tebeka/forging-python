# Configuration

> Amateurs think about tactics, but professionals think about logistics.
> 
>   *- General Robert H. Barrow*

**Youngstar:** I now have two environment where the code run. We have a
production environment but we also has a QA environment. I have an 
`if env == 'PROD':`  in my code but I'm not to happy about it. I also remember
you once said I should try to minimize `if` in my code. How would you handle it.

**Graybeard:** What makes you think you have only two environment?

**Youngstar:** Oh, you're right. There's also the local development environment
on my machine.

**Graybeard:** Yeah, and the number of environments will grow. You might want to
check a new database version, a new package version ...

**Youngstar:** Eeeek, again accidental complexity bites us in the behind.

**Graybeard:** How much did you have to drink? You usually get depressed later
on.

**Youngstar:** You're right, lemme get another round and you can tell me how to
solve my problems.

**Graybeard:** Sure, I'll wait.

Youngstar fetches a new round, they drink in silence for a few minutes.

**Graybeard:** OK, did you figure how to solve your problem by now?

**Youngstar:** I thought of some kind of configuration system, then have a
configuration file per environment. Probably use JSON since writing my own
format is bad.

**Graybeard:** Why JSON?

**Youngstar:** There's already a parser and it's well known format.

**Graybeard:** Would you like to have some comments in your configuration?

**Youngstar:** Probably yes ... we'll that rules out JSON. YAML?

**Graybeard:** YAML is a great format for configuration. I use it a lot, but
there's something even simpler.

**Youngstar:** YAML is pretty simple, you just `load` the configuration file.
The only way it'll be simple if the configuration will already be in Python ...
Oh - so I'll use Python.

**Graybeard:** Yes. I usually use a system where I have `config.py` and just
import it. Having said that, a YAML (or other format) based system is good as
well. But start the simplest way you can.

**Youngstar:** But then how do I get a different configuration per system?

**Graybeard:** You have a _overrides_ file where you place values per system,
something like this in `config.py` (Graybeard write on a napkin)

```python
# config.py

db_host = 'localhost'
db_port = 8000

try:
    from config_local import *  # noqa
except ImportError:
    pass
```

**Youngstar:** What's `# noqa`?

**Graybeard:** Oh, a force of habit. Most linters consider `import *` as an
error. `# noqa` tells `flake8` to ignore this line. We talked about `flake8` a
while ago when we talked about testing.

**Youngstar:** Yeah I remember. So in your system if there is a
`config_local.py` next to the file everything written there will override what's
in `config.py`

**Graybeard:** In the import path, no just next to `config.py`

**Youngstar:** Yeah, and I see where you can use `PYTHONPATH` to get different
`config_local.py` per environment.

**Graybeard:** Yes. I other cases the deployment system, say [Ansible][ansible],
will generate `config_local.py` based on the environment.

**Youngstar:** And I guess the default in `config.py` should be for local
development environment?

**Graybeard:** That's right.

**Youngstar:** This system looks good enough to my usage, anything else?

**Graybeard:** There are many ways to do configuration, and you should pick the
one that fits your case. We talked about overrides, the usual order is default < configuration < environment variables < command line switches. You can use something like [ChainMap][chmap] for this.

**Youngstar:** OK. I guess adding command line support helps in quickly testing
other systems.

**Graybeard:** Yes, sometime the script that starts your program (say docker)
gives all the right switches. Then you can go without configuration system at
all in your code.

**Youngstar:** It's not true, you just moved the configuration system to the
deployment/running system.

**Graybeard:** I said "in your code". Glad you caught that, many people when
they talk about "zero configuration" mean "in the code".

**Youngstar:** What about storing configuration in a server?

**Graybeard:** People do that as well, they use systems like [ZooKeeper][zk]
,[Consul][consul] and others for this.

**Youngstar:** Then you need just to know where the configuration server is.

**Graybeard:** Yeah, but then someone need to populate the configuration values
on the server.

**Youngstar:** Oh yeah.

**Graybeard:** There's much more: 
* Some people believe you should use just environment variables, read [the 12
  factor app][ttfa] sometime. 
* Some system use the IT automation system (Ansible, docker ...) to generate
  fixed values. The database will be the same entry in `/etc/hosts` in the name
  of `elastic` - the IP will change from system to system. 
* `docker` based system like [docker-compose][dc] and [kubernetes][kb] have
  their own system for hooking containers together.

**Youngstar:** Oh wow! All I wanted is just a way for my application to know
where the database is.

**Graybeard:** Yeah. My usual advice is to start simple and grow in complexity
only if you have no other choice.

**Youngstar:** Anything else?

**Graybeard:** If you go back to the code I wrote, only `db_host` and `db_port`
are defined. But in some cases you'll need a URI, something like
`pgsql://<db_host>:<db_port>`. Instead of having everyone constructing this URI
themselves you can add a line `db_uri = 'pgsql://%s:%s' % (db_host, db_port)`
*after* the import from `config_local`.

**Youngstar:** What if I want a totally different URI? Say add my own user and
password?

**Graybeard:** There's no end to where you can go with this. I usually find out
these edge cases are not worth the trouble of supporting them. Sometimes I have
a utility function `db_uri` which will generate the URI and it can be as complex
as you want. But there will also be an edge case where you configuration system
falls short. As long as it supports the majority of cases - you're fine.

**Youngstar:** As usual, simple things go very deep with you.

**Graybeard:** A good configuration system will reduce the complexity if your
code. This complexity don't go away, but it's contained somewhere else which is
a good thing.

**Youngstar:** Anything else?

**Graybeard:** Yeah, make sure that secrets (API keys, passwords ...) don't make
it to configuration or checked in by mistake. We'll have a talk on security
later (and had one on configuration management already).

**Youngstar:** How do I do that?

**Graybeard:** I'll let you think about it and we'll talk security next time.

**Youngstar:** OK then.

I> ## Summary
I> * Start simple. A Python based configuration system with overrides will get
I>    you a long way
I> * Know that most times you move configuration complexity to another system.
I> * Learn about the various solutions out there and what people do, then adapt
I>   to your system what works.
I> * Give more than one way to specify configuration. Usually we have default <
I>   configuration file < environment variables < command line switches
I> * Make sure "secrets" are protected in your configuration system

[ansible]: http://www.ansible.com/
[chmap]: https://docs.python.org/3/library/collections.html#collections.ChainMap
[zk]: https://zookeeper.apache.org/
[consul]: https://www.consul.io/
[ttfa]: http://12factor.net/
[dc]: https://docs.docker.com/compose/
[kb]: http://kubernetes.io/
