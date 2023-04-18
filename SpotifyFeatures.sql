/*Let's take a look at the data.*/
SELECT genre, artist_name, track_name, track_id, popularity, acousticness, danceability, duration_ms, energy, instrumentalness, key_type, liveness, loudness, mode, speechiness, tempo, time_signature, valence
FROM SpotifyFeatures;

/*Creating tables to isolate information about features, track information. */
SELECT * FROM SpotifyFeatures
CREATE TABLE IF NOT EXISTS features AS
SELECT track_id, popularity, acousticness, danceability, duration_ms, energy, instrumentalness, key_type, liveness, loudness, mode, speechiness, tempo, time_signature, valence 
FROM SpotifyFeatures
CREATE TABLE tracks AS
SELECT track_id, artist_name, track_name, genre 
FROM SpotifyFeatures

/* Data cleaning: finding null values in the data. */
SELECT
	genre,
	artist_name,
	track_name,
	track_id,
	popularity,
	acousticness,
	danceability,
	duration_ms,
	energy,
	instrumentalness,
	key_type,
	liveness,
	loudness,
	mode,
	speechiness,
	tempo,
	time_signature,
	valence
FROM SpotifyFeatures
WHERE duration_ms IS NULL

/*Analyzing the top 10 most popular songs.*/
/* Finding the top 10 most popualar songs. */
SELECT DISTINCT artist_name, track_id, track_name, danceability, popularity FROM SpotifyFeatures ORDER BY popularity DESC LIMIT 10;
/* Top 10 songs by popularity in its own table for analysis*/
CREATE TABLE IF NOT EXISTS real_top_ten_two AS SELECT DISTINCT * FROM SpotifyFeatures ORDER BY popularity DESC LIMIT 10
SELECT * FROM real_top_ten_two rttt 
/* Finds average danceability of the top 10 most popular songs. */
SELECT avg(danceability) FROM real_top_ten_two


/* Genre analysis*/ 
/* Top 5 most danceable genres. */
SELECT genre, avg(danceability) FROM SpotifyFeatures GROUP BY genre ORDER BY avg(danceability) DESC LIMIT 5
/*Bottom 5 (least danceable) genres */
SELECT genre, avg(danceability) FROM SpotifyFeatures GROUP BY genre ORDER BY avg(danceability) ASC LIMIT 5
/* 5 genres with the longest average duration in miliseconds. */
SELECT genre FROM SpotifyFeatures GROUP BY genre ORDER BY avg(duration_ms) DESC LIMIT 5




