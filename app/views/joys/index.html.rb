<div class="container">
  <h1>Your Joys</h1>
</div>

<div class="container mt-5">
  <% if @joys.any? %>
    <div class="table-responsive">
      <table class="table">
        <thead>
          <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Fortune</th>
            <th>Genre</th>
            <th>Rating</th>
          </tr>
        </thead>
        <tbody>
          <% @joys.each do |joy| %>
            <tr>
              <td><%= joy.title %></td>
              <td><%= joy.description %></td>
              <td><%= joy.fortune %></td>
              <td><%= joy.genre %></td>
              <td><%= joy.rating %></td>
            </tr>
          <% end %>
        </tbody>
      </table>
    </div>
  <% else %>
    <p>You haven't created any joys yet.</p>
  <% end %>
</div>
