from flask import Flask, request, jsonify
import spotipy
from flask_cors import CORS
from spotipy.oauth2 import SpotifyClientCredentials

app = Flask(__name__)
CORS(app)

@app.route('/recommend', methods=['POST'])
def recommend_songs():
    # Get track name from request
    track_name = request.json.get('track_name')
    client_id = "your client id" 
    client_secret = "your secret id"
    # Initialize Spotipy client
    client_credentials_manager = SpotifyClientCredentials(client_id=client_id, client_secret=client_secret)
    sp = spotipy.Spotify(client_credentials_manager=client_credentials_manager)
    
    # Search for track
    track_results = sp.search(q=track_name, limit=1)
    track_uri = track_results['tracks']['items'][0]['uri']
    
    # Get recommended songs
    recommended_tracks = sp.recommendations(seed_tracks=[track_uri])
    
    # Extract relevant information from recommended tracks
    recommended_song_names = [track['name'] for track in recommended_tracks['tracks']]
    
    # Return recommended songs as JSON response
    return jsonify({'recommended_songs': recommended_song_names})






if __name__ == '__main__':
    app.run(debug=True)