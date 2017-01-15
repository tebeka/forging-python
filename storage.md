# Storage

> Two rules of database systems
>
> 1. It takes 7 years minimum to create a production-ready database system
> 2. You're not an exception to rule 1
> 
>   *- Luca Candela*

**Youngstar:** I need to store some data and was thinking of using MySQL, what
do you think?

**Graybeard:** I think you mean MariaDB.

**Youngstar:** What?

**Graybeard:** MariaDB is the community fork of MySQL, done after Oracle bought
MySQL.

**Youngstar:** Like OpenOffice and LibreOffice?

**Graybeard:** Exactly.

**Youngstar:** OK. Now that we clarified this issue, can we get back to my
initial question?

**Graybeard:** I know enough about your data to give you a good answer.

**Youngstar:** Currently I don't have much data. Some user information, some
session data.  Things are very much in flux so it's hard to know.

**Graybeard:** I'll give you my usual advice - start simple.

**Youngstar:** Gee, why didn't I think of that? What do you mean by "simple"?

**Graybeard:** When you start with a database such as MySQL you add complexity
to your system. You need to serialize/deserialize your objects, you have schemas
to design and update - and schema migration can be tricky. Using MySQL also
means you need a server, users, backup ...

**Youngstar:** OK, so what do you suggest?

**Graybeard:** When I need storage, I usually start with [shelve][shelve]. It's
very much like a `dict` which is backed to disk. The main limitation is that the
keys have to be strings, the values can be anything that [pickle][pickle] can
handle. I don't have to worry about serialization, schemas and other things.

**Youngstar:** How do I query it?

**Graybeard:** By running `for` loops in Python.

**Youngstar:** Isn't it slow?

**Graybeard:** *sighs* Speed again? What's your speed requirement? How many
objects do you have? Have you profiled your code?
...

**Youngstar:** OK, OK ...

**Graybeard:** As a rule of thumb, for a system that's not that loaded and
around tens of thousands of objects - shelve will work reasonably well.

**Youngstar:** Is it thread safe?

**Graybeard:** Is your application multi-threaded?

**Youngstar:** I haven't decided on the web server yet, so I don't know.

**Graybeard:** Well, if you find you need to be thread safe - slap a
[threading.Lock][lock] on it. It's a good idea to have your own data access
layer anyway, so switching storage backends shouldn't be that hard. Writing a
nice [DAL][dal] also forces you to think about your storage API. Most of them
time the usual CRUD is enough, maybe some search as well.

**Youngstar:** DAL? CRUD?

**Graybeard:** DAL is Data access layer. CURD is Create, Update, Retrieve,
Delete

**Youngstar:** Ah. What about ORMs[^orm]? I heard SQLAlchemy is great.

**Graybeard:** I have mixed feeling about ORMs. On one hand they save you a lot
of boilerplate coding. However I found out that when your data usage become more
sophisticated, you need to work around them. Also I haven't found a good ORM for
a NoSQL databases yet. If you end up using an ORM, make sure it's easy to rip it
out if it becomes a problem more than a solution.

**Youngstar:** NoSQL as in MongoDB?

**Graybeard:** Yup. There are so many of them.

**Youngstar:** Are they better than SQL ones?

**Graybeard:** It really depends on your usage. I found NoSQL databases good for
early stages when your data model is still in flux and schemas are just in your
way. I usually start with [shelve][shelve] and switch to NoSQL database if I
need support for large amount of data or client/server architecture.

**Youngstar:** Will I need client/server support?

**Graybeard:** My crystal ball is broken today. However the answer is probably
yes. You usually run more than one server for failover or load handling, and
you'll want all of these servers looking at the same data.

**Youngstar:** I guess if I can make my server stateless it'll be best.

**Graybeard:** Good insight. In practice this is really hard to achieve, but a
good goal to strive to. I worked at a company that stored all the data required
in HTTP cookies. This meant the client sent all the data we needed in every
request. Which saved us a lot of database queries.

**Youngstar:** When will you pick an SQL database?

**Graybeard:** There are many parameters that point to SQL database. One thing
is that many people know SQL, and if you have many hands touching the data -
it's a good thing. Also many tools, mainly reporting ones, work well with SQL.

The other thing is that some of the SQL databases, I personally prefer
[PostgreSQL][pg], are wicked fast when you have much more reads than writes.

Also, SQL databases tend to be older, which means they are more stable and have
more tooling and knowledge around them.

**Youngstar:** *You* prefer older? You love all this new and shiny stuff.

**Graybeard:** I know, but I've been bitten by "new" database. At one company we
worked with a two years old database. About 90% of our downtime was due to
database issues.

**Youngstar:** Ouch.

**Graybeard:** Yes. I hear the situation has improved since then, it takes time
for a database to mature and be production ready.

**Youngstar:** OK, I'll learn some SQL then.

**Graybeard:** It's not just SQL you need to learn but also NoSQL. There are
many ways to model your data and you need to know things like normalization,
fact tables, type 2 dimension tables and more. One of the more effective ways I
know is to start from the UI and think about the queries you're going to
perform. After that you start modeling the data.

Thinking and designing your data layer is very important. In "[The Mythical
Man-Month][tmm]" Fred Brooks says: "Show me your flowcharts and conceal your
tables, and I shall continue to be mystified. Show me your tables, and I won't
usually need your flowcharts; they'll be obvious."

