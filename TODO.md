* Add crash only software to monitoring
* Add github search for AWS keys in security.md
    * `https://github.com/search?q=SECRET_ACCESS_KEY&type=Code`
* Chapter on Learning
    * learning.md (combing with asking questions?)
    * http://aosabook.org
    * coursera
* Career
    * http://pythonwise.blogspot.co.il/2013/09/advice-for-new-managers.html
    * personal brand (joke about writing a book)
    * management vs technical
* Add programmer IO to time.md
* supervisor & restarts in deploy.md
    * crash only software
* Chapter on good code
    * simple
    * speak the language (vodka)
    * small funcs
* Add Yaki's comments to fast.md
    * Before profiling, make sure that the program does what it should be doing
      (if a bug causes it to not go through some important and heavy code
       parts..) and operates in a clean way (does not call the same system function
      10 times instead of once, etc.)
    ( At first I recommend using a time based profiler. This kind of profilers
    show you where the time is spent. This helps you clean your code from all
    kinds idiotic things you do (and didn't know up till now that you were
    doing), use the right data structures and algorithms (replace this nasty n^2
    with an n log n)
    * If you really must, continue with event based profilers (that counts cache
      misses, disk access, whatever). This may lead to some system specific
    optimizations
    * I suggest going to the GPU only when the problem that you are facing can
      be solved in an embarrassingly parallel manner (tens of thousands of
    concurrent threads)
    * There are many profiler types out there, each gives a different view of
      the performance behaviour of your system or application. I suggest that
    you will be familiar with the performance tools available for your platform
    and know which data is presented by which tool.
