# Hi, I'm Ruì Qiū 📊⚽🍜🎷

> Ruì is pronounced as "Ray", not Roo-E.

```r
library(tidyverse)

alias <- 'rexarski'

me_df <- tibble(
    key = c(
        'email',
        'résumé'
    ),
    value = c(
        paste(alias, 'at', 'gmail', 'dot', 'com'),
        sprintf('https://github.com/%s/resume', alias)
    )
)
```

```
> me_df
# A tibble: 2 × 2
  key    value
  <chr>  <chr>
1 email  rexarski at gmail dot com
2 résumé https://github.com/rexarski/resume
```

Things I've been up to:

- Practicing [Zettelkasten](https://en.wikipedia.org/wiki/Zettelkasten) with [Obsidian](https://obsidian.md/).
- Playing [Ring Fit Adventure](https://nintendoswitchsports.nintendo.com/en/) and [Nintendo Switch Sports](https://nintendoswitchsports.nintendo.com/en/).
- Developing young talents in [Football Manager](https://www.footballmanager.com/).
