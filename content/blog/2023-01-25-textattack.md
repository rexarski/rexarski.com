+++
title = "Adversarial attacks with TextAttack"
date = "2023-01-25"
description = ""
tags = ["nlp", "python"]
+++

> A companion slides can be found [here](https://gamma.app/embed/ixlmda005wxpxfg).

Imagine you have just developed a state-of-the-art natural language processing model for sentiment analysis. Your model is able to accurately predict the sentiment of a given text with high accuracy. However, in the real world, it's not just about how well a model performs on correctly labeled data, but also how it handles inputs that have been specifically designed to fool it.

In this presentation, we will cover the basics of adversarial examples in NLP, demonstrate how to use TextAttack to perform an attack, and discuss adversarial robustness as a metric for evaluating model security.

## A friendly role-play

I had a chat with [ChatGPT](https://chat.openai.com/) yesterday and asked it to role-play as a sentiment analysis model.

![](/images/blog/adversarial-01.jpg)

Seems that I fooled it once, but not twice. The "typos" I tried to feed ChatGPT, are called **adversarial examples**.

## Adversarial what?

A computer vision adversarial example:

![img](https://textattack.readthedocs.io/en/latest/_images/pig_airliner.png)

More generally:

| Terminology                  | Description                                                                                                  |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------ |
| **Adversarial example**      | An input designed to fool a machine learning model.[^1]                                                      |
| **Adversarial perturbation** | An adversarial example crafted as a change to a benign input.                                                |
| **Adversarial attack**       | A method for generating adversarial perturbations.                                                           |
| **Adversarial robustness**   | A metric for evaluating model's flexibility in making correct predictions give n small variations in inputs. |

[^1]: [Attacking Machine Learning with Adversarial Examples](https://openai.com/blog/adversarial-example-research/).

## TextAttack[^2]

[^2]: [TextAttack](https://github.com/QData/TextAttack), a Python framework for adversarial attacks, data augmentation, and model training in NLP. [Documentation](https://textattack.readthedocs.io/en/latest/).

Adversarial attacks in NLP involve crafting inputs (text) to fool a model into making incorrect predictions. This is where [TextAttack](https://github.com/QData/TextAttack) comes in, a Python package that makes it easy to perform these attacks on text-based models and analyze their results.

Attacks can be grouped into two categories, based on two 'similarities' (visual and semantical):

![](https://textattack.readthedocs.io/en/latest/_images/mr_aes.png)

Another extreme example:

![](/images/blog/adversarial-02.jpg)

## Attack workflow

![](https://github.com/QData/TextAttack/raw/master/docs/_static/imgs/overview.png)

To summarize the workflow, we need:

1. Wrap the model (called 'victim') with a `model_wrapper`.
2. Define `Attack` object with 4 components (`GoalFunction`, `Constraint`, `Transformation`, `SearchMethod`)[^3], or use pre-defined attack recipes[^4].
3. Create an `Attacker` object, feed the dataset, and initiate the attack.

[^3]: [Four Components of TextAttack Attacks](https://textattack.readthedocs.io/en/latest/1start/attacks4Components.html)
[^4]: This is super cool as we can utilize [Attack Recipes API](https://textattack.readthedocs.io/en/latest/3recipes/attack_recipes.html) and run it directly from command line. ![gif](https://camo.githubusercontent.com/ac4ed19357613a3af9073841808bd36649f1de152d724b6fc3a3c4baf63461b5/68747470733a2f2f6a786d6f2e696f2f66696c65732f7465787461747461636b2e676966)

## Adversarial robustness: a metric

- Measures the model’s flexibility in making correct predictions given small variations in inputs.
- **Attack success rate**, **Accuracy under attack** are two common robustness measures in TextAttack. The former is the *percentage of inconsistent predictions made after the attack.*
- A more detailed introduction to *adversarial robustness* can be found [here](https://adversarial-ml-tutorial.org/introduction/).

## Demo

A [quick demo](https://colab.research.google.com/drive/1T9dXwhyNjn85A1jyPJ_3nnlggItM2t14?usp=sharing) of TextAttack on `sklearn` models + the command line use case with attack recipes.

Some keynote points:

- Two models involved are `sklearn`'s `LogisticRegression` trained on bag-of-words statistics and tf-idf statistics of IMDB movie review dataset respectively.
- TextAttack includes a built-in model wrapper `SklearnModelWrapper` for `sklearn` models. For other unsupported models, we need to build the wrapper from scratch. (Here's [an example](https://textattack.readthedocs.io/en/latest/2notebook/Example_2_allennlp.html).)
- Once the wrapper is ready, apply `attack_recipe` object `TextFoolerJin2019` on the victim model.
- Load sample data from `rotten_tomatoes` dataset and start the attack.

This could take a while, but the result is pretty self-explanatory:

```
+-------------------------------+--------+
| Attack Results                |        |
+-------------------------------+--------+
| Number of successful attacks: | 5      |
| Number of failed attacks:     | 0      |
| Number of skipped attacks:    | 5      |
| Original accuracy:            | 50.0%  |
| Accuracy under attack:        | 0.0%   |
| Attack success rate:          | 100.0% |
| Average perturbed word %:     | 6.08%  |
| Average num. words per input: | 19.5   |
| Avg num queries:              | 57.6   |
+-------------------------------+--------+
```

- Another use case is to directly call attack recipes in command line:

```bash
textattack attack --model bert-base-uncased-sst2 --recipe textfooler --num-examples 20
```

This can be translated to: use [TextFooler](https://textattack.readthedocs.io/en/latest/3recipes/attack_recipes.html#textfooler-is-bert-really-robust) recipe to attack a pre-trained [BERT-uncased model](https://huggingface.co/textattack/bert-base-uncased-SST-2) specifically on the dataset [*The Stanford Sentiment Treebank*](https://huggingface.co/datasets/sst2) (sst2), and give 20 examples. Depending on the recipe and number of examples, this could take even more time.

## Outro

Something about TextAttack that is really outstanding its reproducibility. For example, we could take search methods from paper A and B, without changing anything else. In other words, the components are interchangeable for controlled experiments. Additionally, the pre-trained models have provided benchmarks for the research community.

But the story should never end here. Just like we should never feel satisfied with an F1-score. Getting back to the training procedure, incorporating the [adversarial training](https://adversarial-ml-tutorial.org/adversarial_training/) and pushing the boundary of model robustness is, naturally, the next step. But that's just another story to tell.

![](https://miro.medium.com/max/1400/0*dQNOGdJTPrkdCtUP)

## References

- [Adversarial Robustness - Theory and Practice](https://adversarial-ml-tutorial.org/) (2018), a tutorial from CMU.
- [Adversarial Robustness Toolbox](https://adversarial-robustness-toolbox.org/), a Python library for ML security. [Documentation](https://adversarial-robustness-toolbox.readthedocs.io/en/latest/).
- [What are adversarial examples in NLP?](https://towardsdatascience.com/what-are-adversarial-examples-in-nlp-f928c574478e)
- [Everything you need to know about Adversarial Training in NLP](https://medium.com/analytics-vidhya/everything-you-need-to-know-about-adversarial-training-in-nlp-b249301b6229)
- [Improving the Adversarial Robustness of NLP Models by Information Bottleneck](https://arxiv.org/abs/2206.05511)
