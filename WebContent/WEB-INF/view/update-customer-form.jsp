<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Add Customer</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<!-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" /> -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	</head>
	<body>
	<div class="container mt-4">
		<h2 class="bg-success text-center text-white p-3 rounded">CRM - Customer Relationship Manager</h2>
		<h3 class="text-center">Update Customer</h3>
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<p class="text-center"><i class="text-monospace text-info">Fill out the form. Asterisk <i class="fas fa-asterisk"></i> means required.</i></p>
				<hr>
				<form:form action="saveCustomer" modelAttribute="customer" method="POST">
					<!-- need to associate this data with customer id -->
					<form:hidden path="id"/>
					<div class="form-group">
						<label for="firstName">First Name <i class="text-info"><i class="fas fa-asterisk"></i></i></label>
						<form:errors path="firstName" cssClass="text-danger"/>
						<form:input path="firstName" name="firstName" class="form-control"/>
					</div>
					<div class="form-group">
						<label for="lastName">Last Name <i class="text-info"><i class="fas fa-asterisk"></i></i></label>
						<form:errors path="lastName" cssClass="text-danger"/>
						<form:input path="lastName" name="lastName" class="form-control"/>
					</div>
					<div class="form-group">
						<label for="email">Email <i class="text-info"><i class="fas fa-asterisk"></i></i></label>
						<form:errors path="email" cssClass="text-danger"/>
						<form:input path="email" name="email" class="form-control"/>
					</div>
					<input type="submit" value="Save" class="btn btn-info btn-lg btn-block"/>
				</form:form>
			</div>
		</div>
		<a href="${pageContext.request.contextPath}/customer/list" class="badge badge-secondary">Back to List</a>
	</div>
	</body>
</html>