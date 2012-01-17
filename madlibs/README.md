# madlibs

The script should ask the user for a series of words, then fill in the proper places in the story using the user's answers. We'll keep our story format very simple, using a ((...)) notation for placeholders. Here's an example:

`Our favorite language is ((a gemstone)).`

If your program is fed that template, it should ask you to enter "a gemstone" and then display your version of the story:

`Our favorite language is Ruby.`

That covers the simple cases, but in some instances we may want to reuse an answer. For that, we'll introduce a way to name them:

`Our favorite language is ((gem:a gemstone)).  We think ((gem)) is better than ((a gemstone)).`

With the above story, your program should ask for two gemstones, then substitute the one designated by ((gem:...)) at ((gem)). That would give results like:

`Our favorite language is Ruby.  We think Ruby is better than Emerald.`

You can choose any interface you like, as long as person can interact with the end result.
