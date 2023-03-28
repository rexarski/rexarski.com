+++
title = "climate-plus part 1: scrape TCFD data"
date = "2023-03-28"
description = ""
tags = ["nlp", "web-scraping", "python"]
draft = true
+++

<p align="center">
    <img src="/images/blog/climate-plus-part-1-thumbnail.jpg" alt="Extreme weather events" style="width: 50%;" />
</p>

Hello and welcome to our multi-part blog post on our work-in-progress project, climate-plus. In this project, we are building on top of ClimateBERT, a transformer-based language model fine-tuned for climate-related text, to develop a tool that can classify financial disclosures according to the Task Force on Climate-related Financial Disclosures (TCFD) framework.

One of the first challenges we encountered was acquiring adequate data sources for TCFD classification. Luckily, the TCFD provides example disclosures on their website, which we decided to use as a starting point for our project. However, we quickly realized that scraping these examples was not as straightforward as we had hoped.

<p align="center">
    <img src="/images/blog/climate-plus-part-1-1.jpg" alt="Inspect the element" style="width: 100%;" />
</p>

The table on the TCFD website that lists the example disclosures appears to render fine, but the data is actually dynamically loaded, which meant that we couldn't simply use traditional web scraping tools. Fortunately, we found a solution in Selenium, a tool that automates web browsers and allows us to interact with web pages programmatically.

Using Selenium, we were able to scrape the TCFD website and save the example disclosures as PDF files for later text processing. However, we did encounter some roadblocks along the way. For example, some of the redirect links in the table were invalid, which required additional troubleshooting.

Additionally, we noticed that some of the reports opened as PDF files in a new tab, while others were downloaded directly. This behavior led to diverging results in our scraping efforts, which we will need to address later in the project.

<p align="center">
    <img src="/images/blog/climate-plus-part-1-2.jpg" alt="Invalid pdf files" style="width: 100%;" />
</p>

- Aurizon's [2018 Sustainability Report, p. 21](https://www.aurizon.com.au/-/media/project/aurizon/files/sustainability/sustainability-reports/fy2018-sustainability-report.pdf)
  - Direct download
- AXA Group's [Climate-Related Investment & Insurance Report 2018, p. 9](https://www-axa-com.cdn.axa-contento-118412.eu/www-axa-com%2Fcf61ff6c-ee1d-4dcb-92ba-ed243ae7f2fb_2018+tcfd+full+report+-+final+-+b.pdf#page=9)
  - New tab

After successfully downloading the PDF files, we then parsed them into raw text and saved them for later evidence extraction. In the next part of this series, we will explore the feasibility of using chatGPT to extract top evidence from the raw text of a report, as well as the potential for hallucination of responses from language models. Stay tuned!
