+++
title = "climate-plus part 2: data augmentation"
date = "2023-05-11"
description = ""
tags = ["nlp", "climate"]
+++


It's been quite a while since the first installment of this humble series. Things happened in the meantime: the team and I presented this project to the cohort; I, again, presented it to my colleagues; and most importantly, the ClimateBERT team updated their website and disclosed both datasets and downstream task models. In other words, our attempt to extend the functionality of ClimateBERT seems to be in vain. Nevertheless, due to computational limitations, we managed to approach the same question in a "lite" manner where we skipped the step to train a LLM with a dedicated climate-related corpus and instead fine-tuned a `distilroberta` directly with some available data.

<p align="center">
    <img src="/images/blog/climate-plus-part-2-thumbnail.png" alt="What to do?" style="width: 50%;" />
</p>

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
