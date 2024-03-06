+++
title = "ideas"
menu = "main"
+++

## ideas

<strong style="font-family:Wavefont;font-size:32pt">
It has been said that "all models are wrong but some models are useful." In other words, any model is at best a useful fiction—there never was, or ever will be, an exactly normal distribution or an exact linear relationship. Nevertheless, enormous progress has been made by entertaining such fictions and using them as approximations.</strong>

<div id="progress"></div>
<script>
let now = new Date();
let startOfYear = new Date(now.getFullYear(), 0, 1);
let endOfYear = new Date(now.getFullYear(), 11, 31);
let totalDays = Math.round((endOfYear - startOfYear) / (1000 * 60 * 60 * 24));
let passedDays = Math.round((now - startOfYear) / (1000 * 60 * 60 * 24));
let percentage = Math.round((passedDays / totalDays) * 100);
let progressBar = "";
for (var i = 0; i < 50; i++) {
    if (i < percentage / 2) {
        progressBar += "■";
    } else {
        progressBar += "□";
    }
}
document.getElementById('progress').innerText = "progress: " + progressBar + " " + percentage + "%";
</script>

***
