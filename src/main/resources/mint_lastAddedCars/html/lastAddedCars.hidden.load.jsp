<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<c:set var="statement" value="select * from [mint:car] as car where ISDESCENDANTNODE(car,'${currentNode.resolveSite.path}') order by car.[jcr:created] desc"/> 

<query:definition var="listQuery" statement="${statement}" limit="${currentNode.properties['maxNumber'].long}"/> 

<h2>Latest cars</h2><br/>
<c:set target="${moduleMap}" property="editable" value="false" /> 
<c:set target="${moduleMap}" property="emptyListMessage">  
  <fmt:message key="label.noCarsFound"/> 
</c:set> 
<c:set target="${moduleMap}" property="listQuery" value="${listQuery}" /> 
<c:set target="${moduleMap}" property="subNodesView" value="${currentNode.properties['j:subNodesView'].string}" />

