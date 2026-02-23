<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/" version="1.0">
  <xsl:output method="xml" omit-xml-declaration="no" indent="yes" doctype-system="" doctype-public=""/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title><xsl:value-of select="rss/channel/title"/> — Web Feed</title>
        <link rel="preconnect" href="https://fonts.googleapis.com"/>
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin=""/>
        <link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,400;0,9..40,600;0,9..40,700;1,9..40,400&amp;display=swap" rel="stylesheet"/>
        <style><![CDATA[
          :root {
            --pd-yellow: #FFB800;
            --pd-yellow-soft: #FFE066;
            --pd-yellow-bg: #FFF4CC;
            --pd-black: #1a1a1a;
            --pd-gray: #4a4a4a;
            --pd-white: #fff;
            --font: 'DM Sans', system-ui, sans-serif;
          }
          ::selection { background-color: var(--pd-black); color: var(--pd-yellow); }
          * { box-sizing: border-box; }
          html, body { margin: 0; padding: 0; }
          body {
            font-family: var(--font);
            background: var(--pd-yellow);
            background-image: radial-gradient(circle at 20% 80%, var(--pd-yellow-soft) 0%, transparent 50%),
              radial-gradient(circle at 80% 20%, rgba(255,255,255,0.4) 0%, transparent 40%);
            color: var(--pd-black);
            line-height: 1.6;
            margin: 0;
            padding: 2rem 1.5rem;
            min-height: 100vh;
          }
          .wrap {
            max-width: 42rem;
            margin: 0 auto;
          }
          a { color: var(--pd-black); text-decoration: underline; text-underline-offset: 0.2em; }
          a:hover { color: var(--pd-gray); }
          .back {
            font-size: 0.9rem;
            font-weight: 600;
            margin-bottom: 1.75rem;
          }
          .back a { text-decoration: none; }
          .back a:hover { text-decoration: underline; }
          .intro {
            margin-bottom: 1.5rem;
            color: var(--pd-gray);
            font-size: 0.95rem;
            line-height: 1.65;
          }
          .intro strong { color: var(--pd-black); }
          .card {
            background: var(--pd-white);
            border-radius: 16px;
            padding: 1.5rem 1.75rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 4px 0 var(--pd-black);
            border: 3px solid var(--pd-black);
          }
          h1 {
            font-family: var(--font);
            font-size: 1.75rem;
            font-weight: 700;
            color: var(--pd-black);
            margin: 0 0 0.35rem 0;
            letter-spacing: -0.02em;
          }
          .tagline { color: var(--pd-gray); font-size: 0.95rem; margin: 0 0 0 0; }
          h2 {
            font-family: var(--font);
            font-size: 0.85rem;
            font-weight: 700;
            color: var(--pd-black);
            margin: 0 0 1rem 0;
            text-transform: uppercase;
            letter-spacing: 0.06em;
          }
          .feed-url-wrap { margin: 0; }
          .feed-url-wrap label {
            display: block;
            font-size: 0.8rem;
            font-weight: 600;
            color: var(--pd-gray);
            margin-bottom: 0.5rem;
            text-transform: uppercase;
            letter-spacing: 0.04em;
          }
          .feed-url-wrap input {
            width: 100%;
            padding: 0.65rem 0.85rem;
            font-family: ui-monospace, monospace;
            font-size: 0.9rem;
            border: 3px solid var(--pd-black);
            border-radius: 10px;
            background: var(--pd-yellow-bg);
            color: var(--pd-black);
            font-weight: 500;
          }
          .feed-url-wrap input:focus { outline: none; box-shadow: 0 0 0 3px var(--pd-yellow-soft); }
          ul.item-list { list-style: none; padding: 0; margin: 0; }
          ul.item-list li {
            margin-bottom: 0;
            padding: 1rem 0;
            border-bottom: 2px solid var(--pd-yellow-soft);
          }
          ul.item-list li:last-child { border-bottom: none; }
          .item-title {
            font-family: var(--font);
            font-size: 1.05rem;
            font-weight: 700;
            margin: 0 0 0.2rem 0;
          }
          .item-title a { color: var(--pd-black); text-decoration: none; }
          .item-title a:hover { text-decoration: underline; }
          .item-date {
            font-size: 0.8rem;
            color: var(--pd-gray);
            font-weight: 500;
          }
        ]]></style>
      </head>
      <body>
        <div class="wrap">
          <p class="back">&#x2190; <a href="/">Back to rexarski.com</a></p>
          <p class="intro"><strong>This is a web feed</strong> (RSS). Copy the feed address below into your newsreader to subscribe.</p>
          <p class="intro">New to feeds? <a href="https://aboutfeeds.com/">About Feeds</a> — it’s free!</p>

          <div class="card">
            <h1><xsl:value-of select="rss/channel/title"/></h1>
            <p class="tagline"><xsl:value-of select="rss/channel/description"/></p>

            <div class="feed-url-wrap">
              <label for="feed-address">Feed address (copy to subscribe)</label>
              <input type="url" id="feed-address" spellcheck="false" readonly="readonly">
                <xsl:attribute name="value"><xsl:value-of select="rss/channel/atom:link[@rel='self']/@href"/></xsl:attribute>
              </input>
            </div>
          </div>

          <div class="card">
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
                  <p class="item-date">Published: <xsl:value-of select="pubDate"/></p>
                </li>
              </xsl:for-each>
            </ul>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
