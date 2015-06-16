<#macro layout>
<html>
<head class="device-desktop scream-desktop-wide">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/css/zui-theme.css" rel="stylesheet">
    <link href="/css/zui.css" rel="stylesheet">
    <link href="/css/doc.css" rel="stylesheet">
    <link href="/css/zui.datatable.css" rel="stylesheet">
</head>
<body class="doc-controls with-navbar">
<script src="/js/jquery-1.11.2.min.js"></script>
<script src="/js/zui.js"></script>
<script src="/js/doc.js"></script>
<header data-tab="controls">
    <nav id="navbar" class="navbar navbar-fixed-left navbar-collapsed navbar-inverse" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collpase" data-target="#navbar-collapse"></button>
            <a href="/stage/security/home.html" class="navbar-brand"><i id="home" class="icon-home"
                                                                        style="font-size: 20">主 页</i></a>
        </div>
        <div id="navbar-collapse" class="collapse navbar-collapse nav-pills">
            <ul class="nav navbar-nav">
                <li id="message" class="main"><a href="/stage/inform/message/query"><span>查看通知</span></a></li>
                <li id="homework" class="main"><a href="/stage/homework/query"><span>在线作业</span></a></li>
                <li id="exam" class="main"><a href="/stage/exam/query"><span>在线考试</span></a></li>
                <li id="grade" class="main">
                    <a href="/stage/grade/query?type=2" class="dropdown-toggle" data-toggle="dropdown">成绩查询</a>
                </li>
                <li id="download" class="main"><a href="/stage/download/material/query"><span>资料下载</span></a></li>
                <li id="talk" class="main"><a href="/stage/talk/query?type=0"><span>在线交流</span></a></li>
            </ul>
        </div>
    </nav>
</header>
<div id="main" class="panel">
    <div class="jumbotron text-center" style="background-image: url('/image/2.jpg')">
        <br>
        <br>.
    </div>
    <div>
        <#nested />
    </div>
</div>
<div class="text-center">
    @版权所有:麻晓刚
</div>
</body>
</html>
</#macro>
