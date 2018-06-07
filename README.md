# TrackStar

**TrackStar is an analytics tracking service that includes:**
  * A client-side JavaScript snippet that allows a user to track events on their website.
  * A server-side API that captures and saves those events to a database.
  * A Rails application that displays the captured event data for a user.

## Languages and Frameworks:
  * Rails version 5.1.2
  * Ruby version 2.2.1
## Databases:
  * SQLite (Test, Development)</li>
  * PostgreSQL (Production)</li>
## Development Tools and Gems include:
  * BCrypt for secure passwords
  * SendGrid for email confirmation
  * Faker for seed data
  * Chartkick for data graphs
  * Groupdate for line charts with historical data

## Get Started with TrackSmart
  * Sign up for a TrackStar account
  * Register your application with TrackStar
  * Add the following Javascript Snippet to your apps `application.js` file:
```
var trackstar = {};
trackstar.report = function(eventName){
  // create an event JSON object to send to the TrackStar analytics service
  var event = {event: { name: eventName }};
  // initialize a new XMLHttpRequest() (AJAX request)
  var request = new XMLHttpRequest();
  // set the HTTP method to POST, the url of our events endpoint, and allow the request to run asynchronously
  request.open("POST", "http://localhost:3000/api/events", true);
  // set the request Content-Type header to 'application/json'
  request.setRequestHeader('Content-Type', 'application/json');
  // send the request
  request.send(JSON.stringify(event));
};
```
  * Now, you can now call this function to help you track events such as click events:
```
<a href="/about" onclick="trackstar.report('about link clicked')">
```
```
<li><%= link_to "Your Tab", root_path, :onclick => "trackstar.report('home link clicked')" %></li>
```
  or even execute when a page is loaded:
```
<script>trackstar.report('about page loaded');</script>
```
