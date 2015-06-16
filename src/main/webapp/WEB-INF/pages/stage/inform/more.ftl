<div class="modal-dialog modal-lg">
    <div class="modal-header" style="text-align: center">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span>
        </button>
        <h2 class="modal-title">${message.title}</h2>
        <hr>
        <div style="padding-bottom: 10px">
            <div style="float: left">
                <b>发布人：</b>${message.teacherName}
            </div>
            <div style="float: right">
                <b>发布日期：</b>${message.createDate?string("yyyy-MM-dd")}
            </div>
        </div>
    </div>
    <div class="modal-body">
        <div>
            <strong style="font-size: 15">通知内容：</strong>:
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;${message.content}
            </p>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn-primary" data-dismiss="modal">关闭</button>
    </div>
</div>
