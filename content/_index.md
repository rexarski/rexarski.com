#

greetings, traveler! 👋 <img class="avatar" align="right" alt="rexarski's Github avatar" src="https://avatars.githubusercontent.com/u/4172477?s=400&u=9d499524c04758e8b76c69a80fbcbb8aed6c6c09&v=4" />

welcome to this testing ground maintained by Qiū Ruì.

<strong style="font-family:Wavefont;font-size:20pt">
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

## 我是谁？

- 常用 id: rexarski.
- DMV 打工人，stat head.
- 大概爱好 🚶🎷⚽🏀🎮🏎️📊📚
- [澡盆](https://splatoonwiki.org/wiki/Bloblobber)玩家守门员、打工苦手
- SL流派足球经理，专业执教低级别联赛小球队
- TF2 永远的 [combo pyro](https://www.youtube.com/watch?v=3gh47cWmOxI)
- 曾经的「上一次传说就退休」炉石旅人
- 入门卡牌收藏家
- 原力非敏感光剑持有人
- 现实中的[松鼠](https://thevarsity.ca/2003/02/10/breeding-unease-in-queens-park/)召唤师

find me elsewhere: <kbd>[github](https://github.com/rexarski)</kbd> / <kbd>[mastodon](https://mastodon.social/@rexarski)</kbd> / <kbd>[neodb](https://neodb.social/users/rexarski/)</kbd>

***
