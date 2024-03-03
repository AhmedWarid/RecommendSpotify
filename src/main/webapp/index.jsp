<%--
  Created by IntelliJ IDEA.
  User: ahmed
  Date: 3‏/3‏/2024
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Recommendation System</title>
</head>
<body>
<h1>Recommendation System</h1>
<form action="RecommendationServlet" method="post">
    <label for="trackName">Enter Track Name:</label>
    <input type="text" id="trackName" name="trackName">
    <button type="submit">Get Recommendations</button>
</form>

<%-- Display the recommendations if available --%>
<%
    // Check if error message is available in request attribute
    Object errorMessageObj = request.getAttribute("errorMessage");
    if (errorMessageObj != null) {
        out.println("<p>Error: " + errorMessageObj.toString() + "</p>");
    } else {
        // Check if recommendations are available in request attribute
        Object recommendedSongsObj = request.getAttribute("recommendedSongs");
        if (recommendedSongsObj != null && recommendedSongsObj instanceof List) {
            List<String> recommendedSongs = (List<String>) recommendedSongsObj;
            // Display recommended songs
%>
<h2>Recommended Songs:</h2>
<ul>
    <% for (String song : recommendedSongs) { %>
    <li><%= song %></li>
    <% } %>
</ul>
<%
} else {
%>
<p>No recommendations available.</p>
<%
        }
    }
%>
</body>
</html>
