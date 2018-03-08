# Security

> First rule of computer security: don't buy a computer. Second rule: if you buy
> one, don't turn it on.
> 
>    *- Dark Avenger*

**Youngstar:** I was going over our HTTP logs and found some weird stuff there.

**Graybeard:** ["Little Bobby Tables"][xkmom]?

**Youngstar:** There was some SQL injection, some trying to run script and other
fishy requests. How do I protect myself against such things?

**Graybeard:** One thing you need to keep in mind is that if someone is really
targeting you - you will get hacked. Hackers managed to get into NASA, banks and
many other secure places.

**Youngstar:** So I should just give up?

**Graybeard:** Why do you lock your door when you leave the house?

**Youngstar:** So bad people won't be able to get in?

**Graybeard:** And you think that people who rob banks can't get in your house?

**Youngstar:** *They'll* be able to. But I do it to deter most casual thieves.
Oh, I see where you're going with this. I shouldn't make myself an easy target.

**Graybeard:** Exactly. I'll give you some simple rules to follow. Keep in mind
I'm not a security expert.

**Youngstar:** If I had a penny on every thing you're not an expert in...

**Graybeard:** You'll probably have problems carrying all this weight.

**Youngstar:** Ha. OK, rules?

**Graybeard:** Let's start with the social aspect. All the security in the
world won't help if you have weak passwords, if your computer doesn't ask for
login when you turn it on, if employees write passwords on a sticky note, or
blindly click on any link sent to them.

**Youngstar:** You mean [phishing][phishing]?

**Graybeard:** Yup. And other social hacks. The key is to be aware, keep
learning and educate people.

**Youngstar:** Good paranoid culture, sounds like fun.

**Graybeard:** Nah, just be careful - that's all. You don't think locking your
door makes you a paranoid.

**Youngstar:** You're right. But you told me that only the paranoid survive.

**Graybeard:** That was [Andy Grove][ops], not me.

**Youngstar:** OK. Apart from culture?

**Graybeard:** One more thing about culture is that you need to make security
part of the process. Make security reviews to your code - Both as part of code
reviews and dedicated security audits. Appoint someone in your company to be the
security tsar.

**Youngstar:** Anything special I should look for in those reviews?

**Graybeard:** Try to think like the bad guy. "How can I break this piece of
code?". Read "[The Security Mindset][mindset]" by Bruce Schneier to get some
ideas.

**Youngstar:** OK. What else?

**Graybeard:** We usually think of security in layers. There's network layer,
server layer, deception layer, encryption layer and more. Each has its own set
of tools and practices. Think about the layers that are more valuable and
effective and invest your time there.

**Youngstar:** Deception?

**Graybeard:** Yeah, something called [honeypots][honey].

**Youngstar:** Now I can't get the image of Winnie the Pooh out of my head.

**Graybeard:** Funny, now I can't either. In any case, security is a cat & mouse
game and you need to be updated all the time. One good practice to keep things
patched. Depends on your hosting choice, they usually do a good job patching. But
you should keep track and make sure you're up to date.

**Youngstar:** OK. I'll patch away.

**Graybeard:** Note that some patches require reboots. You need to be ready for
this and plan how to keep things up while rebooting.

**Youngstar:** I remember our talk on "hot deploys". Any security tools I should
familiarize myself with?

**Graybeard:** There are many. A good starting point is what comes with [Kali
Linux][kali].

**Youngstar:** Isn't Kali some Hindu goddess?

**Graybeard:** Envy of the competition?

**Youngstar:** Never envy, always cautious.

**Graybeard:** If you have time and money, you can hire a pentesting team.

**Youngstar:** pentesting?

**Graybeard:** Penetration testing. These companies will try to break into your
site and will give you a report.

**Youngstar:** Like in the [Sneakers][sneakers] movie?

**Graybeard:** Yup.

**Youngstar:** I'll go and watch it again. I love Robert Redford.

**Graybeard:** Should I tell your boyfriend he should be worried?

**Youngstar:** ... Sure, I like to keep him on his toes.

**Graybeard:** The poor guy. I hope he appreciates his luck.

**Youngstar:** Let's get back to security please?

