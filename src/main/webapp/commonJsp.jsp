<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
    document.oncontextmenu = function(){
        event.returnValue = false;
    }
    // 或者直接返回整个事件
    document.oncontextmenu = function(){
        return false;
    }

    document.oncopy = function(){
        event.returnValue = false;
    }
    // 或者直接返回整个事件
    document.oncopy = function(){
        return false;
    }

</script>