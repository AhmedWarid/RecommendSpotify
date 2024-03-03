package com.example.demo;


import java.io.*;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import java.net.*;




import jakarta.servlet.http.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import java.net.*;
import java.util.*;

@WebServlet(name = "RecommendationServlet", value = "/RecommendationServlet")
public class RecommendationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String track = request.getParameter("trackName");
        List<String> recommendedSongs = new ArrayList<>();

        try {
            String url = "http://127.0.0.1:5000/recommend"; // Ensure this URL is correct
            URL serverUrl = new URL(url);
            HttpURLConnection connection = (HttpURLConnection) serverUrl.openConnection();
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", "application/json");

            // Construct the JSON payload
            String jsonPayload = "{\"track_name\": \"" + track + "\"}";

            // Write JSON payload to the connection output stream
            try (OutputStream outputStream = connection.getOutputStream()) {
                byte[] input = jsonPayload.getBytes("utf-8");
                outputStream.write(input, 0, input.length);
            }

            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
                    String output;
                    while ((output = br.readLine()) != null) {
                        // Manually parse the JSON response
                        String[] songs = output
                                .replace("{", "")
                                .replace("}", "")
                                .replace("\"recommended_songs\": [", "")
                                .replace("]", "")
                                .replace("\"", "")
                                .split(",");
                        recommendedSongs.addAll(Arrays.asList(songs));
                    }
                }
            } else {
                // Set error message as request attribute
                request.setAttribute("errorMessage", "Failed to get recommendations.");
            }

            connection.disconnect();
        } catch (MalformedURLException e) {
            e.printStackTrace();
            // Set error message as request attribute
            request.setAttribute("errorMessage", "Malformed URL.");
        } catch (IOException e) {
            e.printStackTrace();
            // Set error message as request attribute
            request.setAttribute("errorMessage", "Failed to connect to the server.");
        }

        // Set recommended songs as request attribute
        request.setAttribute("recommendedSongs", recommendedSongs);

        // Forward the request to index.jsp
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}


