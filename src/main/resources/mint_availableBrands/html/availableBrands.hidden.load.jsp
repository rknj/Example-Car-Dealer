<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<jcr:sql var="cars"
    sql="select * from [mint:car] as car where ISDESCENDANTNODE(car,'${currentNode.resolveSite.path}') order by car.[jcr:created] desc"/>

<h2>Available brands</h2><br/>
<c:forEach items="${cars.nodes}" var="car">
	<h3>${car.properties['brand'].string}</h3>
</c:forEach>             
    