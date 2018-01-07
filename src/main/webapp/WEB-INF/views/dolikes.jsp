<%@ page import="zust.model.SChicken" %>
<%@ page import="zust.service.SchickenService" %>
<%@ page import="zust.service.Impl.SchickenServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: lwdky
  Date: 2018/1/7
  Time: 23:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String scId = (String) request.getAttribute("scId");
    SchickenService schickenService = new SchickenServiceImpl();
    SChicken sChicken = schickenService.selectByPK(Integer.parseInt(scId));
    sChicken.setScLike(sChicken.getScLike() + 1);
    schickenService.updateSchicken(sChicken);
%>