+++
title = "climate-plus"
date = "2023-05-18"
description = "记录基于 ClimateBERT 的气候相关文本分类项目，从数据采集、处理到模型微调的全过程与挑战。"
tags = ["自然语言"]
+++

Hello and welcome to our multi-part blog post on our work-in-progress project, [climate-plus](https://github.com/rexarski/climate-plus). In this project, we are building on top of [*ClimateBERT*](https://www.chatclimate.ai/climatebert)[^1], a transformer-based language model fine-tuned for climate-related text, to develop a tool that can classify financial disclosures according to the [*Task Force on Climate-related Financial Disclosures (TCFD)*](https://www.fsb-tcfd.org/) framework.

[^1]: ClimateBERT is a project by [ChatClimate](https://www.chatclimate.ai/). The website has revamped several times since we started this project.

## 1

One of the first challenges we encountered was acquiring adequate data sources for TCFD classification. Luckily, the TCFD provides example disclosures on their website, which we decided to use as a starting point for our project. However, we quickly realized that scraping these examples was not as straightforward as we had hoped.

<p align="center">
    <img src="/images/posts/climate-plus-part-1-1.jpg" alt="Inspect the element" style="width: 100%;" />
</p>

The table on the TCFD website that lists the example disclosures appears to render fine, but the data is actually dynamically loaded, which meant that we couldn't simply use traditional web scraping tools. Fortunately *Selenium* saved the day.

Using Selenium, we were able to scrape the TCFD website and save the example disclosures as PDF files for later text processing. However, we did encounter some roadblocks along the way. For example, some of the redirect links in the table were either invalid or in other formats, which required additional troubleshooting.

After successfully downloading the PDF files, we then parsed them into raw text (if possible), and saved them for later evidence extraction.

In the next part of this series, we will explore the feasibility of using <mark>gpt-3.5</mark> to extract top evidence from the raw text of a report, as well as the potential for hallucination originated from large language models.

## 2

It's been quite a while since the first installment of this humble series. Things happened in the meantime: the team and I presented this project to the cohort; I, again, presented it to my colleagues; and most importantly, the ClimateBERT team updated their website and disclosed both datasets and downstream task models. In other words, our attempt to extend the functionality of ClimateBERT seems to be in vain. Nevertheless, due to computational limitations, we managed to approach the same question in a "lite" manner where we skipped the step to train a LLM with a dedicated climate-related corpus and instead fine-tuned a `distilroberta` directly with some available data.

So this post is mainly about what our data is and how we obtained it.

As mentioned last time, we ended up with a folder of PDF files. Note that some of them are invalid because the original URLs parsed from the table could be faulty. Another issue we faced was that the actual content that contributes to the labels condensed into very few pages in a document. That is to say, the majority of scraped data is redundant.

A quick filtering by examining the size of the files could eliminate the dysfunctional ones. We tried to use the page number (a numeric value or a range) from the scraped table, but the page numbering is extremely inconsistent among the files. For instance, there could be a few Roman numeral pages before the actual "page 1". Therefore, we manually extract the contributing pages from the document. Call it "a labor of love".

Then the question is, **if we want to build a transformer model that classifies sentences into a couple of labels, what do we use for training?" Naturally, we utilize what we have at hand: breaking pages of documents into usable sentences. However, not all sentences are equally informative. Depending on the page layout and parsing method, some "sentences" could make absolutely no sense. Therefore, why not pick some representative ones using gpt-3.5 as long as we provide selection details?

The [TCFD recommendation report](https://assets.bbhub.io/company/sites/60/2021/10/FINAL-2017-TCFD-Report.pdf) defines 4 categories of these disclosures, and under each category, there are further subcategories. We could pass these definitions to the prompt template that interacts with OpenAI's model. Of course, the number of retrieved sentences is fully customizable, and we picked 5 in our case.

- **Governance**: Disclose the organization’s governance around climate-related risks and opportunities.
  - a. Describe the board’s oversight of climate-related risks and opportunities.
  - b. Describe management’s role in assessing and managing climate-related risks and opportunities.
- **Strategy**: Disclose the actual and potential impacts of climate-related risks and opportunities on the organization’s businesses, strategy, and financial planning where such information is material.
  - a. Describe the climate-related risks and opportunities the organization has identified over the short, medium, and long term.
  - b. Describe the impact of climate-related risks and opportunities on the organization’s businesses, strategy, and financial planning.
  - c. Describe the resilience of the organization’s strategy, taking into consideration different climate-related scenarios, including a 2°C or lower scenario.
- **Risk Management**: Disclose how the organization identifies, assesses, and manages climate-related risks.
  - a. Describe the organization’s processes for identifying and assessing climate-related risks.
  - b. Describe the organization’s processes for managing climate-related risks.
  - c. Describe how processes for identifying, assessing, and managing climate-related risks are integrated into the organization’s overall risk management.
- **Metrics and Targets**: Disclose the metrics and targets used to assess and manage relevant climate-related risks and opportunities where such information is material.
  - a. Disclose the metrics used by the organization to assess climate-related risks and opportunities in line with its strategy and risk management process.
  - b. Disclose Scope 1, Scope 2 and, if appropriate, Scope 3 greenhouse gas (GHG) emissions and the related risks.
  - c. Describe the targets used by the organization to manage climate-related risks and opportunities and performance against targets.

The code to generate answers was recycled from another project, "[chitchat](https://github.com/rexarski/chitchat)," that I was working on. I recently added a Streamlit app which now accepts multiple file uploads (compared to some other [tools](https://www.chatpdf.com/) available online, it's a plus for sure).

In this way, we are able to augment our dataset to a usable size of 500+.

## 3

In this section, we will briefly discuss the process of fine-tuning a base model, specifically `distilroberta`, using the augmented data collected from our [previous efforts](https://rexarski.com/posts/climate-plus-part-2-data-augmentation/). However, it's important to note that ClimateBERT takes a different approach by initially empowering the base model with a climate-related corpus before fine-tuning it with task-specific data.

In contrast to ClimateBERT's focus on classifying four classes, we aimed to tackle the more ambitious goal of classifying all 11 subclasses in the [TCFD report](https://www.fsb-tcfd.org/recommendations/).

## 4

Similar to the fact-checking task, we employed a classification approach. The only difference lies in the usage of a special token to connect the claim and evidence, ensuring a cohesive analysis.

## 5

Following a hiatus of a few months, the ClimateBERT team [released their latest update](https://www.chatclimate.ai/climatebert) in early May, revealing the data and result models used for five of their downstream tasks. Unfortunately, when we conducted our experiments, we only had access to a limited amount of the data used to fine-tune their models, and their models were not open-source.

Regarding the evaluation metrics for the classification of TCFD subclasses, the results were not ideal but expected. However, by considering a prediction accurate if it correctly identifies the parent class (out of the four categories), the metrics appear quite decent. Additionally, we failed to address the "none" class, which represents any context unrelated to climate issues. It is crucial to avoid misclassifying such instances into any of the four categories.

To summarize our exploration, we identified three potential areas for improvement in future research:

1. Increase the quantity of data. The more data available, the better the model's performance.
2. Enhance computational power. We only utilized Google Colab's free-tier GPU for our experiments. Considering the resource-intensive nature of language models, more powerful computational resources would likely yield improved results.
3. Refine the data for TCFD classification. It would be beneficial to acquire more detailed data that includes a "none" class, reflecting real-life scenarios where the majority of input texts are unrelated to the specific issue of interest. Additionally, incorporating human assessment to validate the legitimacy of our augmented data would enhance the overall quality of the dataset.
