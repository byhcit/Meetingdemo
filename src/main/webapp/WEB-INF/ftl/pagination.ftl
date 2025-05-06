<#macro pagination pageNum pageSize total totalPages url>
    <div class="pagination">
        <#if pageNum gt 1>
            <a href="${url}?pageNum=${pageNum - 1}&pageSize=${pageSize}">上一页</a>
        </#if>
        
        <#list 1..totalPages as p>
            <#if p == pageNum>
                <span class="current">${p}</span>
            <#else>
                <a href="${url}?pageNum=${p}&pageSize=${pageSize}">${p}</a>
            </#if>
        </#list>
        
        <#if pageNum lt totalPages>
            <a href="${url}?pageNum=${pageNum + 1}&pageSize=${pageSize}">下一页</a>
        </#if>
        
        <span class="page-info">
            共 ${total} 条记录，每页显示 
            <select class="page-size-select" onchange="changePageSize(this.value)">
                <option value="10" <#if pageSize == 10>selected</#if>>10</option>
                <option value="20" <#if pageSize == 20>selected</#if>>20</option>
                <option value="30" <#if pageSize == 30>selected</#if>>30</option>
            </select>
            条，当前第 ${pageNum}/${totalPages} 页
        </span>
    </div>

    <script>
        function changePageSize(size) {
            window.location.href = '${url}?pageNum=1&pageSize=' + size;
        }
    </script>
</#macro> 