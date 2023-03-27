+++
title = "Sentiment analysis is only “somewhat useful”"
date = "2022-09-05"
description = ""
tags = ["nlp"]
+++

I don’t know if anyone learns basic text mining with R, like me. By following this path, one is probably no stranger to sentiment analysis and feels like it is the righteous choice when it comes to decision making when some text data are involved.

Do the sentiment analysis on text data, get the predicted labels, and make the decision. It’s all natural. However, sometimes I just feel like words without context are way too brutal to make a call.

In Rachel Tatman’s blog post [*The trouble with sentiment analysis*](https://makingnoiseandhearingthings.com/2022/04/19/the-trouble-with-sentiment-analysis/):

> First, because it doesn’t work very well and second, because even when it does work it’s usually measuring the wrong thing.

It was not working well because:

> … generally, people tend to care more about what people are feeling than what they’re expressing in text.

So **text != true meaning**.

And sentiments are not that useful, and whenever it is used, people are eyeing something else more useful. For example, the sentiment shown on customer review might not be perfectly correlated to churn.

And why is it still a “thing”?

> Probably one reason is that its often used as an example in teaching. It has a pretty simple intuition, there are lots of existing tools for it and can it help students develop intuitions about corpus methods.
> …
> And another, more pernicious reason, is that it’s harder to define a new problem (for which a tool or measure might not exist) than it is to redefine it as an existing one where an existing, simple-to-use tool is available.

I understand sentiment analysis might be overestimated in many cases, it is still giving out some intuition on “what the overall sentimental flow is about that specific sentence,” especially in terms of formal language, like papers or articles. In these context, we can assume that most of the sentences can be evaluated as sentimental neural, so that one spark of expression, positive or negative, would convey quite a lot of information. Just my thought.
