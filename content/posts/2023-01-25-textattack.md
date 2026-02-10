---
title: "使用 TextAttack 进行对抗性攻击"
date: "2023-01-25"
description: "介绍如何利用 TextAttack 工具在自然语言处理任务中进行对抗性攻击，并评估模型的鲁棒性。"
tags: ["自然语言"]
---

<details>

<summary>原文 Adversarial attacks with TextAttack</summary>

> A companion slides can be found [here](https://gamma.app/embed/ixlmda005wxpxfg).

Imagine you have just developed a state-of-the-art natural language processing model for sentiment analysis. Your model is able to accurately predict the sentiment of a given text with high accuracy. However, in the real world, it's not just about how well a model performs on correctly labeled data, but also how it handles inputs that have been specifically designed to fool it.

In this presentation, we will cover the basics of adversarial examples in NLP, demonstrate how to use TextAttack to perform an attack, and discuss adversarial robustness as a metric for evaluating model security.

## A friendly role-play

I had a chat with [ChatGPT](https://chat.openai.com/) yesterday and asked it to role-play as a sentiment analysis model.

![](/images/posts/adversarial-01.jpg)

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

![](/images/posts/adversarial-02.jpg)

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

</details>

<mark>以下为 GPT-4o 翻译内容：</mark>

> 可在[这里](https://gamma.app/embed/ixlmda005wxpxfg)找到相关幻灯片。

想象一下，您刚刚开发了一个用于情感分析的最先进的自然语言处理模型。您的模型能够以高准确率预测给定文本的情感。然而，在现实世界中，问题不仅仅在于模型在正确标记的数据上的表现如何，还在于它如何处理那些被专门设计来欺骗它的输入。

在本次演示中，我们将介绍NLP中对抗性样本的基础知识，演示如何使用TextAttack进行攻击，并讨论对抗性鲁棒性作为评估模型安全性的指标。

## 友好的角色扮演

昨天我和[ChatGPT](https://chat.openai.com/)进行了交谈，让它扮演情感分析模型的角色。

![](/images/posts/adversarial-01.jpg)

看起来我骗了一次，但没骗两次。我试图喂给ChatGPT的“拼写错误”被称为**对抗性样本**。

## 什么是对抗性？

计算机视觉的对抗性样本：

![img](https://textattack.readthedocs.io/en/latest/_images/pig_airliner.png)

更一般地：

| 术语             | 描述                                               |
| ---------------- | -------------------------------------------------- |
| **对抗性样本**   | 用于欺骗机器学习模型的输入。[^1]                   |
| **对抗性扰动**   | 作为对良性输入的更改而制作的对抗性样本。           |
| **对抗性攻击**   | 生成对抗性扰动的方法。                             |
| **对抗性鲁棒性** | 评估模型在输入的小变化下做出正确预测的灵活性指标。 |

## TextAttack[^2]

NLP中的对抗性攻击涉及制作输入（文本）以欺骗模型做出错误预测。这就是[TextAttack](https://github.com/QData/TextAttack)的用武之地，它是一个Python包，使得在文本模型上执行这些攻击并分析其结果变得容易。

攻击可以根据两种“相似性”（视觉和语义）分为两类：

![](https://textattack.readthedocs.io/en/latest/_images/mr_aes.png)

另一个极端的例子：

![](/images/posts/adversarial-02.jpg)

## 攻击工作流程

![](https://github.com/QData/TextAttack/raw/master/docs/_static/imgs/overview.png)

总结工作流程，我们需要：

1. 使用`model_wrapper`包装模型（称为“受害者”）。
2. 定义包含4个组件（`GoalFunction`、`Constraint`、`Transformation`、`SearchMethod`）的`Attack`对象，或使用预定义的攻击方案[^3]。
3. 创建一个`Attacker`对象，提供数据集并启动攻击。

## 对抗性鲁棒性：一个指标

- 衡量模型在输入的小变化下做出正确预测的灵活性。
- **攻击成功率**和**攻击下的准确率**是TextAttack中两个常见的鲁棒性度量。前者是*攻击后做出不一致预测的百分比*。
- 有关*对抗性鲁棒性*的更详细介绍可以在[这里](https://adversarial-ml-tutorial.org/introduction/)找到。

## 演示

在`sklearn`模型上进行TextAttack的[快速演示](https://colab.research.google.com/drive/1T9dXwhyNjn85A1jyPJ_3nnlggItM2t14?usp=sharing)+命令行使用攻击方案的用例。

一些关键点：

- 涉及的两个模型分别是`sklearn`的`LogisticRegression`，在IMDB电影评论数据集的词袋统计和tf-idf统计上进行训练。
- TextAttack包括一个内置的模型包装器`SklearnModelWrapper`用于`sklearn`模型。对于其他不支持的模型，我们需要从头开始构建包装器。（这是[一个例子](https://textattack.readthedocs.io/en/latest/2notebook/Example_2_allennlp.html)。）
- 一旦包装器准备就绪，在受害者模型上应用`attack_recipe`对象`TextFoolerJin2019`。
- 从`rotten_tomatoes`数据集中加载样本数据并开始攻击。

这可能需要一段时间，但结果非常明显：

| 攻击结果             |        |
| :------------------- | :----- |
| 成功攻击的数量：     | 5      |
| 失败攻击的数量：     | 0      |
| 跳过攻击的数量：     | 5      |
| 原始准确率：         | 50.0%  |
| 攻击下的准确率：     | 0.0%   |
| 攻击成功率：         | 100.0% |
| 平均扰动词百分比：   | 6.08%  |
| 每个输入的平均词数： | 19.5   |
| 平均查询次数：       | 57.6   |

- 另一个用例是直接在命令行中调用攻击方案：

```bash
textattack attack --model bert-base-uncased-sst2 --recipe textfooler --num-examples 20
```

这可以翻译为：使用[TextFooler](https://textattack.readthedocs.io/en/latest/3recipes/attack_recipes.html#textfooler-is-bert-really-robust)方案攻击一个预训练的[BERT-uncased模型](https://huggingface.co/textattack/bert-base-uncased-SST-2)，专门针对数据集[*The Stanford Sentiment Treebank*](https://huggingface.co/datasets/sst2)（sst2），并给出20个例子。根据方案和例子的数量，这可能需要更多时间。

## 结语

TextAttack的一个非常突出的特点是其可重复性。例如，我们可以从A和B的论文中提取搜索方法，而不改变其他任何东西。换句话说，组件是可互换的，以便进行受控实验。此外，预训练模型为研究社区提供了基准。

但故事不应止于此。就像我们不应该对F1分数感到满意一样。回到训练过程，结合[对抗性训练](https://adversarial-ml-tutorial.org/adversarial_training/)并推动模型鲁棒性的边界，自然是下一步。但这又是另一个故事。

![](https://miro.medium.com/max/1400/0*dQNOGdJTPrkdCtUP)

## 参考资料

- [对抗性鲁棒性 - 理论与实践](https://adversarial-ml-tutorial.org/) (2018)，来自CMU的教程。
- [对抗性鲁棒性工具箱](https://adversarial-robustness-toolbox.org/)，一个用于ML安全性的Python库。[文档](https://adversarial-robustness-toolbox.readthedocs.io/en/latest/)。
- [NLP中的对抗性样本是什么？](https://towardsdatascience.com/what-are-adversarial-examples-in-nlp-f928c574478e)
- [您需要了解的关于NLP中对抗性训练的一切](https://medium.com/analytics-vidhya/everything-you-need-to-know-about-adversarial-training-in-nlp-b249301b6229)
- [通过信息瓶颈提高NLP模型的对抗性鲁棒性](https://arxiv.org/abs/2206.05511)
