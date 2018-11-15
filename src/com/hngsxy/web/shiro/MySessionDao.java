package com.hngsxy.web.shiro;


import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;



public class MySessionDao extends EnterpriseCacheSessionDAO{
//	
//	 
//    private JdbcTemplate jdbcTemplate = JDBCUtils.jdbcTemplate();
//    
//    private Connection conne =  JDBCUtils.getConnection();
// 
//    //在创建完session之后会调用
//    @Override
//    protected Serializable doCreate(Session session) {
//        System.out.println("doCreate");
//        
//        Serializable sessionId = generateSessionId(session);
//        assignSessionId(session, sessionId);
//        String sql = "insert into my_sessions(id, session,insertTime) values(?,?,now())";
//        jdbcTemplate.update(sql, sessionId, SerializableUtils.serialize(session));
//        JDBCUtils.close();
//        
////        if(session != null && session.getAttribute("isLogin")!=null && session.getAttribute("isLogin").equals("1")) {
////            Serializable sessionId = generateSessionId(session);
////            assignSessionId(session, sessionId);
////            String sql = "insert into my_sessions(id, session,insertTime) values(?,?,now())";
////            jdbcTemplate.update(sql, sessionId, SerializableUtils.serialize(session));
////            JDBCUtils.close();
////        }
//        
//        return session.getId();
//    }
//    //更新session最后访问时间、停止session、设置超时时间、移除属性值时会调用
//    @Override
//    protected void doUpdate(Session session) {
//        System.out.println("doUpdate");
//        if(session instanceof ValidatingSession && !((ValidatingSession)session).isValid()) {
//            return; //如果会话过期/停止 没必要再更新了
//        }
//        String sql = "update my_sessions set session=? where id=?";
//        jdbcTemplate.update(sql, SerializableUtils.serialize(session), session.getId());
//        
//        JDBCUtils.close();
//    }
//    //用户logout、session过期会调用
//    @Override
//    protected void doDelete(Session session) {
//        System.out.println("doDelete");
//        String sql = "delete from my_sessions where id=?";
//        jdbcTemplate.update(sql, session.getId());
//        
//        JDBCUtils.close();
//    }
//    
//    @Override
//    protected Session doReadSession(Serializable sessionId) {
//        String sql = "select session from my_sessions where id=?";
//        List<String> sessionStrList = jdbcTemplate.queryForList(sql, String.class, sessionId);
//        if(sessionStrList.size() == 0) return null;
//        
//        JDBCUtils.close();
//        
//        return SerializableUtils.deserialize(sessionStrList.get(0));
//    }

}
