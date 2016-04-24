# Monitoring & Alerting

> On a long enough timeline, the survival rate for everyone drops to zero.
> 
>  *- "Fight Club" movie*

**Youngstar:** Our logging system paid off this week. 

**Graybeard:** Do tell.

**Youngstar:** A customer called to say they are missing some data. A quick
search in the log files found that one sub system was down for a couple of days,
we brought it back up and the missing data was in front of the customer eyes in
about an hour.

**Graybeard:** Fixing a system in an hour is indeed good. However I think you
can do better.

**Youngstar:** Better than that? How?

**Graybeard:** You need to know about problem before your customers.

**Youngstar:** Well, we have great logging. But we look at the logs *after* we
found out there's a problem. We do monitor our machines for load, disk space and other
things. However this was an application crash and didn't cause a system problem,
it actually reduced the load.

**Graybeard:** Two things: One is that monitoring without alerting is not that
helpful - nobody is watching the graphs 24/7. Second is that there are better
things to monitor than disk space.

**Youngstar:** Let's take these one at a time. You're saying I need some
automated system that will alert me when a metric goes funky?

**Graybeard:** Yes. You usually start with a fixed threshold, but as your system
grows complex you need more advanced methods. Remember that if you have too many
alerts - people will ignore them. It's the classic "the kid who cried wolf"
story. There are some cool new systems now that apply "anomaly detection"
algorithms to metrics. There are even companies that provide a service where you
send them your metrics and they alert when they find an anomaly.

**Youngstar:** I'll start simple with manual thresholds and move to more
sophisticated stuff later.

**Graybeard:** Yup. "start simple" always wins. Other questions you need to ask
yourself about alerting are "who?" and "how?".

**Youngstar:** We're a small team, I guess everyone should pitch in.

**Graybeard:** Yeah. At one company I worked with had a good rotation system.
There were weekly shifts, rotating at Monday noon. Each shift had a primary and
secondary role.

**Youngstar:** I don't believe that everyone can solve every problem.

**Graybeard:** Yeah, but it's the [Pareto principle][pareto] - most errors are
easy to solve. The big bonus is the *everyone* feels the pain of failing system
and start write more robust code and also pay more attention in code reviews.

I saw a great talk called ["Keys to SRE"][ksre] by the guy who started the SRE
team in Google.

**Youngstar:** SRE?

**Graybeard:** Site Reliability Engineer. It's the group that makes sure things
keep running in Google.

**Youngstar:** OK.

**Graybeard:** Where was I? ... Oh yeah, in the video he mentions that a couple
of sleepless nights does wonders to the stability of code people write.

**Youngstar:** I can see that. And I think that will be a good fit for my small
team. I'll give it a try - getting woken up at 3am gets old real fast. How do
you actually alert?

**Graybeard:** Usually by alert to cellphone, [pagerduty][pd] seems to be very
popular. It's good also to alert to the ops chat room.

**Youngstar:** OK. And if I recall you recommend to do postmortem on every
issue.

**Graybeard:** Yeah, start with [5 whys][5y] and develop your own system. Along
the way update your "red book" for what to do when shit happens.

**Youngstar:** I thought shit happens all the time.

**Graybeard:** That's right. Now let's talk on *what* to monitor.

**Youngstar:** I guess the usual - disk space, load, memory ...

**Graybeard:** Right and wrong.

**Youngstar:** Gee, that's helpful.

**Graybeard:** Let me ask you - how's a disk 80% full affect your revenue?

**Youngstar:** Hmm. Well, it's an indication that I'm going to have a problem
and this might drive out users. Hard to place a number on this.

**Graybeard:** Right. Also let's say everything *looks* OK system wise but your
users can't see data from the last 2 days.

**Youngstar:** I guess I need to check that as well.

**Graybeard:** Most people start "bottom up" from system metrics to system
health. But the more important is "system health", you need to monitor your
KPIs.

**Youngstar:** The what?

**Graybeard:** KPI - Key Performance Indicator. You need to be up to date with
your TLAs.

**Youngstar:** Three Letter Acronym?

**Graybeard:** Yup. Take Netflix for example, they have *one* major KPI they
monitor called [SPS][sps] - starts per second. It follows a wave pattern if
there's some deviation from this pattern - they take a look.

**Youngstar:** I see. But then you need to hook your own monitoring to your
programs. It's also harder to find problem in a wave like pattern which I guess
differ from country to country and changes over the holidays.

**Graybeard:** Yes, it's harder but better. Most of the time people measure
what's easy and not what's important. Take highway police for example.

**Youngstar:** What about them?

**Graybeard:** They do a lot of speed traps, not because speed is the major
cause of accidents, but because it's easy to measure. Unlike reckless driving,
which is far more dangerous but harder to catch.

**Youngstar:** I see. And how do I find these all important KPIs?

**Graybeard:** That's a business question, I'm a tech guy. You're the one owning
a company - go and figure it out. As usual start simple and optimize along the
way.

**Youngstar:** What about the other monitoring - disk, CPU, memory ...

**Graybeard:** Keep them, but try to figure out how do they affect your
business.

**Youngstar:** Anything else?

**Graybeard:** Yes - automate as much as you can.

**Youngstar:** For example?

**Graybeard:** If the disk is getting full, and you know a place where you can
clean up - do it. Even better run what I call a janitor process periodically to
clean things up.

**Youngstar:** Sound good. What's system do you recommend for this?

**Graybeard:** There are many, many systems our there. See what you need and
what they offer and try to find a good match. As usual go with boring reliable
technology. Lately I've been using the [ELK][elk] stack, but that's just a
personal preference. I already had Elasticsearch in place, so not using yet
another system looked like a win to me. But really - have a look around, there
are many and it might be that one of them is a better fit to your needs than
ELK.

**Youngstar:** Great, more homework. Anything else?

**Graybeard:** It's a good idea to do "ops drills" where you simulate problems
and people solve them.

**Youngstar:** I guess we'll have plenty of the real thing to practice on.

**Graybeard:** It's better to deal with your first outage not at 3am with a
customer shouting over the phone. Also other team members can look and learn.

**Youngstar:** Isn't that what Netflix [chaos monkey][cmonkey] do?

**Graybeard:** Sort of, but wait until you get there. By the way they have more
tools that destroy things. It's called [the Simian Army][sarmy] now.

**Youngstar:** Oh my... I need another drink to reflect on that. Want some?

**Graybeard:** OK, I get the hint. I'll shut up about monitoring and alerting
now :)

I> ## TL;DR
I> * Identify your KPIs and monitor them
I> * Start with simple thresholds and move to more sophisticated systems later
I> * Have a pager duty rotation, everyone should pitch in
I> * Automate recovery as much as you can
I> * Update a "red book" for solving problems
I> * Do a postmortem for every outage
I> * Have ops drills


[cmonkey]: http://techblog.netflix.com/2012/07/chaos-monkey-released-into-wild.html
[elk]: https://www.elastic.co/
[pareto]: https://en.wikipedia.org/wiki/Pareto_principle
[pd]: https://www.pagerduty.com/
[sarmy]: https://github.com/Netflix/SimianArmy
[sps]: http://techblog.netflix.com/2015/02/sps-pulse-of-netflix-streaming.html
[5y]: https://en.wikipedia.org/wiki/5_Whys
[ksre]: https://www.usenix.org/conference/srecon14/technical-sessions/presentation/keys-sre

{::comment}
vim: ft=markdown spell
{:/comment}
