package websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/ChatServer02")
public class ChatServer02 {
	
	/*
	 해당 Set컬렉션은 클라이언트가 접속할때마다 세션ID를 저장하므로 static으로 선언된다.
	 접속한 웹브라우저가 웹소켓을 지원해야 하며 웹브라우저를 닫으면 Onclose가 호출된다.
	 Collections클래스의 synchronizedSet() 메소드는 공유객체에 동시접근을 막도록
	 동기화 하는 역할을 담당한다.
	 */
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
			
	@OnOpen
	public void onOpen(Session session) {
		//Set컬렉션에 사용자 세션 아이디를 추가한다.
		clients.add(session);
		System.out.println("연결되엇습니다....");
		System.out.println("Open session id:"+session.getId());
		System.out.println("session.getBasicRemote():"+ session.getBasicRemote());
	}
	
	@OnClose
	public void onClose(Session session) {
		//Set컬렉션에 사용자세션을 삭제한다.
		clients.remove(session);
		System.out.println("종료되었습니다..");
	}
	
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(session.getId()+":"+ message);
		synchronized (clients) {
			//Set컬렉션에 저장된 모든 클라이언트에게 메세지를 전송한다.
			for(Session client : clients) {
				if(!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
		
	}
	
	@OnError
	public void onError(Throwable e) {
		e.printStackTrace();
	}
	
}
