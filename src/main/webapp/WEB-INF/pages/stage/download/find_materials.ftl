<#include "../layout.ftl">
<@layout>
<html>
<head>
    <title>资料下载</title>
    <link href="/css/zui.min.css" rel="stylesheet">
    <link href="/css/zui.datatable.css" rel="stylesheet">
    <link href="/css/datetimepicker.css" rel="stylesheet">
</head>
<body>
<script src="/js/jquery-1.11.2.min.js"></script>
<script src="/js/zui.min.js"></script>
<script src="/js/zui.datatable.js"></script>
<script src="/js/datetimepicker.js"></script>
<script>
    $(document).ready(
            function () {

                $("th").attr("style", "text-align:center");
                $("tr").attr("style", "text-align:center");
                $("li").removeClass("active");
                $("#download").addClass("active");

                $("#search").click(function (e) {
                    e.preventDefault();
                    $.get("/stage/download/material/query", $("#searchForm").serialize(), function (data) {
                        $("#tbody").replaceWith($(data).find("#tbody"));
                    });
                });
            }
    );
</script>
<div>
    <form id="searchForm">
        <div class="input-group col-sm-4">
            <input type="text" class="form-control" name="materialName" placeholder="材料名称-搜索">
        <span class="input-group-btn">
           <button id="search" type="button" class="btn btn-default"><i class="icon-search"></i>搜索</button>
        </span>
        </div>
        <input type="text" id="pageNoInput" name="pageNo" class="hidden">
    </form>
</div>
<div style="text-align: center">
    <div id="tbody">
        <script>
            $(function () {
                $("#pageSelector").on("change", function (e) {
                    e.preventDefault();
                    var value = $("#pageSelector").val();
                    $("#pageNoInput").attr("value", value);
                    $.get("/stage/download/material/query", $("#searchForm").serialize(), function (data) {
                        $("#tbody").replaceWith($(data).find("#tbody"));
                        $("#pageSelector").val(value);
                    });
                });
            });
        </script>
        <div style="text-align: right;padding-right: 50px">
            <#if Request.page??>
                当前第<i style="color: blue"> ${Request.page.pageNo} </i>页/共<i
                    style="color: blue"> ${Request.page.getTotalPages()} </i> 页
                跳转至:第<select id="pageSelector" name="pageNo">
                <#list 1..Request.page.getTotalPages() as k>
                    <option value="${k}">${k}</option>
                </#list>
            </select>页
            </#if>
        </div>
        <table class="table datatable table-condensed table-striped table-bordered">
            <thead class="text-center">
            <caption style="text-align: left">
                <label class="label label-primary">资料列表</label>
            </caption>
            <tr>
                <th data-width="10">#</th>
                <th>资料名称</th>
                <th>操作</th>
            </tr>
            </thead>
        <tbody>
            <#if Request.materials??>
                <#list Request.materials as material>
                <tr>
                    <td>${material.materialId}</td>
                    <td>
                        <a href="/stage/download/material/download?uri=${material.uri}&fileName=${material.materialName}">${material.materialName}</a>
                    </td>
                    <td>
                        <a href="/stage/download/material/download?uri=${material.uri}&fileName=${material.materialName}">下载</a>
                    </td>
                </tr>
                </#list>
            </tbody>
            </#if>
        </table>
        <nav class="pager">
            <@pager page=page/>
        </nav>
    </div>
</div>
</body>
</html>
</@layout>

