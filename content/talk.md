+++
title = "闲话"
menu = "main"
+++

# <pre>/闲话</pre>

<!-- Your CSS -->
<link href="/js/mastodon-timeline.min.css" rel="stylesheet" />
<body>
    <!-- HTML content -->
    <div id="mt-container" class="mt-container">
        <div class="mt-body" role="feed">
            <div class="mt-loading-spinner"></div>
        </div>
    </div>
    <!-- Your JavaScript -->
    <script src="/js/mastodon-timeline.umd.js"></script>
    <script> // You can initialize the script here
        window.addEventListener("load", () => {
            const myTimeline = new MastodonTimeline.Init({
                instanceUrl: "https://mastodon.social",
                timelineType: "profile",
                userId: "107412208877814644",
                profileName: "@rexarski",
                });
        });
    </script>
</body>
