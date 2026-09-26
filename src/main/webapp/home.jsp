<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CineVault — Java CI/CD Project</title>
<style>
*{box-sizing:border-box}body{margin:0;background:#08090d;color:#f5f7fb;font-family:Arial,Helvetica,sans-serif}
nav{height:72px;padding:0 7%;display:flex;align-items:center;justify-content:space-between;border-bottom:1px solid #222633;background:#0b0c12}
.logo{font-size:24px;font-weight:800}.logo span{color:#ff4f91}.navtag{color:#8991a3;font-size:13px}
.hero{min-height:470px;padding:90px 8%;display:flex;align-items:center;background:radial-gradient(circle at 80% 25%,#342052 0,#11121a 35%,#08090d 70%)}
.hero h1{font-size:clamp(48px,7vw,82px);line-height:.95;margin:10px 0;letter-spacing:-4px}.hero h1 span{color:#ff4f91}
.hero p{max-width:600px;color:#9ca3b4;font-size:18px;line-height:1.7}.badge{display:inline-block;padding:8px 12px;border:1px solid #34394b;border-radius:30px;color:#c4c9d5;font-size:12px}
.button{display:inline-block;margin-top:20px;padding:13px 18px;border-radius:9px;background:#ff4f91;color:white;font-weight:700}
section{padding:60px 8%}h2{font-size:34px;margin:0 0 25px}.cards{display:grid;grid-template-columns:repeat(3,1fr);gap:20px}
.card{padding:28px;border:1px solid #262a38;border-radius:16px;background:#11131b}.poster{height:170px;border-radius:12px;background:linear-gradient(135deg,#2b1742,#181b28);display:grid;place-items:center;font-size:64px}
.card h3{margin:18px 0 8px}.card p{color:#8f97a9;line-height:1.6}.tech{display:flex;flex-wrap:wrap;gap:10px}
.tech span{padding:10px 14px;border:1px solid #2b3040;border-radius:9px;color:#b9bfcc;background:#0e1017}
.pipeline{margin-top:25px;padding:25px;border:1px solid #282d3b;border-radius:15px;background:#0e1016;font-family:monospace;color:#aeb6c7;line-height:2}
footer{padding:28px 8%;border-top:1px solid #222633;color:#697184}
@media(max-width:700px){.cards{grid-template-columns:1fr}.hero{padding:65px 7%}}
</style></head>
<body>
<nav><div class="logo">🎬 Cine<span>Vault</span></div><div class="navtag">Java • Maven • Tomcat • AWS</div></nav>
<div class="hero"><div>
<span class="badge">JAVA WEB APPLICATION</span>
<h1>Stories.<br><span>Engineered.</span></h1>
<p>CineVault is a lightweight movie showcase created specifically to demonstrate a professional Java CI/CD deployment journey — from Git push to a live Apache Tomcat server.</p>
<a class="button" href="#project">Explore Project ↓</a>
</div></div>
<section id="project"><h2>Featured Collection</h2><div class="cards">
<div class="card"><div class="poster">🚀</div><h3>Neon Horizon</h3><p>Science fiction • 2026<br>★★★★★★★★★☆</p></div>
<div class="card"><div class="poster">🕶️</div><h3>Midnight Protocol</h3><p>Thriller • 2025<br>★★★★★★★★☆</p></div>
<div class="card"><div class="poster">📡</div><h3>The Last Signal</h3><p>Mystery • 2025<br>★★★★★★★★★☆</p></div>
</div></section>
<section><h2>Technology</h2><div class="tech">
<span>Java 21</span><span>Jakarta Servlet</span><span>Maven</span><span>JSP</span><span>Apache Tomcat 10</span><span>GitHub Actions</span><span>AWS EC2</span>
</div><div class="pipeline">GitHub Push → GitHub Actions → Maven Build → WAR → EC2 → Tomcat → Live Application 🚀</div></section>
<footer>🎬 CineVault — Built as an AWS/DevOps portfolio project.</footer>
</body></html>
