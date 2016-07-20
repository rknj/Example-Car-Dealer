<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<div id="brands"></div>
 
<script>
(function() {
  // Get all the available brands from Edmunds
  var api = "https://api.edmunds.com/api/vehicle/v2/makes?state=used&view=basic&fmt=json&api_key=jfgv22ewrtga8msh7kwwyyah";
  $.getJSON( api )
    .done(function( data ) {
      var brands = "";
      $.each( data.makes, function( i, make ) {
        brands += make.name + "<br />";
      });
      $( "#brands" ).html( brands );
    });
})();
</script>