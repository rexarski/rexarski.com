+++
title = "Explainability, interpretability, 和一个半成功的尝试"
date = "2022-09-14"
description = ""
tags = ["ml"]
+++

<details>

<summary>原文 Explainability, interpretability, and a half-successful trial</summary>

A [refresher](https://docs.aws.amazon.com/whitepapers/latest/model-explainability-aws-ai-ml/interpretability-versus-explainability.html) on definitions of these two terms:

- **Interpretability**: Understanding why and how the model is generating predictions by interpreting the model’s weights and features. An example would be feature importance.
- **Explainability**: Explaining the model’s behavior in human term even if the model has been a black box all the time and very limited portion of it can be “interpreted”.

Long story short, the task is to measure the explainability of a model. Traditionally, when it comes to explainability with tabular data, we can easily end up with something like [SHapley Additive exPlanations](https://shap.readthedocs.io/en/latest/index.html).

How about an alternative model type? Specifically, a text-based classification model. `shap` actually has a pretty good adaptability in terms of text data. One of my favorite visualization output is the _force plot_  from [this example](https://shap.readthedocs.io/en/latest/example_notebooks/text_examples/sentiment_analysis/Positive%20vs.%20Negative%20Sentiment%20Classification.html).

Another question is: **_How do we compare the explainability between two models with the same goal?_** In other words, how do you know model A _**makes more sense**_ than model B?

If given the pre-condition that both models are trained and tested on the same data, we can probably calculate **the proportion of top n-percentiles of tokens’ sum of absolute SHapley values over the sum of absolute SHapley values of all tokens**.

 The reasoning behind this is: for all tokens’ SHapley values, either positive or negative, is a relative contribution toward the final prediction. So the higher the value, the more decisive it is.

The above is just my immature proposal on how to compare models’ interpretability in terms of SHapley values.
</details>

<mark>以下为 GPT-4o 翻译内容：</mark>

关于这两个术语定义的[回顾](https://docs.aws.amazon.com/whitepapers/latest/model-explainability-aws-ai-ml/interpretability-versus-explainability.html)：

- **Interpretability**：通过解释模型的权重和特征来理解模型为什么以及如何生成预测。一个例子是特征重要性。
- **Explainability**：即使模型一直是一个黑箱，并且其中很少部分可以被“解释”，也要用人类的术语解释模型的行为。

长话短说，任务是衡量模型的可解释性。传统上，当涉及到表格数据的可解释性时，我们很容易想到类似于[SHapley Additive exPlanations](https://shap.readthedocs.io/en/latest/index.html)的东西。

那么另一种模型类型呢？具体来说，是基于文本的分类模型。`shap` 实际上在文本数据方面有相当好的适应性。我最喜欢的可视化输出之一是[这个例子](https://shap.readthedocs.io/en/latest/example_notebooks/text_examples/sentiment_analysis/Positive%20vs.%20Negative%20Sentiment%20Classification.html)中的 _force plot_。

另一个问题是：**_我们如何比较两个具有相同目标的模型的可解释性？_** 换句话说，你怎么知道模型 A _**比模型 B 更有意义**_？

如果假设两个模型都在相同的数据上进行了训练和测试，我们可能可以计算**前 n 个百分位数的 tokens 的绝对 SHapley 值之和占所有 tokens 的绝对 SHapley 值之和的比例**。

其背后的推理是：对于所有 tokens 的 SHapley 值，无论是正值还是负值，都是对最终预测的相对贡献。所以值越高，它就越决定性。

以上只是我关于如何通过 SHapley 值比较模型可解释性的幼稚提议。
