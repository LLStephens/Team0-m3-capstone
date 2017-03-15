<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />


<h2>Your 5 day forecast</h2>

<div class="forecast">
<form method="GET" action="${formAction}">
	<div class = "formInputGroup">
		<label for="temp">Temperature Unit: </label>
		<c:choose>
			<c:when test="${tempUnit=='farenheit'}">
				<input type = "hidden" name="tempUnit" value="celsius"/>
				<input type="submit" value="Change to Celsius"/>
			</c:when>
			<c:otherwise>
				<input type = "hidden" name="tempUnit" value="farenheit"/>
				<input type="submit" value="Change to Farenheit"/>
			</c:otherwise>
		</c:choose>
	<input type = "hidden" name="parkCode" value="${param.parkCode}"/>
	</div>
</form>
	
<table>
	<tr>
		<td>Day</td>
		<td>Low</td>
		<td>High</td>
		<td>Forecast</td>
		<td>Recommendations</td>
	</tr>
<c:forEach var="forecast" items="${forecastList}">
<tr>
	<td><c:out value="${forecast.fiveDayForecastValue}" /></td>
	<c:choose>
		<c:when test = "${tempUnit=='farenheit'}">
			<td><c:out value="${forecast.low}" />f</td>
			<td><c:out value="${forecast.high}" />f</td>
		</c:when>
		<c:otherwise>
			<td><fmt:formatNumber type="number" 
            maxFractionDigits="2" value="${(forecast.low-32)*5/9}" /></td>
			<td><fmt:formatNumber type="number" 
            maxFractionDigits="2" value="${(forecast.high-32)*5/9}" /></td>
		</c:otherwise>
	
	</c:choose>
	<ul>
	<td><c:out value="${forecast.forecast}" /></td>
	<td><c:if test="${forecast.high>75}">
		<li>-Bring an extra gallon of water</li>
	</c:if>
	<c:if test="${forecast.high-forecast.low > 20}">
		<li>-Wear breathable layers</li>
	</c:if>
	<c:if test="${forecast.low<20}">
		<li>-Don't freeze!!!!</li>
	</c:if>
	<c:if test="${forecast.forecast=='snow'}">
		<li>-Pack snowshoes</li>
	</c:if>
	<c:if test="${forecast.forecast=='rain'}">
		<li>-Pack rain gear and wear waterproof shoes</li>
	</c:if>
	<c:if test="${forecast.forecast=='thunderstorms'}">
		<li>-Seek shelter and avoid hiking on exposed ridges</li>
	</c:if>
	<c:if test="${forecast.forecast=='sun'}">
		<li>-Pack sunblock</li>
	</c:if>
	</ul>
	</td>
</tr>
</c:forEach>
</table>
</div>