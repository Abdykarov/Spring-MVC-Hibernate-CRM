<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<title>List Customers</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
		
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
		
	</head>
	<body>
	<div class="container mt-4">
		<h2 class="bg-success text-center text-white p-3 rounded"><a href="${pageContext.request.contextPath}/customer/list" class="text-white headerLink">CRM - Customer Relationship Manager</a></h2>
		
		<!-- put button: Add Customer -->
		<input type="button" class="btn btn-outline-info" value="Add Customer" onclick="window.location.href='addCustomerForm'; return false;"/>
		<!--  add a search box -->
        <form:form action="search" method="POST" cssClass="form-inline mt-3 mb-4">
			<div class="input-group mb-2 mr-sm-2">
			    <div class="input-group-prepend">
			      <div class="input-group-text"><i class="fa fa-search" aria-hidden="true"></i></div>
			    </div>
			    <input type="text" class="form-control" placeholder="Search Customer Here" name="theSearchName">
			    <input type="submit" value="Search" class="btn btn-info ml-2" />
			</div>
        </form:form>
			<!-- add html table here -->
		<table class="table text-center table-striped mt-3 table-bordered">
			<tr class="table-success">
				<th>#</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
				<th colspan="2">Action</th>
			</tr>
			<!-- loop over and print customers -->
			<c:set var="index" value="0" />
			<c:forEach var="customer" items="${customers }">
				<!-- construct an "update" link with customer id -->
				<c:url var="updateLink" value="/customer/updateCustomerForm">
					<c:param name="customerId" value="${customer.id}"></c:param>
				</c:url>
				
				<!-- construct an "delete" link with customer id -->
				<c:url var="deleteLink" value="/customer/delete">
					<c:param name="customerId" value="${customer.id}"></c:param>
				</c:url>
				
				<c:set var="index" value="${index + 1}" />
				<tr>
					<td>${index}</td>
					<td>${customer.firstName}</td>
					<td>${customer.lastName}</td>
					<td>${customer.email}</td>
					<td>
						<!-- display the update link -->
						<a href="${updateLink}" class="btn btn-info btn-sm">Update</a>
					</td>
					<td>
						<a href="${deleteLink}" class="btn btn-danger btn-sm" onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</body>
</html>