**Youngstar:** flowcharts?

**Graybeard:** Yeah, this book is from 1975.

**Youngstar:** 75? Are you kidding me?

**Graybeard:** It's timeless. Talks mostly about people and communication, and
people haven't change a lot in the last few thousand year.

**Youngstar:** But still ... 75?

**Graybeard:** Read it for yourself and decide. Well worth the time in my
opinion.

**Youngstar:** OK... Going back to present day - any more advice?

**Graybeard:** Couple tidbits:

You'll probably have some complex queries in your code. I recommend saving them
in external files - SQL, JSON ...  and not in code. I once worked in a company
who used the Spring framework.  They went half the way and stored the SQL
queries in the Spring XML configuration files. It was really hard to read the
SQL embedded in the XML, there was no syntax highlighting and viewing diffs was
a mess.

The second thing is that most Python's SQL database drivers support accessing
columns by name and not just by index. Accessing by index is both less readable
and prone to error, someone changes the SQL query and suddenly `row[2]` is not
the column you want. For example in [sqlite3][sq3] you need to set the
connection `row_factroy` attribute to `sqlite3.Row` and then each column can be
accessed both by position and by name.

**Youngstar:** OK, I'll remember these. Now what about backup? How often to I
need to backup my databases?

**Graybeard:** You don't need backup.

**Youngstar:** I don't?

**Graybeard:** No - you need recovery. You'll be surprised how many companies
had backups of their data but couldn't restore from it when time came.

**Youngstar:** So backup is part of recovery. How often should I do it?

**Graybeard:** Again, depending on your audit and recovery needs - this question
can have very different answer. Another thing is that backups tend to grow in
size and accumulate, have a good purging policy. One more thing is that if you
use a hosted database - that might take care of backup and recovery for you.

**Youngstar:** Hosted?

**Graybeard:** Yup. And considering that they take all the operations headache
from you it might be a good solution. Google has [BigQuery][bigquery], Amazon
has [Redshift][redshift], there's [compose][compose] and many others.

An extra benefit for BigQuery and Redshift is that they scale. Both claim
they can process billions of records in seconds.

**Youngstar:** Don't they cost money?

**Graybeard:** TANSTAAFL[^tan]. Don't make the common mistake of underestimating
the cost of running your own servers. Deployment, monitoring, alerting, backup
and more - all take time and effort. And developer time is expensive. In [The
Art of Unix Programming][taoup] Eric Raymond says the rule of Economy is:
"Programmer time is expensive; conserve it in preference to machine time." This
is true in most cases, whenever you can save developer time - do it.

This is also why people like [Google App Engine][gae] - zero ops.

**Youngstar:** I have to say now I'm totally confused.

**Graybeard:** Yeah, too many options is not a good thing. Remember this when
we'll talk about monitoring. But for now - just start with `shelve` or something
simple as it. When things get more interesting - go over the queries you do, the
business requirements and then select the right solution. Who knows? You might
find yourself using a graph database at the end.

**Youngstar:** A graph database?

**Graybeard:** Yes. You store not just objects, but also relationship between
them. Look up [neo4j][neo4j] which is a very popular graph database, they have
some good usage examples on their site.

**Youngstar:** Any other types of databases I need to know of?

**Graybeard:** There are so many. I think we considered the main ones except
search based ones.

**Youngstar:** Like [Elasticsearch][es]?

**Graybeard:** Yes, it's actually my favorite.

**Youngstar:** My God, it's full of databases!

**Graybeard:** Yes Dave. Also It's not uncommon to use more than just one
database. For example a combination of SQL for fast queries and search database
for textual search. Some people use [Redis][redis] for fast key/value and
MongoDB for document storage. It really all depends, but having just one is a
big plus.

**Youngstar:** I'll start simple and grow when it hurts.

**Graybeard:** Wise words to end the night. My beer is empty and home is
calling. Next time...

I> ## TL;DR
I> * Start simple, [shelve][shelve] is a great option
I> * Know your data and queries before selecting a database
I>     * Think of things like embedded vs client server, SQL vs NoSQL vs
I>       Key/Value vs Graph ...
I> * Consider hosted database - let someone else wake at 3am
I> * Pick a mature database
I> * Make sure you can recover from backup
I> * Have a policy to trim your backups

[bigquery]: https://cloud.google.com/bigquery/what-is-bigquery
[compose]: https://www.compose.io/
[couch]: http://couchdb.apache.org/
[dal]: https://en.wikipedia.org/wiki/Data_access_layer
[es]: https://www.elastic.co/products/elasticsearch
[gae]: https://cloud.google.com/appengine/docs
[lock]: https://docs.python.org/3/library/threading.html#threading.Lock
[neo4j]: http://neo4j.com
[pg]: http://www.postgresql.org/
[pickle]: https://docs.python.org/3/library/pickle.html
[redis]: http://redis.io/
[redshift]: https://aws.amazon.com/redshift/
[shelve]: https://docs.python.org/3/library/shelve.html
[sq3]: https://docs.python.org/3/library/sqlite3.html
[taoup]: http://www.catb.org/esr/writings/taoup/html
[tmm]: https://en.wikipedia.org/wiki/The_Mythical_Man-Month

[^orm]: Object Relational Mapping
[^tan]: There ain't no such thing as a free lunch
