<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@include file="/WEB-INF/views/client/taglib.jsp"%>

<div style="height: 30px; background-color: darkcyan;"></div>

<div style="margin-bottom: 50px; margin-top: 30px;">

	<form th:action="/modifyClientRequest" method="POST">
		<input type="text" placeholder="Find the client for editing"
			name="clientId" style="margin: 0; height: 25px;"
			onfocus="this.value=''"> <input type="submit" value="Inquire" />
	</form>
</div>
<c:if test="${success ne null }">
${success}
</c:if>
<c:if test="${success eq null }">
<p>Client modifying failed!</p>
</c:if>

<div>
	<c:if test="${client.clientID ne null }">
		<%@include file="/WEB-INF/views/client/clientAddingForm.jsp"%>
	</c:if>
	<c:if test="${client eq null && clientId ne ''}">
		<p>
			<spring:message code="message.clientNotFound" />
		</p>
	</c:if>
	<c:if test="${clientId eq '' }">
		<p>
			<spring:message code="message.noInputForEdit" />
		</p>
	</c:if>
</div>