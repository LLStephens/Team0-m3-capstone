<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="park">
	<c:forEach var="park" items="${parkList}">
		<c:url var="detail" value="/parkDetail">
			<c:param name="parkCode" value="${park.parkCode}"></c:param>
		</c:url>

		<div>
			<c:url var="parkPicture" value="img/parks/${park.parkCode}.jpg" />

			<a href="${detail}"> <img src="${parkPicture}" /></a>
		</div>
		<div class="park">
			<h4>
				<a href="${detail}"><c:out value="${park.parkName}" /></a>
			</h4>
			<p>
				<c:out value="${park.state}" />
			</p>
			<p>
				<c:out value="${park.parkDescription}" />
			</p>
		</div>

	</c:forEach>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />