<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/" version="1.0">
  <xsl:output method="xml" omit-xml-declaration="no" indent="yes" doctype-system="" doctype-public=""/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title><xsl:value-of select="rss/channel/title"/> — Web Feed</title>
        <link rel="preconnect" href="https://cdn.jsdelivr.net" crossorigin=""/>
        <style><![CDATA[
          /* The feed page is set entirely in one monospaced pixel face,
             Fusion Pixel 12px (OFL-1.1), Latin and Chinese alike. It is drawn
             on a 12px grid, so every size here is a multiple of 12px. */
          @font-face {
            font-family: 'Fusion Pixel 12px Monospaced SC';
            font-style: normal;
            font-weight: 400;
            font-display: swap;
            src: url('https://cdn.jsdelivr.net/fontsource/fonts/fusion-pixel-12px-monospaced-sc@latest/latin-400-normal.woff2') format('woff2');
          }
          :root {
            color-scheme: light;
            --bg: #ffffff;
            --text: #333333;
            --heading: #111111;
            --muted: #6b6b6b;
            --border: #e5e5e5;
            --accent: #c23b22;
            --font: 'Fusion Pixel 12px Monospaced SC', 'IBM Plex Mono', monospace;
          }
          ::selection { background-color: var(--heading); color: var(--bg); }
          * { box-sizing: border-box; font-synthesis: none; }
          html, body { margin: 0; padding: 0; }
          body {
            font-family: var(--font);
            font-size: 24px;
            line-height: 36px;
            background: var(--bg);
            color: var(--text);
            padding: 36px 0 48px;
            min-height: 100vh;
            overflow-wrap: break-word;
          }
          /* Same shell as the site: one column hugging the left edge. */
          .wrap {
            width: min(100%, calc(clamp(20px, 7vw, 112px) * 2 + 580px));
            margin: 0;
            padding: 0 clamp(20px, 7vw, 112px);
          }
          a { color: inherit; text-decoration: underline; text-decoration-thickness: 2px; text-underline-offset: 4px; }
          a:hover { color: var(--bg); background-color: var(--heading); text-decoration: none; }
          p { margin: 0; }
          .small { font-size: 12px; line-height: 24px; color: var(--muted); }
          .back { margin-bottom: 48px; }
          h1 {
            font-size: 36px;
            line-height: 48px;
            font-weight: 400;
            color: var(--heading);
            margin: 0;
          }
          .tagline { color: var(--muted); }
          .intro { margin-top: 24px; }
          .feed-url { margin: 24px 0 0; }
          .feed-url label { display: block; }
          .feed-url input {
            width: 100%;
            padding: 6px 12px;
            font-family: var(--font);
            font-size: 12px;
            line-height: 24px;
            border: 2px solid var(--heading);
            border-radius: 0;
            background: var(--bg);
            color: var(--heading);
          }
          .feed-url input:focus { outline: none; border-color: var(--accent); }
          h2 {
            font-size: 12px;
            line-height: 24px;
            font-weight: 400;
            color: var(--muted);
            margin: 48px 0 12px;
          }
          ul.item-list { list-style: none; padding: 0; margin: 0; }
          ul.item-list li {
            display: grid;
            grid-template-columns: minmax(0, 1fr) auto;
            column-gap: 24px;
            align-items: baseline;
            padding: 6px 0;
          }
          .item-title a { color: var(--heading); text-decoration: none; }
          .item-date { white-space: nowrap; }
        ]]></style>
      </head>
      <body>
        <div class="wrap">
          <p class="small back">&#x2190; <a href="/">Back to rexarski.com</a></p>

          <h1><xsl:value-of select="rss/channel/title"/></h1>
          <p class="tagline"><xsl:value-of select="rss/channel/description"/></p>

          <p class="small intro">This is a web feed (RSS). Copy the address below into your newsreader to subscribe. New to feeds? <a href="https://aboutfeeds.com/">About Feeds</a> — it’s free!</p>

          <div class="feed-url">
            <label class="small" for="feed-address">Feed address</label>
            <input type="url" id="feed-address" spellcheck="false" readonly="readonly">
              <xsl:attribute name="value"><xsl:value-of select="rss/channel/atom:link[@rel='self']/@href"/></xsl:attribute>
            </input>
          </div>

          <h2>Recent items</h2>
          <ul class="item-list">
            <xsl:for-each select="rss/channel/item">
              <li>
                <p class="item-title">
                  <a>
                    <xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute>
                    <xsl:value-of select="title"/>
                  </a>
                </p>
                <!-- pubDate is RFC 822 ("Sat, 24 Oct 2026 …"); keep the day, month and year. -->
                <p class="small item-date"><xsl:value-of select="substring(pubDate, 6, 11)"/></p>
              </li>
            </xsl:for-each>
          </ul>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
