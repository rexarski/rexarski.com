+++
title = "climate-plus part 3: task training and reflections"
date = "2023-05-18"
description = ""
tags = ["nlp", "climate"]
+++


## TCFD classification task

In this section, we will briefly discuss the process of fine-tuning a base model, specifically `distilroberta`, using the augmented data collected from our [previous efforts](https://rexarski.com/blog/climate-plus-part-2-data-augmentation/). However, it's important to note that ClimateBERT takes a different approach by initially empowering the base model with a climate-related corpus before fine-tuning it with task-specific data.

In contrast to ClimateBERT's focus on classifying four classes, we aimed to tackle the more ambitious goal of classifying all 11 subclasses in the [TCFD report](https://www.fsb-tcfd.org/recommendations/).

## Factchecking task

Similar to the fact-checking task, we employed a classification approach. The only difference lies in the usage of a special token to connect the claim and evidence, ensuring a cohesive analysis.

## Reflections

Following a hiatus of a few months, the ClimateBERT team [released their latest update](https://www.chatclimate.ai/climatebert) in early May, revealing the data and result models used for five of their downstream tasks. Unfortunately, when we conducted our experiments, we only had access to a limited amount of the data used to fine-tune their models, and their models were not open-source.

Regarding the evaluation metrics for the classification of TCFD subclasses, the results were not ideal but expected. However, by considering a prediction accurate if it correctly identifies the parent class (out of the four categories), the metrics appear quite decent. Additionally, we failed to address the "none" class, which represents any context unrelated to climate issues. It is crucial to avoid misclassifying such instances into any of the four categories.

To summarize our exploration, we identified three potential areas for improvement in future research:

1. Increase the quantity of data. The more data available, the better the model's performance.
2. Enhance computational power. We only utilized Google Colab's free-tier GPU for our experiments. Considering the resource-intensive nature of language models, more powerful computational resources would likely yield improved results.
3. Refine the data for TCFD classification. It would be beneficial to acquire more detailed data that includes a "none" class, reflecting real-life scenarios where the majority of input texts are unrelated to the specific issue of interest. Additionally, incorporating human assessment to validate the legitimacy of our augmented data would enhance the overall quality of the dataset.
