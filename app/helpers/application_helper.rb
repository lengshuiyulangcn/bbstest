module ApplicationHelper
	def paging
		'<div class="pagination">
    <ul>
        <li><%=link_to "«","/passages?page=1"%></li>
        <%for i in 1..@num%>
      	<li><%=link_to i,"/passages/?page=#{i}"%></li>
        <%end%>
        <li><%=link_to "»","/passages/?page=#{@num}"%></li>
    </ul>
</div>'
	end
end
