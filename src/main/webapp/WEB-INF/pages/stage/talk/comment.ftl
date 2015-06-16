<div class="modal-dialog">
    <form role="form" id="noteForm" class="form-horizontal" method="post">
        <input type="hidden" name="noteId" value="${note.noteId!}">

        <div class="modal-header" style="text-align: center">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                    class="sr-only">关闭</span>
            </button>
            <h2 class="modal-title">回复</h2>
        </div>
        <div class="modal-body">
            <div>
                <div class="form-group">
                    <label class="col-md-2 control-label">内容</label>

                    <div class="col-md-8">
                        <textarea class="form-control" cols="10" rows="6" name="content"></textarea>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button id="saveComment" type="button" class="btn btn-primary">确认</button>
        </div>
    </form>
</div>
<script src="/js/jquery-1.11.2.min.js"></script>
<script>
    $(document).ready(function () {
        $("#saveComment").click(function (e) {
            {
                $.post("/stage/talk/comment", $("#noteForm").serialize(), function (json) {
                    var data = JSON.parse(json);
                    if (data.success) {
                        alert("保存成功");
                        $("button.close").click();
                        window.location.href = "/stage/talk/view?id=${note.noteId}";
                    }
                    else {
                        alert("跟帖失败,请仔细检查内容");
                    }
                })
            }
        });
    });
</script>
