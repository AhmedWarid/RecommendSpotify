<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Recommendation System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #1e1e1e;
            color: #ffffff;
            margin: 0;
            padding: 0;
        }

        h1, h2 {
            color: #1db954;
        }

        form {
            margin-top: 20px;
        }

        label {
            color: #b3b3b3;
        }

        input[type="text"], button {
            padding: 10px;
            border: none;
            background-color: #282828;
            color: #ffffff;
            margin-right: 10px;
            border-radius: 5px;
        }

        button {
            cursor: pointer;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin-bottom: 10px;
        }
    </style>
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
