<h1>Your Joys</h1>

<% if @joys.any? %>
  <table>
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
<% else %>
  <p>You haven't created any joys yet.</p>
<% end %>
