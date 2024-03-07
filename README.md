
# Music Recommendation System<br>
This project is a Java EE web application that utilizes the Servlet API to provide music recommendations based on a given track. The application sends a track name inputted by the user to a Flask Python server, which communicates with the Spotify API to retrieve recommendations in the form of a JSON object. The server then sends this JSON object back to the servlet, which parses it and displays the recommendations on the index page.

![Screenshot from 2024-03-07 14-10-04](https://github.com/AhmedWarid/RecommendSpotify/assets/121115963/6169389a-b9bc-4a1d-9e5c-f1f745dd33e2)
# How it Works<br>
User Input: Users input a track name into the provided input field on the web application.<br>
Servlet Communication: The servlet sends the track name to the Flask Python server.<br>
Spotify API Integration: The Flask Python server communicates with the Spotify API to fetch music recommendations based on the provided track.<br>
JSON Response: The Spotify API returns recommendations in the form of a JSON object to the Flask server.<br>
Server Response: The Flask server sends the JSON object back to the servlet.<br>
Parsing and Display: The servlet parses the JSON object and displays the recommendations on the index page of the web application.<br>
# Technologies Used<br>
Java EE<br>
Servlet API<br>
Flask (Python)<br>
Spotify API<br>
# Setup Instructions<br>
Clone the Repository:<br>
git clone https://github.com/AhmedWarid/RecommendSpotify.git<br>
Navigate to the Project Directory:<br>
cd RecommendSpotify<br>
Deploy the Web Application:<br>
Deploy the Java EE web application on a servlet container such as Apache Tomcat.<br>
Start Flask Server:<br>
Navigate to the Flask server directory.<br>
Run the Flask server using the following command:<br>
python app.py<br>
Access the Web Application:<br>
Open a web browser and navigate to the URL where the Java EE web application is deployed.<br>
# Usage<br>
Input a track name into the provided input field.<br>
Click on the "Get Recommendations" button.<br>
The web application will display music recommendations based on the inputted track.<br>
# Contributors
Ahmed Warid
