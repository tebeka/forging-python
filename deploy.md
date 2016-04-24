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

**Graybeard:** Pricing is one aspect. However most companies don't fathom how
much time consuming operations can be.

**Youngstar:** And by time you mean money.

**Graybeard:** Exactly. I'd do my best to limit my operational involvement.

**Youngstar:** OK, less ops is better. What else?

**Graybeard:** Try to avoid vendor lock.

**Youngstar:** By using open standards?

**Graybeard:** Yes, and also creating abstractions in your code.

**Youngstar:** "All problems in computer science can be solved by another level
of indirection".

**Graybeard:** Did you catch my quote addiction? Was this David Wheeler?

**Youngstar:** Yup. Just stumbled on this the other day.

**Graybeard:** Another thing you need to take into consideration when choosing
who to use is size and reputation.

**Youngstar:** Very much like selecting technologies to use.

**Graybeard:** As the old joke says: "Nobody ever got fired for buying IBM".
Sometimes it's OK to bet on younger products, but infrastructure is something
you need working.

**Youngstar:** "Stability is sexy".

**Graybeard:** Oh, you actually listen to what I say. I'm flattered.

**Youngstar:** Yeah, yeah. Go on.

**Graybeard:** Once you decided on hosting which fits you budget and seem decent
enough. You need to fit deployment to your process. The ideal today is called
[continuous delivery][contdel] - once tests pass on Jenkins, the code goes to
production.

**Youngstar:** I heard that deployment is painful.

**Graybeard:** It doesn't have to be. There's a piece by the late Aaron Swartz
called ["Lean into the Pain"][lpain]. He says that just like sport, we need to
do the stuff that hurts us a lot in order to get better at it.

**Youngstar:** And when we deploy a lot it won't be an issue.

**Graybeard:** Yup. Note that there are deploys and there are deploys. Most of
them will be a non issue, but some of them will give you a headache.

**Youngstar:** Can you give me an example?

**Graybeard:** Changing a database schema in a non backward-compatible way.

**Youngstar:** Which means you need to re-process all the data?

**Graybeard:** Yes. And also you'll have some processes still working with the
old format and some working with the new format.

**Youngstar:** Ouch!

**Graybeard:** There's a reason NoSQL is popular.

**Youngstar:** You can make breaking changes in NoSQL.

**Graybeard:** That you can, but it's sometimes easier. You pay in other areas,
pick your poison.

**Youngstar:** OK. I'll think about what the data and try to automate the
deployment as much as possible.

**Graybeard:** Good plan. Another thing which is hard in some platforms is zero
downtime.

**Youngstar:** I read about it. So many options - [Blue Green][blueg], [Canary
Releases][canary], [Rolling deployments][rolld] ...

**Graybeard:** As usual, go simple and scale when you need. Some platforms like
GAE do it for you.

**Youngstar:** Cool. They scale as well?

**Graybeard:** Yes. So does AWS and others. You need to take care to limit
scaling otherwise a spike in load can make you bankrupt.

**Youngstar:** Ouch!

**Graybeard:** It's also hurts that users can't access your site due to load.

**Youngstar:** I'll pick my poison.

**Graybeard:** You're learning. It's all about trade-offs.

**Youngstar:** What else?

**Graybeard:** You need to make sure you don't have [snowflake servers][snowf].

**Youngstar:** I thought servers like cold temperatures.

**Graybeard:** What Martin Fowler means is a unique server that you can't
rebuild if it's gone.

**Youngstar:** So automate again. Which tool? [Ansible][ansible],
[SaltStack][salts], [Chef][chef], [Terraform][terraform]...

**Graybeard:** Do your homework and ask around. I usually start simple with
[Fabric][fabric] and move to the heavy weight when I need them.

**Youngstar:** OK. I will.

**Graybeard:** It's important that there won't be one production environment.
You need one or more for QA.

**Youngstar:** But probably not that fancy.

**Graybeard:** Yup. So make sure to parameterize everything - cluster size,
machine type ...

**Youngstar:** What about [Docker][docker]?

**Graybeard:** Docker helps in some aspects - it takes you out of dependency
hell. However it comes with another level of orchestration.

**Youngstar:** TANSTAAFL?

**Graybeard:** Exactly. Docker is also let's you create a copy of production
environment on your local machine, which is handy.

**Youngstar:** Anything else?

**Graybeard:** A nice thing is to mark deployment times on your monitoring
graphs. This way is you see a spike in errors it's easy to see if it's related
to a specific release.

**Youngstar:** Just a vertical line?

**Graybeard:** Any way you want, as long as it's visible.

**Youngstar:** OK.

**Graybeard:** Also make you you can do a rollback as well. If a release goes
back you need to be able to quickly get back. Blue-Green and rolling releases
help with this.

**Youngstar:** Don't forget the cute canaries.

**Graybeard:** That's right. They we helpful at the coal mines and they are
helpful now. Every release is a risk.

**Youngstar:** And we don't like risk.

**Graybeard:** Yeah. In ["Keys to SRE"][ksre] Ben Treynor talks about "error
budget". If a deployment went bad and there's down time - it takes out of your
error budget and you release less.

**Youngstar:** Sound reasonable. It seems there's so much infrastructure to build and process to develop.

**Graybeard:** Yeah. And backups which work, and security and ...

**Youngstar:** OK. I get it - ops is a lot of time and money. Final advice
before my head explodes?

**Graybeard:** Get more beer?

**Youngstar:** I mean deployment wise.

**Graybeard:** I usually start with GAE which is zero ops and once things start
to heat up - I look into other platform. Or stay in GAE if it gives me all that
I need.

**Youngstar:** OK. I'll take a good look at my architecture and see if it can
fit in one of the no-ops hosting. And now that beer please.

**Graybeard:** Sure thing.


I> ## TL;DR
I> * Don't underestimate how much operations will cost you in time and money
I> * Pick a solution that will reduce the operations burden
I> * Do your homework. Learn about deployment methods, tools and procedures
I> * Be ready to roll back releases
I> * Mark release in your monitoring tools

[ansible]: https://www.ansible.com/
[blueg]: http://martinfowler.com/bliki/BlueGreenDeployment.html
[canary]: http://martinfowler.com/bliki/CanaryRelease.html
[chef]: http://saltstack.com/
[contdel]: https://en.wikipedia.org/wiki/Continuous_delivery
[docker]: http://docker.com/
[fabric]: http://www.fabfile.org/
[ksre]: https://www.usenix.org/conference/srecon14/technical-sessions/presentation/keys-sre
[lpain]: http://www.aaronsw.com/weblog/dalio
[rolld]: https://en.wikipedia.org/wiki/Rolling_release
[salts]: http://saltstack.com/
[snowf]: http://martinfowler.com/bliki/SnowflakeServer.html
[sre]: https://en.wikipedia.org/wiki/Site_Reliability_Engineer
[terraform]: https://www.terraform.io/
