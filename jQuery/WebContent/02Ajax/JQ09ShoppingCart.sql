
/* Drop Tables */

DROP TABLE sh_options CASCADE CONSTRAINTS;
DROP TABLE sh_goods CASCADE CONSTRAINTS;
DROP TABLE sh_product_code CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE sh_goods
(
	g_idx number NOT NULL,
	goods_name varchar2(200) NOT NULL,
	goods_price number NOT NULL,
	regidate date DEFAULT sysdate,
	p_code number NOT NULL,
	PRIMARY KEY (g_idx)
);


CREATE TABLE sh_options
(
	op_idx number NOT NULL,
	op_name varchar2(200) NOT NULL,
	op_price number NOT NULL,
	g_idx number NOT NULL,
	PRIMARY KEY (op_idx)
);


CREATE TABLE sh_product_code
(
	p_code number NOT NULL,
	category_name varchar2(30) NOT NULL,
	PRIMARY KEY (p_code)
);



/* Create Foreign Keys */

ALTER TABLE sh_options
	ADD FOREIGN KEY (g_idx)
	REFERENCES sh_goods (g_idx)
;


ALTER TABLE sh_goods
	ADD FOREIGN KEY (p_code)
	REFERENCES sh_product_code (p_code)
;



