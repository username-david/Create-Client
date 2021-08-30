<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="/WEB-INF/views/client/taglib.jsp"%>

<html>
<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<link href="<c:url value="/assets/style.css" />" rel="stylesheet" />
</head>

<body>
	<!-- <%-- Color bar. --%> -->
	<div style="height: 30px; background-color: darkcyan;"></div>
	<input type="hidden" id="same_width" value="${clientId }" />
	<c:choose>
		<c:when test="${formType == 'adding'}">
			<c:set var="resource" value="addClientRequest" />
			<c:if test="${count > 0 }">
				<p>
					<spring:message code="message.addingSucceeded" />
				</p>
			</c:if>
			<c:if test="${count == 0 && client ne null}">
				<p>
					<spring:message code="message.addingFailed" />
				</p>
			</c:if>
			<c:if test="${isUsedID > 0 }">
				<p class="error_message">
					<spring:message code="message.idNumberInvalid" />
				</p>
			</c:if>
		</c:when>
		<c:otherwise>
			<c:set var="resource" value="modifyClientExecute" />
			<c:if test="${isIDNumberValid eq false}">
				<p class="error_message">
					<spring:message code="message.idNumberInvalid" />
				</p>
			</c:if>
		</c:otherwise>
	</c:choose>

	<c:if test="${isFututeDate > 0 }">
		<p class="error_message">
			<spring:message code="error.checkDate" />
		</p>
	</c:if>

	<div id="whole">
		<h1 id="page_name">Client ${formType} form</h1>
		<form:form method="POST" action="${resource }" modelAttribute="client">
			<input type="hidden" name="clientId" value="${clientId }" />
			<table>
				<tr>
					<td><label class="required"><spring:message
								code="lbl.firstName" /></label></td>
					<td><form:input type="text" path="firstName" id="same_width"
							required="required" /></td>
				</tr>
				<tr>
					<td><label class="required"><spring:message
								code="lbl.lastName" /></label></td>
					<td><form:input type="text" path="lastName" id="same_width"
							required="required" /></td>
				</tr>
				<tr>
					<td id="top_left"><label class="required"><spring:message
								code="lbl.gender" /></label></td>
					<td><form:select path="genderId" id="genders">
							<c:forEach var="item" items="${genders}">
								<option value="${item.id }"
									${item.id eq client.genderId?'selected' : ''}>${item.genderSymbol}</option>
							</c:forEach>
						</form:select></td>
				</tr>
				<tr>
					<td><label class="required"><spring:message
								code="lbl.dateOfBirth" /></label></td>
					<td><form:input type="date" path="dateOfBirth" id="same_width"
							required="required" /></td>
				</tr>
				<tr>
					<td><label class="required"><spring:message
								code="lbl.identityNumber" /></label></td>
					<td><form:input type="text" path="identityNumber"
							id="same_width" required="required" /></td>
				</tr>
				<tr>
					<td id="top_left"><label class="required"><spring:message
								code="lbl.maritalStatus" /></label></td>
					<td><form:select path="maritalId" id="martialStates">
							<c:forEach var="marital" items="${maritals}">
								<option value="${marital.id }"
									${marital.id eq client.maritalId?'selected' : ''}>${marital.maritalSymbol}</option>
							</c:forEach>
						</form:select></td>
				</tr>
				<tr>
					<td><label class="required"><spring:message
								code="lbl.address" /></label></td>
					<td><form:input type="text" path="address" id="same_width"
							required="required" /></td>
				</tr>
				<tr>
					<td id="top_left"><label class="required"><spring:message
								code="lbl.country" /></label></td>
					<td><form:select path="countryId" id="countries">
							<c:forEach var="country" items="${countries}">
								<option value="${country.id }"
									${country.id eq client.countryId?'selected' : ''}>${country.countrySymbol}</option>
							</c:forEach>
						</form:select></td>
				</tr>
				<tr>
					<td colspan="2"><input id="cancel_btn" type="button"
						value="Cancel" onclick="location.href='/ClientManagement/home'" />
						<input id="save_btn" type="submit" value="Submit" /></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>
<script>
	$('#save_btn').click(function() {
		isNameFilled = $("input[name='movieName']").val();
		if (!isNameFilled) {
			alert("You must enter the field!");
			return false;
		}

		return confirm('Please confirm: OK to continue, Cancel to abort.')
	});
</script>