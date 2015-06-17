<#include "../layout.ftl"/>
<@layout>
<head>
    <title>提交作业</title>
</head>
<div>
    <table class="table table-bordered table-fixed table-hover">
        <form method="post" enctype="multipart/form-data" action="/stage/homework/finish">
            <input type="hidden" name="homeworkId" value="${homework.homeworkId!}">
            <legend class="label-primary">作业信息</legend>
            <tr>
                <td style="width: 100px">
                    <b>课程作业</b>
                </td>
                <td>
                ${homework.lessonName!}-${homework.homeworkName!}
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <b>作业内容</b>
                </td>
                <td>
                ${homework.content!}
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <b>作业附件</b>
                </td>
                <td>
                    <a href="/stage/homework/download?uri=${homework.uri!}&fileName=${homework.fileName!}">${homework.fileName!}</a>
                </td>
            </tr>
            <#if finish==0 || finish==null>
                <tr>
                    <td style="width: 100px">
                        <b>学生答案</b>
                    </td>
                    <td>
                    <#--<textarea name="studentAnsewer" cols="100" rows="10"></textarea>-->
                        <input type="file" name="studentFile" required="true">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <button id="submitBtn" type="submit" class="btn btn-primary icon-2x" style="">提交</button>
                    </td>
                </tr>
            <#else>
                <tr>
                    <td><b>学生答案:</b></td>
                    <td>
                        <a href="/stage/homework/download?uri=${stuHomework.uri!}&fileName=${stuHomework.fileName!}">${stuHomework.fileName!}</a>
                    </td>
                </tr>
            </#if>
            <a href="/stage/homework/query" class="btn btn-primary" style="">返回</a>
        </form>
    </table>
</div>
</@layout>
<script src="/js/jquery-1.11.2.min.js"></script>