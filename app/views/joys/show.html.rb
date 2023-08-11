<div class="container">
  <h1>Joy Details</h1>
</div>

<div class="container mt-5">
  <div class="fortune-cookie">
    <p><strong>Fortune Cookie:</strong> <%= @joy.fortune %></p>
  </div>

  <div class="joy-info mt-5">
    <div class="joy-contents">
      <ul>
        <li>Title: <%= @joy.title %></li>
        <li>Content: <%= @joy.content %></li>
        <li>Genre: <%= @joy.genre %></li>
        <li>Rating: <%= @joy.rating %></li>
      </ul>
    </div>
  </div>
</div>

<%= link_to 'Back to all my joys', joys_path %>
