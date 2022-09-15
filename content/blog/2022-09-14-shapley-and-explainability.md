+++
title = "Explainability, interpretability, and a half-successful trial"
date = "2022-09-14"
description = ""
tags = ["explainability"]
+++

A [refresher](https://docs.aws.amazon.com/whitepapers/latest/model-explainability-aws-ai-ml/interpretability-versus-explainability.html) on definitions of these two terms:

- **Interpretability**: Understanding why and how the model is generating predictions by interpreting the model’s weights and features. An example would be feature importance.
- **Explainability**: Explaining the model’s behavior in human term even if the model has been a black box all the time and very limited portion of it can be “interpreted”.

Long story short, the task is to measure the explainability of a model. Traditionally, when it comes to explainability with tabular data, we can easily end up with something like [SHapley Additive exPlanations](https://shap.readthedocs.io/en/latest/index.html).

How about an alternative model type? Specifically, a text-based classification model. `shap` actually has a pretty good adaptability in terms of text data. One of my favorite visualization output is the _force plot_  from [this example](https://shap.readthedocs.io/en/latest/example_notebooks/text_examples/sentiment_analysis/Positive%20vs.%20Negative%20Sentiment%20Classification.html).

Another question is: **_How do we compare the explainability between two models with the same goal?_** In other words, how do you know model A _**makes more sense**_ than model B?

If given the pre-condition that both models are trained and tested on the same data, we can probably calculate **the proportion of top n-percentiles of tokens’ sum of absolute SHapley values over the sum of absolute SHapley values of all tokens**.

 The reasoning behind this is: for all tokens’ SHapley values, either positive or negative, is a relative contribution toward the final prediction. So the higher the value, the more decisive it is.

The above is just my immature proposal on how to compare models’ interpretability in terms of SHapley values.
