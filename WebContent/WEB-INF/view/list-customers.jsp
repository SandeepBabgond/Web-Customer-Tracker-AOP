<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>


<head>
<title>List Customer</title>

	<!--  referance our sheet here  -->
	

 <link type="text/css"
	    rel="stylesheet"
	     href="${pageContext.request.contextPath}/resources/css/style.css"/> 
</head>

<body>

	<div id="wrapper">
		<div id="header">
		<h2> CRM- Customer Relation Manager  </h2>
		</div>
	</div>

	<div id="container">
	
		<div id ="content">
		
		
		<!-- Put new button Add Customer -->
		<!-- the line onclick will cal CustController(spring controller mapping)
		class add button is css style to look pretty -->	
		<input type="button" value="Add Customer"
			onclick="window.location.href='showFormForAdd'; return false;"
				class="add-button">
		
		<!--  add a search box -->
			<form:form action="search" method="GET">
				Search customer: <input type="text" name="theSearchName" />
				
				<input type="submit" value="Search" class="add-button" />
			</form:form>
	
	<!-- add out html table -->
		<table>
			<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Email</th>
			<th>Action</th>			
			</tr>	
	<!-- Loop over and print the customers -->
			<c:forEach var="tempCustomer"  items="${customers}">
			
			<!-- Construct an update link with customer id -->
			<c:url var="updateLink" value="/customer/showFormForUpdate">
				<c:param name="customerId" value="${tempCustomer.id}" /> 
			</c:url>
	
	
	        <!-- Construct an update link with customer id -->
			<c:url var="deleteLink" value="/customer/delete">
				<c:param name="customerId" value="${tempCustomer.id}" /> 
			</c:url>
	
	
				<tr>
					<td> ${tempCustomer.firstName} </td>
					<td> ${tempCustomer.lastName} </td>
					<td> ${tempCustomer.email} </td>
					
					<td>
						<!-- display the update link -->
						<a href="${updateLink}">Update</a>
						<!-- display the delete link and below is javascript to pop up  -->
						<a href="${deleteLink}"
							onclick="if(!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
					</td>	
						
				</tr>	
	
			</c:forEach>
		
		</table>
	
	</div>
	
	</div>



</body>

</html>
