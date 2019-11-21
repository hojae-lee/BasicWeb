
/* Drop Tables */

DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE board
(
	num  NOT NULL,
	title varchar2(200) NOT NULL,
	content varchar2(2000) NOT NULL,
	postdate date DEFAULT sysdate,
	id varchar2(30) NOT NULL,
	visitcount number(5,0),
	-- 회원테이블에서 pk로 지정된 아이디 컬럼
	id varchar2(30) NOT NULL,
	PRIMARY KEY (num)
);


CREATE TABLE member
(
	-- 회원테이블에서 pk로 지정된 아이디 컬럼
	id varchar2(30) NOT NULL,
	pass varchar2(30) NOT NULL,
	name varchar2(50) NOT NULL,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (id)
);



/* Create Foreign Keys */

ALTER TABLE board
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;



/* Comments */

COMMENT ON COLUMN board.id IS '회원테이블에서 pk로 지정된 아이디 컬럼';
COMMENT ON COLUMN member.id IS '회원테이블에서 pk로 지정된 아이디 컬럼';



