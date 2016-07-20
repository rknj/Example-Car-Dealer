<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
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

<script>
  // Load the available brands
(function() {
  // Get all the available brands from Edmunds
  var api = "https://api.edmunds.com/api/vehicle/v2/makes?state=used&view=basic&fmt=json&api_key=jfgv22ewrtga8msh7kwwyyah";
  $.getJSON( api )
    .done(function( data ) {
      var brands = "";
      $.each( data.makes, function( i, make ) {
        brands += "<option value='" + make.name + "'>"+ make.name +"</option>";
      });
      $( "#brand" ).html( brands );
    });
})();
</script>

<template:tokenizedForm>
<form action="${url.base}${currentNode.path}/*" method="post"> 
  <input type="hidden" name="jcrNodeType" value="mint:car"/> 
  <input type="hidden" name="jcrRedirectTo" value="${url.base}${renderContext.mainResource.node.path}"/>
  <fieldset> 
    <p class="field"> 
      <select id="brand" name="brand" tabindex="1">
      </select>
      <input value="" type="text" size="35" placeholder="Model" id="model" name="model" tabindex="2"/> 
    </p> 
    <p class="field"> 
      <jcr:nodeType name="mint:car" var="type"/>
      
      <c:forEach items="${type.propertyDefinitions}" var="propertyDefinition">
        <c:if test="${propertyDefinition.name eq 'year'}">
          <%@include file="datepicker.jsp" %>
        </c:if>
        <c:if test="${propertyDefinition.name eq 'doors'}">
          <jcr:propertyInitializers var="options" nodeType="${type.name}"
                                    name="${propertyDefinition.name}" 
                                    node="${currentNode}"/>
          <select><!--  id="doors" name="doors"-->
            <c:forEach items="${options}" var="item">
              <option value="${item.value.string}">${item.value.string}</option>
            </c:forEach>
          </select>
        </c:if>
        <c:if test="${propertyDefinition.name eq 'transmission'}">
          <jcr:propertyInitializers var="options" nodeType="${type.name}"
                                    name="${propertyDefinition.name}" 
                                    node="${currentNode}"/>
          <select><!--  id="transmission" name="transmission"-->
            <c:forEach items="${options}" var="item">
              <option value="${item.value.string}">${item.value.string}</option>
            </c:forEach>
          </select>
        </c:if>
      </c:forEach>
      <input value="" type="text" size="35" placeholder="Kms" id="kms" name="kms" tabindex="5"/> 
      <input value="" type="text" size="35" placeholder="Price" id="price" name="price" tabindex="6"/> 
    </p> 
    <p class="field"> 
      <jcr:propertyInitializers var="items" nodeType="mint:car" name="energy"/>
      <select>
        <c:forEach items="${items}" var="item">
          <option value="${item.value.string}">${item.value.string}</option>
        </c:forEach>
      </select>
      <input value="" type="text" size="35" placeholder="Engine" id="engine" name="engine" tabindex="8"/> 
    </p> 
    <p class="field"> 
      <input value="" type="text" size="35" placeholder="Body" id="body" name="body" tabindex="10"/> 
      <input value="" type="text" size="35" placeholder="Exterior" id="exterior" name="exterior" tabindex="11"/> 
      <input value="" type="text" size="35" placeholder="Interior" id="interior" name="interior" tabindex="12"/> 
    </p> 
    <p class="forum_button"> 
      <input type="reset" value="Reset" class="button" tabindex="13"/> 
      <input type="submit" value="Submit" class="button" tabindex="14"/> 
    </p> 
  </fieldset> 
</form> 
</template:tokenizedForm>