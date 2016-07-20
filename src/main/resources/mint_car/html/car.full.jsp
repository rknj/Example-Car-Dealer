<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<h3>${currentNode.properties['brand'].string}&nbsp;${currentNode.properties['model'].string}&nbsp;(${currentNode.properties['year'].string})</h3>

<h4>Featured</h4>
<ul>
  <li>${currentNode.properties['doors'].long} doors</li>
  <li>${currentNode.properties['kms'].long} kms</li>
  <li>${currentNode.properties['price'].double} €</li>
</ul>

<c:set var="nodeType" value="${fn:replace(currentNode.primaryNodeType, ':', '_')}" />
<h4>Details</h4>
<ul>
  <li><fmt:message key="${nodeType}.energy" /> : <jcr:nodePropertyRenderer name="energy" node="${currentNode}" renderer="resourceBundle"/></li>
  <li><fmt:message key="${nodeType}.engine" /> : ${currentNode.properties['engine'].string}</li>
  <li><fmt:message key="${nodeType}.transmission" /> : ${currentNode.properties['transmission'].string}</li>
  <li><fmt:message key="${nodeType}.body" /> : ${currentNode.properties['body'].string}</li>
  <li><fmt:message key="${nodeType}.exterior" /> : ${currentNode.properties['exterior'].string}</li>
  <li><fmt:message key="${nodeType}.interior" /> : ${currentNode.properties['interior'].string}</li>
</ul>

<c:forEach items="${currentNode.properties['photos']}" var="photo">
  <c:if test="${not empty photo}">
    <c:url value="${photo.node.url}" var="photoUrl" />
    <img src="${photoUrl}" />
  </c:if>
</c:forEach>

<template:tokenizedForm>
<form action="${url.base}${currentNode.path}/*" method="post"> 
  <input type="hidden" name="jcrNodeType" value="mint:carTest"/> 
  <input type="hidden" name="jcrRedirectTo" value="${url.base}${renderContext.mainResource.node.path}"/>
  <fieldset> 
    <p class="field"> 
      <input value="" type="text" size="35" placeholder="Date" id="date" name="date" tabindex="1"/> 
      <input value="" type="text" size="35" placeholder="Email" id="email" name="email" tabindex="2"/> 
      <input value="" type="text" size="35" placeholder="Comment" id="comment" name="comment" tabindex="3"/> 
    </p> 
    <p class="forum_button"> 
      <input type="reset" value="Reset" class="button" tabindex="4"/> 
      <input type="submit" value="Book a test" class="button" tabindex="5"/> 
    </p> 
  </fieldset>
</form>
</template:tokenizedForm>