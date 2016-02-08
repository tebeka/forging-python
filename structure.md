# Project Structure

> organizations which design systems ... 
> are constrained to produce designs which are copies of the communication
> structures of these organizations.
> 
> *- Conway's Law*

**Youngstar:** How should I structure my code? I currently have everything in
once directory and it looks messy.

**Graybeard:** I there a problem you're facing?

**Youngstar:** Not really, but I assume I should be more organized.

**Graybeard:** As the bad guy in the very bad movie said: "Assumptions are the
mother of all !#?@ups". (FIXME: link)

**Youngstar:** Which movie was that?

**Graybeard:** IIRC "Under Siege 2"

**Youngstar:** Don't think I saw this one.

**Graybeard:** Trust me - you're not missing anything. But back to your
unproblem. Why are you trying to fix something that you don't think not broken?

**Youngstar:** You're probably right. I'll leave it for now.

**Graybeard:** I didn't say it's not broken. I just said *you* think it's not
broken.

**Youngstar:** OK, enlight me. (FIXME: spell)

**Graybeard:** You have tests?

**Youngstar:** Yes, some.

**Graybeard:** How do you make sure they don't get to production?

**Youngstar:** Why shouldn't they?

**Graybeard:** Ask github who were few hours down (FIXME: link) due to test
running in production and deleting tables.

**Youngstar:** Ah, OK.

**Graybeard:** Python has an established way to place files in project. It's not
mandatory but I found it a good practice. Let's assume that the name of your
project is `archer`.

**Youngstar:** Do you have to bring that TV show into everything?

**Graybeard:** Please be quiet, I'm trying to teach you something here. Also I'm
still hurt you didn't take my suggestion for a project name.

**Youngstar:** I'm being quiet.

GrayBeard draws the following diagram on a napkin:

```
archer
├── archer
│   └── __init__.py
├── docs
│   └── Makefile
├── Makefile
├── README.md
├── runtests.py
└── tests
    └── test_archer.py
```

**Graybeard:** Let's go over this. The top `archer` directory is your project.
The second `archer` directory is your Python package. `tests` are *outside* of
the code so they won't get deployed.

**Youngstar:** And the rest of the files.

**Graybeard:** Every project should have a `README` with at least an elevator
pitch. This focuses people on what we're doing here. It should also contain
instructions for developers not founds in the docs

The `docs` directory is the generated documentation, I don't always have docs
other than what's in the code and in the `README`.

**Youngstar:**  `.md` stand for markdown right?

**Graybeard:** Yes. You can also use ReStructuredText or plain text. But
markdown becomes very dominant these days.

**Youngstar:** OK

**Graybeard:** What else? Oh, I usually have a main `Makefile` to automate some
tasks. And *one* script to run all the tests, we'll discuss what's in it when we
talk about testing.

**Youngstar:** OK

**Graybeard:** As said, this is my personal preference which is based on how
many Python projects are structured. You might find another one better for you
but I suggest you start with it.

**Youngstar:** Anything else?

**Graybeard:** Yes, don't over think this and spend too much on it. Start with
something and only if it becomes a problem fix it.

**Youngstar:** That's advice you give for many things.

**Graybeard:** Because it's a good one, and hopefully one day you'll make it a
habit.

**Youngstar:** Let's try with more bear - that might help.

I> ## Summary
I> * Start with an established project structure (like GreaBeard's)
I> * Separate code from tests
I> * Have a `README` with elevator pitch and development instructions
I> * Use a `Makefile` or other too to automate common tasks
I> * Have *one* script to run the tests


%% vim: ft=markdown spell
