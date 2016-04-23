# Deployment

> May the queries flow, and the pagers remain silent.
> 
>    *- [SRE][sre] Benediction*


**Youngstar:** I'd like to place my code out there in alpha state so people can
play with it.

**Graybeard:** Getting feedback early is a very good thing. Where are you going
to put the code?

**Youngstar:** That's what I was going to ask you. There are so many options -
AWS, GAE, Heroku, Azure, my own servers ... Which one do you use?

**Graybeard:** I use the one that fits my needs.

**Youngstar:** That was helpful.

**Graybeard:** The point is that there's no "one size fits all". It depends on
many factors. And I use different hosting solutions in different situations.

**Youngstar:** One of these factors is if I can place my data outside?

**Graybeard:** Yes. A lot of companies think their data is safer if the keep it
in house. However I tend to trust the Google/Amazon security experts much more
than the local IT.

**Youngstar:** I don't know much about security.

**Graybeard:** We'll fix that later. However today it's more common for
companies to host data outside. And even companies that say "we host data
ourselves" usually mean "on own hosted servers". Sometimes you can't host data
outside due to legal reasons or some compliance policies.

**Youngstar:** IANAL, but I think I'm OK with hosting data outside.

**Graybeard:** What most companies underestimate, is the cost of having your own
servers. Scaling up becomes much more painful. And you need people doing
rotation who can drive at 3AM to some Colo, have the right keys and know how to
reboot the servers.

**Youngstar:** Colo?

**Graybeard:** Short for "co-location centre". It's usually a secure place for
your servers with good network, security and other goodies.

**Youngstar:** So not from the office network?

**Graybeard:** Sadly I've seen that too.

**Youngstar:** OK, I'll start with the cloud then. Which one?

**Graybeard:** There are many options and many variables you need to consider.
As usual - some research required.

**Youngstar:** Such as pricing?

**Graybeard:** Pricing is one aspect. If you're paying money

---
* vendor lock
* less ops
* reputation / size
* fits your process
* automate
* no downtime
* canary
* environments (qa ...)
* access prod data - data science
* auto scale
* docker
* 


I> ## TL;DR
I> * ...



[sre]: https://en.wikipedia.org/wiki/Site_Reliability_Engineer
