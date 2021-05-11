<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@page import="member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="bookshop.DAO.BuyDAO"%>
<%@page import="bookshop.VO.BuyVO"%>

				<%
					Member vo = (Member) request.getSession().getAttribute("loginMember");
					String id = vo.getId();
				%>
				<%
					List<BuyVO> buyLists = null;
					BuyVO buyList = null;
					int count = 0;
					int number = 0;
					int number2 = 0;
					int total = 0;
		
					if (session.getAttribute("loginMember") == null) {
						response.sendRedirect("#");
					} else {
					BuyDAO buyProcess = BuyDAO.getinstance();
					count = buyProcess.getListCount(id);
		
					if (count == 0) {
				%>
					<p>구매 목록이 없습니다.</p>
				<%
					} else {
					buyLists = buyProcess.getBuyList_id(id);
				%>
				<table border="1" style="border-collapse: collapse">
					<tr>
						<th>번호</th>
						<th>영상 이름</th>
						<th>판매가격</th>
					</tr>
						<%
					for (int i = 0; i < buyLists.size(); i++) {
							buyList = buyLists.get(i);

				%>
					
					<tr>
						<td align="center"><%=++number2%></td>
						<td align="left"><img
							src="../imageFile/<%=buyList.getVimage()%>" width="30"
							height="50" align="middle"> <%=buyList.getVtitle()%></td>
						<td>
							<%
								total += 1 * buyList.getBuyprice();
							%> \ <%=NumberFormat.getInstance().format(buyList.getVprice())%>
						</td>
					</tr>

					<%
						}
					%>
				</table>
				<%
					}
				}
				%>
