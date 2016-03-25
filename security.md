# Security

> First rule of computer security: don't buy a computer. Second rule: if you buy
> one, don't turn it on.
> 
>    *- Dark Avenger*

**Youngstar:** I was going over our HTTP logs and found some weird stuff there.

**Graybeard:** ["Little Bobby Tables"][xkmom]?

**Youngstar:** There was some SQJ injection, some trying to run scripts on the
system and other fishy requests. How do I protect myself against such things?

**Graybeard:** One think you need to keep in mind is that if someone is really
targeting you - you will get hacked. Hackers managed to get into NASA, banks and
many other secure places.

**Youngstar:** So I should just give up?

**Graybeard:** Why do you lock your door when you leave the house?

**Youngstar:** So bad people won't be able to get in?

**Graybeard:** And you think that people who rob banks can't get in your house?

**Youngstar:** *They'll* be able to. But I do it to deter most casual thieves.
Oh, I see where you're going with this. I shouldn't make my site an easy target.

**Graybeard:** Exactly. I'll give you some simple rules to follow. Keep in mind
I'm not a security expert.

**Youngstar:** If I had a penny on every thing you're not an expert in...

**Graybeard:** You'll probably have problems carrying all this weight.

**Youngstar:** Ha. OK, rules?

**Graybeard:** First one is to keep things updated, what's called "patching".
Depends on your hosting choice, they usually do a good job patching. But you
should keep track and make sure you're up to date.

**Youngstar:** OK. I'll patch away.

**Graybeard:** Note that some patches require reboots. You need to be ready for
this and plan how to keep things up while rebooting.

**Youngstar:** I remember our talk on "hot deploys".

**Graybeard:** Exactly. Another thing is to make security reviews to your code.
Both as part of code reviews and dedicated security audits. Have someone in
your company in charge of security.

**Youngstar:** Anything special I should look for?

**Graybeard:** Try to think like the bad guy. "How can I break this piece of
code?".

**Youngstar:** Any tools?

**Graybeard:** There are many. One thing people use is "fuzzers". These tools
execute your code with random data, trying to break it.

**Youngstar:** Cool.

**Graybeard:** If you have time and money, you can hire a pentesting team.

**Youngstar:** pentesting?

**Graybeard:** Penetration testing. These companies will try to break into your
site and will give you a report.

**Youngstar:** Like in [Sneakers][sneakers]?

**Graybeard:** Yup.

**Youngstar:** I'll go and watch it again. I love Robert Redford.

**Graybeard:** Should I tell your boyfriend he should be worried?

**Youngstar:** ... Sure, I like to keep him on his toes.

**Graybeard:** The poor guy. I hope he appreciate his luck.

**Youngstar:** Oh man! Let's get back to security please?

**Graybeard:** OK. Use open source.

**Youngstar:** I do, but why?

**Graybeard:** Security experts agree that the only real secure software is one
that was viewed by many people. Of course make sure to pick old reliable code.

**Youngstar:** Like you?

**Graybeard:** I'm human ... sort of.

**Youngstar:** Sure you are.

**Graybeard:** Back to security. Do what you did - monitor your logs. Add some
automation to alert you when something fishy happens. There are software
"tripwires" you can use.

**Youngstar:** OK. You mentioned hosting companies doing patches. Do they do
more?

**Graybeard:** Yeah they do. Some companies, like [CloudFlare][cloudflare] do
exactly that. But they cost, so again "pain vs gain". You need to think how much
each security breach will cost you, not just money but also reputation. Then
prioritize and protect.

**Youngstar:** Oh, I like that slogan.

**Graybeard:** No about secrets...

**Youngstar:** Secrets? I don't have any.

**Graybeard:** Yes you do. You're email password, keys to your hosting provider
and more.

**Youngstar:** Oh these, what about them?

**Graybeard:** How do you keep them safe?

**Youngstar:** I have an encrypted file with [gpg][gpg] with these. The master
password is in my head.

**Graybeard:** And if you have software that need some of these keys?

**Youngstar:** I set it in the environment when deploying.

**Graybeard:** And how does the deploy script knows?

**Youngstar:** It asks me.

**Graybeard:** So it's not fully automated then.

**Youngstar:** Yup. By the way, is `gpg` good enough?

**Graybeard:** It's better than `rot13`.

**Youngstar:** `rot13`?

**Graybeard:** Some people use it. It's a substitution cypher where each letter
is replaced with the letter 13 places after it, in a cyclic manner.

**Youngstar:** And since there are 26 letters in the English alphabet, if you
`rot13` and `rot13` you'll get the original.

**Graybeard:** Yes. Not that secure but I've people use it. You can implement it
with a single `tr` command[^tr].

**Youngstar:** You and your aliases. Let's get back to how can I fully automate
my secrets.

**Graybeard:** Some of the automation systems like [Ansible][ansible] [have
modules][avault] that automate this process, There are [special
databases][hvault] for managing secrets and some companies role their own.

**Youngstar:** NIH syndrome?

**Graybeard:** Probably. Sadly it's a very common syndrome.

**Youngstar:** Any other things I should know?

**Graybeard:** Never forget the social aspect. All the security in the world
won't help if you have passwords on a sticky note, or if people blindly click on
any link sent to them.

**Youngstar:** You mean phishing?

**Graybeard:** Yup. And other social hacks. The key is to be aware, keep
learning and education people.

**Youngstar:** Good paranoid culture, sounds like fun.

**Graybeard:** Nah, just be careful - thats all. You don't think locking your
door makes you a paranoid.

**Youngstar:** You're right. But you told me that only the paranoids survive.

**Graybeard:** That was Andy Grove, not me.

**Youngstar:** Right. Now I'm heading back to my place, and will make sure the
door is locked.

**Graybeard:** Sadly they didn't invent a virtual guard dogs like the beast you
have at home.

**Youngstar:** What do you mean beast? He's a cutie!

**Graybeard:** He is cute, but also very big and scary sometimes.

**Youngstar:** And probably need a walk, I'm out of here.

**Graybeard:** Cheers.


[ansible]: https://www.ansible.com/
[avault]: http://docs.ansible.com/ansible/playbooks_vault.html
[cloudflare]: https://www.cloudflare.com
[sneakers]: http://www.imdb.com/title/tt0105435/
[xkmom]: https://xkcd.com/327/
[gpg]: https://www.gnupg.org/
[hvault]: https://www.vaultproject.io/

[^tr]: `ge '[N-Mn-m]' '[A-MN-Za-mn-z]'`[^tr2]
[^tr2]: The answer of course is encrypted with `rot13` ☺
