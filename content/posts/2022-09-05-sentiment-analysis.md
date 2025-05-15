+++
title = "Sentiment analysis 只是有点用处"
date = "2022-09-05"
description = ""
tags = ["自然语言"]
+++

<details>

<summary>原文 Sentiment analysis is only somewhat useful</summary>

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
</details>

<mark>以下为 GPT-4o 翻译内容：</mark>

我不知道是否有人像我一样用 R 学习基本的文本挖掘。沿着这条路走下去，可能对情感分析并不陌生，并且觉得在涉及一些文本数据的决策时，这是一个正确的选择。

对文本数据进行情感分析，得到预测标签，然后做出决策。这一切都很自然。然而，有时我只是觉得没有上下文的词语太过残酷，无法做出判断。

在 Rachel Tatman 的博客文章 [*情感分析的问题*](https://makingnoiseandhearingthings.com/2022/04/19/the-trouble-with-sentiment-analysis/) 中：

> 首先，因为它效果不佳；其次，即使它有效，通常也在测量错误的东西。

效果不佳是因为：

> ……一般来说，人们往往更关心人们的感受，而不是他们在文本中表达的内容。

所以 **文本 != 真正的意义**。

情感并不是那么有用，每当它被使用时，人们都在关注一些更有用的东西。例如，客户评论中显示的情感可能与客户流失没有完美的相关性。

那为什么它仍然是一个“热点”？

> 可能的一个原因是它经常被用作教学中的例子。它有一个相当简单的直觉，有很多现有的工具可以使用，并且可以帮助学生培养对语料库方法的直觉。
> …
> 另一个更恶劣的原因是，定义一个新问题（可能没有现成的工具或度量标准）比将其重新定义为一个现有的问题（有现成的、易于使用的工具）要难。

我理解情感分析在许多情况下可能被高估了，但它仍然提供了一些关于“特定句子的整体情感流向是什么”的直觉，特别是在正式语言（如论文或文章）中。在这些情况下，我们可以假设大多数句子可以被评估为情感中立，因此一丝表达的火花，无论是积极的还是消极的，都会传达很多信息。只是我的想法。
