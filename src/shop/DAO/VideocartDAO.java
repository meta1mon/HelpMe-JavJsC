package shop.DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.jdbc.JDBCConnectionPool;
import shop.VO.VideocartVO;

public class VideocartDAO {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	public static VideocartDAO instance = new VideocartDAO();

	public static VideocartDAO getInstance() {
		return instance;
	}

	public int insertVideoCart(Connection conn, VideocartVO videocart) throws Exception {
		int result1 = 0;
		String sql = "insert into videocart (vcid, vid, id,buycount) " + " values ( videocart_seq.nextval, ?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, videocart.getVid());
			pstmt.setString(2, videocart.getId());
			pstmt.setInt(3, videocart.getBuycount());

			result1 = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
		}

		return result1;
	}

	// id에 해당하는 레코드의 수를 얻어내는 메소드
	public int getVideoListCount(Connection conn, String id) throws Exception {
		int x = 0;
		String sql = "select count(*) from videocart where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
		}
		return x;
	}

	// id에 해당하는 레코드의 목록을 얻어내는 메소드
	public List<VideocartVO> getVideoCart(Connection conn, String id) throws Exception {
		List<VideocartVO> videolists = null;
		VideocartVO videocart = null;
		String sql = "select vcid, vimage, vkind, vtitle,vprice,buycount, discountrate, videocart.vid" + " from videocart left join video"
				+ " on videocart.vid = video.vid";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			videolists = new ArrayList<VideocartVO>();

			while (rs.next()) {
				videocart = new VideocartVO();
				videocart.setVcid(rs.getInt("Vcid"));
				videocart.setVid(rs.getString("Vid"));
				videocart.setVimage(rs.getString("vimage"));
				videocart.setVtitle(rs.getString("vtitle"));
				videocart.setBuycount(rs.getInt("buycount"));
				videocart.setVprice(rs.getInt("vprice"));
				videocart.setVkind(rs.getString("vkind"));
				videocart.setDiscountRate(rs.getInt("discountRate"));
				videolists.add(videocart);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
		}
		return videolists;
	}

	// 장바구니 수량 수정
	public int updateVideoCount(Connection conn, int vcid, int count) throws Exception {
		int result = 0;

		String sql = "update videocart set buycount=? where vcid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, vcid);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			// close 안해주면 sendredirect 무한로딩
		}
		return result;

	}

	// 장바구니에서 cart_id에 대한 레코드 삭제하는 메소드
	public int deleteVideoList(Connection conn, int vcid) throws Exception {
		int result = 0;
		String sql = "delete from videocart where vcid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vcid);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
		}

		return result;
	}

	// 장바구니 모두 비우기 메소드
	public int deleteVideoAll(Connection conn, String id) throws Exception {
		int result = 0;
		String sql = "delete from videocart where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
		}

		return result;
	}

}