**Graybeard:** OK. Do what you did - monitor your logs. Add some automation to
alert you when something fishy happens. There are several tools for that, the
technical term you're looking for is [SIEM][siem].

**Youngstar:** OK. You mentioned hosting companies doing patches. Do they do
more?

**Graybeard:** Yeah they do, sometimes for free since it's their reputation as
well, sometimes at cost. And there are companies who give security as a
service, [WAF][waf] for example.

**Youngstar:** I'll Google what WAF is. How much should I spend on security?

**Graybeard:** You need to think how much each security breach will cost you,
not just money but also reputation. Then prioritize and protect.

**Youngstar:** Oh, I like that slogan.

**Graybeard:** Now about secrets...

**Youngstar:** Secrets? I don't have any.

**Graybeard:** Sure you do. Your email password, keys to your hosting provider
and more.

**Youngstar:** Oh these, what about them?

**Graybeard:** How do you keep them safe?

**Youngstar:** I have file encrypted with [gpg][gpg] for these. The master
password is in my head.

**Graybeard:** And if you have software that needs some of these keys?

**Youngstar:** I set it in the environment when deploying.

**Graybeard:** And how does the deploy script knows?

**Youngstar:** It asks me.

**Graybeard:** So it's not fully automated then.

**Youngstar:** Yup. By the way, is `gpg` good enough?

**Graybeard:** It's better than `rot13`, which I saw people use.

**Youngstar:** `rot13`?

**Graybeard:** It's a substitution cypher where each letter is replaced with the
letter 13 places after it, in a cyclic manner.

**Youngstar:** And since there are 26 letters in the English alphabet, if you
`rot13` and `rot13` you'll get the original.

**Graybeard:** Yes. Not that secure but I've seen people use it. You can
implement it with a single `tr` command[^tr].

**Youngstar:** You and your aliases. Let's get back to how can I fully automate
my secrets.

**Graybeard:** Some of the automation systems like [Ansible][ansible] [have
modules][avault] that automate this process, There are [special
databases][hvault] for managing secrets and some companies role their own.

**Youngstar:** [NIH syndrome][nih]?

**Graybeard:** Probably. Sadly it's a very common syndrome.

**Youngstar:** Any other things I should know?

**Graybeard:** I think we've covered the major points.

**Youngstar:** Right. Now I'm heading back to my place, and will make sure the
door is locked.

**Graybeard:** Sadly they didn't invent virtual guard dogs like the beast you
have at home.

**Youngstar:** What do you mean by "beast"? He's a cutie!

**Graybeard:** He is cute, but also very big and scary sometimes.

**Youngstar:** And probably needs a walk, I'm out of here.

**Graybeard:** Cheers.

I> ## TL;DR
I> * Get in a security mindset
I> * Appoint someone to be in charge of security
I> * Make security part of your process. Do security audits and look for
I>   violations in code review
I> * Keep software up to date, make sure patches happen
I> * Secure in layers. Invest in the ones that give you the best benefit
I> * If you have money, hire a pentesting team
I> * Have a process to keep secrets


[ansible]: https://www.ansible.com/
[avault]: http://docs.ansible.com/ansible/playbooks_vault.html
[cloudflare]: https://www.cloudflare.com
[gpg]: https://www.gnupg.org/
[honey]: https://en.wikipedia.org/wiki/Honeypot_(computing)
[hvault]: https://www.vaultproject.io/
[kali]: https://www.kali.org/
[mindset]: https://www.schneier.com/blog/archives/2008/03/the_security_mi_1.html
[nih]: https://en.wikipedia.org/wiki/Not_invented_here
[ops]: https://www.amazon.com/Only-Paranoid-Survive-Exploit-Challenge/dp/0385483821
[phishing]: https://en.wikipedia.org/wiki/Phishing
[siem]: https://en.wikipedia.org/wiki/Security_information_and_event_management
[sneakers]: http://www.imdb.com/title/tt0105435/
[waf]: https://www.owasp.org/index.php/Web_Application_Firewall
[xkmom]: https://xkcd.com/327/

[^tr]: `ge '[N-Mn-m]' '[A-MN-Za-mn-z]'`[^tr2]
[^tr2]: The answer of course is encrypted with `rot13` ☺
